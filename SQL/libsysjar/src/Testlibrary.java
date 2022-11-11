import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
public class Testlibrary {
    @Test 
    public void testListAllUsers() throws SQLException{
	Library app = new Library();
	app.connect();
	app.init();	
	String result = app.listAllUsers();
    String answer = "uid, uname, pwd, lvl, book1, book2, date1, date2\n"+
    "112233, catdog, catcat123, 1, Pride and Prejudice, null, 2022-10-03, null\n" +
    "112234, monstercute, cute1212, 1, The Red and the Blac, The History of Tom J, 2022-11-04, 2022-11-04\n"+
    "112236, catslayer66, slaycat12, 1, null, null, null, null\n"+
    "112237, ubcostudent, goheat, 1, The Brothers Karamaz, Moby-Dick, 2022-11-02, 2022-11-15\n"+
    "112240, katyplaty, jibakutai, 0, War and Peace, null, 2022-11-23, null\n"+
    "112241, taylorjeez, nienfu, 0, The History of Tom J, null, 2022-10-01, null";
                                                                
    System.out.println(result);
    assertEquals(answer, result);        
}

}
