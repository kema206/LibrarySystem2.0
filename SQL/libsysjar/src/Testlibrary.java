import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import java.text.SimpleDateFormat;  
import java.util.Date;  

public class Testlibrary 
{
    /**
	 * Class being tested
	 */
	private static Library l;
	
	/**
	 * Connection to the database
	 */
	private static Connection con;
	
	
	/**
	 * Requests a connection to the database.
	 * 
	 * @throws Exception
	 * 		if an error occurs
	 */
	@BeforeClass
	public static void init() throws Exception 
	{		
		l = new Library();
		con = l.connect();		
		
		// Load data and initialize the database
		l.init();
	}
	
	/**
	 * Closes connection.
	 * 
	 * @throws Exception
	 * 		if an error occurs
	 */
	@AfterClass
	public static void end() throws Exception 
	{
		l.close();        
	}

    /**
     * Tests listing all students.
     */
    @Test
    public void testListAllUsers() throws SQLException
    {   
        // Re-initialize database
        l.init();
        
        System.out.println("\nTest List all students.\n");
        
        String result = l.listAllUsers();
        
        // Verify result
        String answer = "uid, uname, pwd, lvl, book1, book2, date1, date2"
        				+"\n112233, catdog, catcat123, 1, Pride and Prejudice, null, 2022-10-03, null"
        				+"\n112234, monstercute, cute1212, 1, The Red and the Blac, The History of Tom J, 2022-11-04, 2022-11-04"
        				+"\n112236, catslayer66, slaycat12, 1, null, null, null, null"
        				+"\n112237, ubcostudent, goheat, 1, The Brothers Karamaz, Moby-Dick, 2022-11-02, 2022-11-15"
        				+"\n112240, katyplaty, jibakutai, 0, War and Peace, null, 2022-11-23, null"
        				+"\n112241, taylorjeez, nienfu, 0, The History of Tom J, null, 2022-10-01, null";
                                                                
        System.out.println(result);
        assertEquals(answer, result);          
    }

	/**
     * Tests listing all books.
     */
    @Test
    public void testListAllBooks() throws SQLException
    {   
        // Re-initialize database
        l.init();
        
        System.out.println("\nTest List all books.\n");
        
        String result = l.listAllBooks();
        
        // Verify result
        String answer = "isbn, bookName, author, yearPub, genre, qty, borrowed, originalAmt"
        				+"\n11111, The History of Tom Jones, Henry Fielding, 1749, fiction, 3, T, 5"
        				+"\n11112, Pride and Prejudice, Jane Austen, 1813, romance, 2, T, 3"
        				+"\n11113, The Red and the Black, Stendhal, 1830, bildungsroman, 4, T, 5"
        				+"\n11114, Le Pere Goriot, Honore de Balzac, 1835, fiction, 4, T, 4"
        				+"\n11115, David Copperfield, Charles Dickens, 1850, bildungsroman, 4, T, 4"
        				+"\n11116, Madame Bovary, Gustave Flaubert, 1856, fiction, 6, T, 6"
						+"\n11117, Moby-Dick, Herman Malville, 1851, epic, 3, T, 4"
						+"\n11118, Wuthering Heights, Emily Bronte, 1847, tragedy, 2, F, 2"
						+"\n11119, The Brothers Karamazov, Dostoevsky, 1879, philosophy, 2, T, 3"
						+"\n11120, War and Peace, Tolstoy, 1869, romance, 3, T, 4"
						+"\n11121, Alice, Matt, 1500, romance, 4, F, 4";
                                                                
        System.out.println(result);
        assertEquals(answer, result);          
    }

