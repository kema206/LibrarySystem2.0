import java.sql.*;

public class cosc310sql
{
    public static void main(String[] args)
	{	String url = "jdbc:mysql://localhost:3308/librarySystem";
		String uid = "root";
		String pw = "310rootpw";

		try 
		(Connection con=DriverManager.getConnection(url, uid, pw);
		Statement stmt = con.createStatement(); )
		{
			String sql = "SELECT * FROM users";
			ResultSet rst = stmt.executeQuery(sql);

			StringBuilder output = new StringBuilder(); //for printing
			output.append("uid, uname, pwd, lvl, book1, book2");

			while (rst.next())
			{
				output.append("\n"+rst.getInt("uid")+", "+rst.getString("uname"));
			}
			System.out.println("connected");
		}
		catch (SQLException ex)
		{
			System.out.println("SQLException: " + ex);
		}		
	}
}