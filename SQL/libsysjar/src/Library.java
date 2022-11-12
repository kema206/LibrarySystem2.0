import java.io.File;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Scanner;

import javax.lang.model.util.ElementScanner14;

import org.hamcrest.core.IsNull;

public class Library
{
    /**
	 * Connection to database
	 */
	private Connection con;
	

	/**
	 * Main method is only used for convenience.  Use JUnit test file to verify your answer.
	 * 
	 * @param args
	 * 		none expected
	 * @throws SQLException
	 * 		if a database error occurs
	 * @throws ParseException 
	 * 		during date conversions
	 */	
	public static void main(String[] args) throws SQLException, ParseException
	{
		Library app = new Library();
		
		app.connect();
		app.init();
						
		// List all students
		System.out.println("Executing list all students.");
		System.out.println(app.listAllUsers());
        app.close();
    }

    /**
	 * Makes a connection to the database and returns connection to caller.
	 * 
	 * @return
	 * 		connection
	 * @throws SQLException
	 * 		if an error occurs
	 */
	public Connection connect() throws SQLException
	{
	    // TODO: Fill in your connection information
		String url = "jdbc:mysql://localhost:3308/librarySystem";
		String uid = "root";
		String pw = "310rootpw";

		System.out.println("Connecting to database.");
		// Note: Must assign connection to instance variable as well as returning it back to the caller
		con = DriverManager.getConnection(url, uid, pw);
		return con;		                       
	}

    /**
	 * Closes connection to database.
	 */
	public void close()
	{
		System.out.println("Closing database connection.");
		try
		{
			if (con != null)
	            con.close();
		}
		catch (SQLException e)
		{
			System.out.println(e);
		}
	}

    /**
	 * Creates the database and initializes the data.
	 */
	public void init()
	{
	    String fileName = "DDL/libSys.sql";
	    Scanner scanner = null;
	    
	    try
	    {
	        // Create statement
	        Statement stmt = con.createStatement();
	        
	        scanner = new Scanner(new File(fileName));
	        // Read commands separated by ;
	        scanner.useDelimiter(";");
	        while (scanner.hasNext())
	        {
	            String command = scanner.next();
	            if (command.trim().equals(""))
	                continue;
	            // System.out.println(command);        // Uncomment if want to see commands executed
	            stmt.execute(command);
	        }	        
	    }
	    catch (Exception e)
	    {
	        System.out.println(e);
	    }      
	    if (scanner != null)
	    	scanner.close();
	    
	    System.out.println("Data successfully loaded.");
	}
    /** 
    * 
    * @return
    *       String containing all student information
    */
   public String listAllUsers() throws SQLException
   {                
       StringBuilder output = new StringBuilder();
             
       String SQL = "SELECT * FROM users";
       PreparedStatement pstmt = con.prepareStatement(SQL);
       ResultSet rs = pstmt.executeQuery();
       output.append("uid, uname, pwd, lvl, book1, book2, date1, date2");
       while(rs.next())
       {
           output.append("\n"+rs.getString("uid")+", "+rs.getString("uname")+", "+rs.getString("pwd")
           +", "+rs.getString("lvl")+", "+rs.getString("book1")+", "+rs.getString("book2")+", "+rs.getString("date1")+", "+rs.getString("date2"));
       }
       rs.close();
       pstmt.close();
       return output.toString();
   }


   public String listAllBooks() throws SQLException
    {                
        StringBuilder output = new StringBuilder();
        String SQL = "SELECT * FROM books";
        PreparedStatement stmt = con.prepareStatement(SQL);       
        ResultSet rst = stmt.executeQuery(); 
        output.append("isbn, bookName, author, yearPub, genre, qty, borrowed, originalAmt");
            while (rst.next())
            {   
                output.append("\n"+rst.getString("isbn")+", "+rst.getString("bookName")+", "+rst.getString("author")
                +", "+ rst.getString("yearPub")+", "+rst.getString("genre")+", "+rst.getString("qty")+", "+rst.getString("borrowed")+", "+rst.getString("originalAmt"));
            }

        return output.toString();
    }


    public PreparedStatement addUser(int uid, String uname, String pwd, int lvl) throws SQLException
    {                
        String SQL = "INSERT INTO users VALUES (?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = con.prepareStatement(SQL);       
		stmt.setInt(1, uid);
		stmt.setString(2, uname);
		stmt.setString(3, pwd);
		stmt.setInt(4, lvl);
		stmt.setString(5, null);
		stmt.setString(6, null);
		stmt.setDate(7, null);
		stmt.setDate(8, null);

       	int a = stmt.executeUpdate();
		return stmt;
    }

    public PreparedStatement addBook(int isbn, String bookName, String author, int yearPub, String genre, int qty, int originalAmt) throws SQLException
    {                
        String SQL = "INSERT INTO books VALUES (?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = con.prepareStatement(SQL); 
		stmt.setInt(1, isbn);
		stmt.setString(2, bookName);
		stmt.setString(3, author);
		stmt.setInt(4, yearPub);
		stmt.setString(5, genre);
		stmt.setInt(6, qty);
		stmt.setString(7, "F");
		stmt.setInt(8, originalAmt);      
       	stmt.executeUpdate();	
		return stmt;
    }

    public PreparedStatement removeUser(int uid) throws SQLException
	{
        PreparedStatement stmt = con.prepareStatement("DELETE FROM users WHERE uid = ?");
        stmt.setInt(1, uid);

        stmt.executeUpdate();
    	return stmt;
	}

    public PreparedStatement removeBook(int isbn) throws SQLException
	{
        PreparedStatement stmt = con.prepareStatement("DELETE FROM books WHERE isbn = ?");
        stmt.setInt(1, isbn);

        stmt.executeUpdate();
    	return stmt;
	}

    public PreparedStatement addBorrow(int uid, String book, java.util.Date d) throws Exception
    {  
        ResultSet temp = getBook(uid);
		String sql = "";
		temp.next();
		if(temp.getString(1) == null) {//if book1 is empty
			sql = "UPDATE users "+
					"SET book1=?, date1=? "+
					"WHERE uid=?";
		}else{
			sql = "UPDATE users "+
					"SET book2=?, date2=? "+
					"WHERE uid=?";
		}
		java.sql.Date sqlDate = new java.sql.Date(d.getTime());
        PreparedStatement stmt = con.prepareStatement(sql); 
		stmt.setString(1, book);
		stmt.setDate(2, sqlDate);
		stmt.setInt(3, uid);

       	stmt.executeUpdate();	
		return stmt;
    }

    public PreparedStatement addReturn(int uid, String book) throws SQLException
    {  
        ResultSet temp = getBook(uid);
		String sql = "";
		temp.next();
		if(temp.getString(1).equals(book)) {//if book1 is empty
			sql = "UPDATE users "+
					"SET book1 = ?,  date1 = ? "+
					"WHERE uid = ?";
		}else{
			sql = "UPDATE users "+
					"SET book2 = ?,  date2 = ? "+
					"WHERE uid = ?";
		}
        PreparedStatement stmt = con.prepareStatement(sql); 
		stmt.setString(1, null);
		stmt.setDate(2, null);
		stmt.setInt(3, uid);

       	stmt.executeUpdate();	
		return stmt;
    }

    //helper method
	public ResultSet getBook(int uid) throws SQLException{
		String sql = "SELECT book1, book2 FROM users WHERE uid = ?";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, uid);

		return stmt.executeQuery();
	}

}