	/**
     * Tests add a student.
     * @throws ParseException 
     */    
    @Test
    public void testAddUser() throws SQLException, ParseException
    {            
        // Re-initialize database
        l.init();

        System.out.println("\nTest add user:\n");
		System.out.println("\nAdding user with id 112242:");

		l.addUser(112242,  "jonkei420", "herculesee",  1);
        
        // Verify result
        String answer = "uid, uname, pwd, lvl, book1, book2, date1, date2"
        				+"\n112233, catdog, catcat123, 1, Pride and Prejudice, null, 2022-10-03, null"
        				+"\n112234, monstercute, cute1212, 1, The Red and the Blac, The History of Tom J, 2022-11-04, 2022-11-04"
        				+"\n112236, catslayer66, slaycat12, 1, null, null, null, null"
        				+"\n112237, ubcostudent, goheat, 1, The Brothers Karamaz, Moby-Dick, 2022-11-02, 2022-11-15"
        				+"\n112240, katyplaty, jibakutai, 0, War and Peace, null, 2022-11-23, null"
        				+"\n112241, taylorjeez, nienfu, 0, The History of Tom J, null, 2022-10-01, null"
						+"\n112242, jonkei420, herculesee, 1, null, null, null, null";                                                      
        
        // Verify add
        String result = l.listAllUsers();
        System.out.println(result);
        assertEquals(answer, result);                     
    }


	@Test
	public void testAddBook() throws SQLException, ParseException
    {            
        // Re-initialize database
        l.init();

        System.out.println("\nTest add book:\n");
		System.out.println("\nAdding book with isbn :");

		l.addBook(11122,  "JonvsHer", "Yamamoto", 2002, "action", 3, 3);
        
        // Verify result
        String answer = "isbn, bookName, author, yearPub, genre, qty, borrowed, originalAmt"
        				+"\n11111, The History of Tom Jones, Henry Fielding, 1749, fiction, 3, T, 5"
        				+"\n11112, Pride and Prejudice, Jane Austen, 1813, romance, 2, T, 3"
        				+"\n11113, The Red and the Black, Stendhal, 1830, bildungsroman, 4, T, 5"
        				+"\n11114, Le Pere Goriot, Honore de Balzac, 1835, fiction, 4, T, 4"
        				+"\n11115, David Copperfield, Charles Dickens, 1850, bildungsroman, 4, T, 4"
        				+"\n11116, Madame Bovary, Gustave Flaubert, 1856, fiction, 6, T, 6"
						+"\n11117, Moby-Dick, Herman Malville, 1851, epic, 3, T, 4"
						+"\n11118, Wuthering Heights, Emily Bronte, 1847, tragedy, 2, F, 2"
						+"\n11119, The Brothers Karamazov, Dostoevsky, 1879, philosophy, 2, T, 3"
						+"\n11120, War and Peace, Tolstoy, 1869, romance, 3, T, 4"
						+"\n11121, Alice, Matt, 1500, romance, 4, F, 4"
						+"\n11122, JonvsHer, Yamamoto, 2002, action, 3, F, 3";                                                      
        
        // Verify add
        String result = l.listAllBooks();
        System.out.println(result);
        assertEquals(answer, result);                     
    }


	/**
     * Tests delete a user.
     */    
    @Test
    public void testRemoveUser() throws SQLException
    {     
        // Re-initialize database
        l.init();
        
        System.out.println("\nTest delete user:\n");
        
        // Non-existing student
        System.out.println("\nDeleting user with id 112242:");
        l.removeUser(112242);
                
        // Verify result
        String answer = "uid, uname, pwd, lvl, book1, book2, date1, date2"
        				+"\n112233, catdog, catcat123, 1, Pride and Prejudice, null, 2022-10-03, null"
        				+"\n112234, monstercute, cute1212, 1, The Red and the Blac, The History of Tom J, 2022-11-04, 2022-11-04"
        				+"\n112236, catslayer66, slaycat12, 1, null, null, null, null"
        				+"\n112237, ubcostudent, goheat, 1, The Brothers Karamaz, Moby-Dick, 2022-11-02, 2022-11-15"
        				+"\n112240, katyplaty, jibakutai, 0, War and Peace, null, 2022-11-23, null"
        				+"\n112241, taylorjeez, nienfu, 0, The History of Tom J, null, 2022-10-01, null";                                                                         
        
        // Verify delete
        String result = l.listAllUsers();
        System.out.println(result);
        assertEquals(answer, result);                     
    }


