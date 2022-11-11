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

public class cosc310sql
{
	private Connection con;
    public static void main(String[] args) throws SQLException
	{	
		cosc310sql app = new cosc310sql();

		app.connect();
		app.init();	

		// List all users
		System.out.println("\nExecuting list all students.");
		System.out.println(app.listAllUsers());

		// List all users
		System.out.println("\nExecuting list all books.");
		System.out.println(app.listAllBooks());
	}
	public Connection connect() throws SQLException
	{
		String url = "jdbc:mysql://localhost:3308/librarySystem";
		String uid = "root";
		String pw = "310rootpw";

		System.out.println("Connecting to database.");
		con = DriverManager.getConnection(url, uid, pw);
		return con;		                       
	}

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

	public void init()
	{
	    String fileName = "libSys.ddl";
	    Scanner scanner = null;
	    
	    try
	    {
	        Statement stmt = con.createStatement();
	        
	        scanner = new Scanner(new File(fileName));
	        // Read commands separated by ;
	        scanner.useDelimiter(";");
	        while (scanner.hasNext())
	        {
	            String command = scanner.next();
	            if (command.trim().equals(""))
	                continue;

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

	public String listAllUsers() throws SQLException
    {                
        StringBuilder output = new StringBuilder();
        String SQL = "SELECT * FROM users";
        PreparedStatement stmt = con.prepareStatement(SQL);       
        ResultSet rst = stmt.executeQuery(); 
        output.append("uid, uname, lvl, book1, book2, date1, date2");
            while (rst.next())
            {   
                output.append("\n"+rst.getString("uid")+", "+rst.getString("uname")+", "+rst.getString("book1")
                +", "+ rst.getString("book2")+", "+rst.getString("date1")+", "+rst.getString("date2"));
            }

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

       	stmt.executeUpdate();
		return stmt;
    }

	public PreparedStatement addBook(int isbn, String bookName, String author, int yearPub, String genre, int qty, Boolean borrowed, int originalAmt) throws SQLException
    {                
        String SQL = "INSERT INTO books VALUES (?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = con.prepareStatement(SQL); 
		stmt.setInt(1, isbn);
		stmt.setString(2, bookName);
		stmt.setString(3, author);
		stmt.setInt(4, yearPub);
		stmt.setString(5, genre);
		stmt.setInt(6, qty);
		stmt.setBoolean(7, borrowed);
		stmt.setInt(8, originalAmt);  

       	stmt.executeUpdate();	
		return stmt;
    }
	
	public PreparedStatement removeUser(int uid) throws SQLException
	{
    	// TODO: Use a PreparedStatement and return it at the end of the method
        PreparedStatement stmt = con.prepareStatement("DELETE FROM user WHERE uid = ?");
        stmt.setInt(1, uid);

        stmt.executeUpdate();
    	return stmt;
	}

	public PreparedStatement updateBook(int isbn, int qty, Boolean borrowed) throws SQLException
    {                
        String SQL = "UPDATE book SET qty = ? , borrowed = ? WHERE isbn = ?";
        PreparedStatement stmt = con.prepareStatement(SQL); 
		stmt.setInt(3, isbn);
		stmt.setInt(1,qty);
		stmt.setBoolean(2, borrowed);
		
       	stmt.executeUpdate();	
		return stmt;
    }



}