	/**
     * Tests delete a book.
     */    
    @Test
    public void testRemoveBook() throws SQLException
    {     
        // Re-initialize database
        l.init();
        
        System.out.println("\nTest remove book:\n");
        
        // Non-existing student
        System.out.println("\nRemoving book with isbn 11122:");
        l.removeBook(11122);
                
        // Verify result
        String answer = "isbn, bookName, author, yearPub, genre, qty, borrowed, originalAmt"
        				+"\n11111, The History of Tom Jones, Henry Fielding, 1749, fiction, 3, T, 5"
        				+"\n11112, Pride and Prejudice, Jane Austen, 1813, romance, 2, T, 3"
        				+"\n11113, The Red and the Black, Stendhal, 1830, bildungsroman, 4, T, 5"
        				+"\n11114, Le Pere Goriot, Honore de Balzac, 1835, fiction, 4, T, 4"
        				+"\n11115, David Copperfield, Charles Dickens, 1850, bildungsroman, 4, T, 4"
        				+"\n11116, Madame Bovary, Gustave Flaubert, 1856, fiction, 6, T, 6"
						+"\n11117, Moby-Dick, Herman Malville, 1851, epic, 3, T, 4"
						+"\n11118, Wuthering Heights, Emily Bronte, 1847, tragedy, 2, F, 2"
						+"\n11119, The Brothers Karamazov, Dostoevsky, 1879, philosophy, 2, T, 3"
						+"\n11120, War and Peace, Tolstoy, 1869, romance, 3, T, 4"
						+"\n11121, Alice, Matt, 1500, romance, 4, F, 4";                                                                         
        
        // Verify delete
        String result = l.listAllBooks();
        System.out.println(result);
        assertEquals(answer, result);                     
    }

	/**
     * Tests update user's borrow status.
     */    
    @Test
    public void testUserBorrow() throws Exception
    {     
        // Re-initialize database
        l.init();
        
        System.out.println("\nTest user borrow status:\n");
        String temp = "2022-10-10";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date tempDate = sdf.parse(temp);
        // Non-existing student
        System.out.println("\nUpdating user with uid 112241:");
        l.addBorrow(112241, "Alice", tempDate);
                
        // Verify result
        String answer = "uid, uname, pwd, lvl, book1, book2, date1, date2"
        				+"\n112233, catdog, catcat123, 1, Pride and Prejudice, null, 2022-10-03, null"
        				+"\n112234, monstercute, cute1212, 1, The Red and the Blac, The History of Tom J, 2022-11-04, 2022-11-04"
        				+"\n112236, catslayer66, slaycat12, 1, null, null, null, null"
        				+"\n112237, ubcostudent, goheat, 1, The Brothers Karamaz, Moby-Dick, 2022-11-02, 2022-11-15"
        				+"\n112240, katyplaty, jibakutai, 0, War and Peace, null, 2022-11-23, null"
        				+"\n112241, taylorjeez, nienfu, 0, The History of Tom J, Alice, 2022-10-01, 2022-10-10";                                                                        
        
        // Verify delete
        String result = l.listAllUsers();
        System.out.println(result);
        assertEquals(answer, result);                     
    }

	/**
     * Tests update user's borrow status.
     */    
    @Test
    public void testUserReturn() throws Exception
    {     
        // Re-initialize database
        l.init();
        
        System.out.println("\nTest user return status:\n");
        // Non-existing student
        System.out.println("\nUpdating user with uid 112241:");
		
        l.addReturn(112241, "Alice");
                
        // Verify result
        String answer = "uid, uname, pwd, lvl, book1, book2, date1, date2"
        				+"\n112233, catdog, catcat123, 1, Pride and Prejudice, null, 2022-10-03, null"
        				+"\n112234, monstercute, cute1212, 1, The Red and the Blac, The History of Tom J, 2022-11-04, 2022-11-04"
        				+"\n112236, catslayer66, slaycat12, 1, null, null, null, null"
        				+"\n112237, ubcostudent, goheat, 1, The Brothers Karamaz, Moby-Dick, 2022-11-02, 2022-11-15"
        				+"\n112240, katyplaty, jibakutai, 0, War and Peace, null, 2022-11-23, null"
        				+"\n112241, taylorjeez, nienfu, 0, The History of Tom J, null, 2022-10-01, null";                                                                        
        
        // Verify delete
        String result = l.listAllUsers();
        System.out.println(result);
        assertEquals(answer, result);                     
    }


}