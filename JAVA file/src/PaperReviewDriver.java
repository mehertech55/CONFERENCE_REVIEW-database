
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;

//import paperReviewDriver.PaperReviewDriver;

public class Driver {
	String JDBC_DRIVER_1 = "com.mysql.cj.jdbc.Driver";
	String DB_URL_1 = "jdbc:mysql://localhost/conference_review?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	String USERNAME = "root";
	String PASSWORD = "mehercan";

	
	
	
/*
	Get a submitted paper’s details by the author’s Primary Key. The query should return the
	following data (columns): Paper.Id, Paper.Title, Paper.Abstract, Author.EmailAddress,
	Author.FirstName, Author.LastName
*/	
	
	public void getSubmittedPaperDetails() {

	

		try {
			Connection myConn = DriverManager.getConnection(DB_URL_1,USERNAME, PASSWORD);
			Statement  myStmt = myConn.createStatement();
			System.out.println("-----------------------------------------");
			System.out.println("QUERY 1:\nSubmitted paper’s details by the author’s Primary Key.");
			System.out.println("-----------------------------------------");
			myStmt = myConn.createStatement();

			String query = "SELECT    paperId AS PaperID, p.title AS PaperTitle, p.abstract AS PaperAbstract\n" + 
					"		, a.emailAdd AS AuthorEmail\n" + 
					"		, a.firstName AS AuthorFirstName\n" + 
					"		, a.lastName AS AuthorLastName\n" + 
					"FROM  Author a \n" + 
					"INNER JOIN  paper p on p.contactEmailAdd = a.emailAdd \n" + 
					"ORDER BY p.paperId ASC";
			
			ResultSet  myRs   = myStmt.executeQuery(query);
			
			
				while(myRs.next()) {
					
					System.out.println("Paper ID: " + myRs.getInt("paperId"));
					System.out.println("Paper Title: " + myRs.getString("PaperTitle"));
					System.out.println("Paper Abstract: " + myRs.getString("PaperAbstract"));
					System.out.println("Author Email: " + myRs.getString("AuthorEmail"));
					System.out.println("Author First Name: " + myRs.getString("AuthorFirstName"));
					System.out.println("Author Last Name: " + myRs.getString("AuthorLastName"));
					
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
		
	public void getReviews() {
		/*● Get all reviews for a paper by the paper’s Id, where the paper was recommended to be
	published. The query should return the following data (columns): All columns from the
	Review table.*/

		
		try {
			Connection myConn = DriverManager.getConnection(DB_URL_1,USERNAME, PASSWORD);
			Statement  myStmt = myConn.createStatement();
			System.out.println("-----------------------------------------");
			System.out.println("QUERY 2:\nResult of all reviews of papers which are recommended to be published.");
			System.out.println("-----------------------------------------");
			myStmt = myConn.createStatement();
			String query =  "SELECT reviewId, paper.paperId, techMeritScore, readabilityScore, originalityScore, relevanceScore, reviewerEmailAdd, recommendation, authorComment, commiteeComment FROM review \n" + 
					"INNER JOIN paper ON paper.paperId = review.paperId\n" + 
					"WHERE review.recommendation LIKE '%I recommend%'\n" + 
					"ORDER BY paper.paperId ASC;";					
			
			ResultSet rs = myStmt.executeQuery(query);
		
				
				
				while (rs.next()) {
					
				
					System.out.println("reviewId: " +rs.getInt("reviewId"));
					System.out.println("Paper ID: " +rs.getInt("paper.paperId"));
					System.out.println("techMeritScore: " + rs.getInt("techMeritScore"));
					System.out.println("readabilityScore: " + rs.getString("readabilityScore"));
					System.out.println("originalityScore: " + rs.getString("originalityScore"));
					System.out.println("relevanceScore: " + rs.getString("relevanceScore"));
					System.out.println("reviewerEmailAdd: " + rs.getString("reviewerEmailAdd"));
					System.out.println("recommendation: " + rs.getString("recommendation"));
					System.out.println("commiteeComment: " + rs.getString("commiteeComment"));
					System.out.println("\n-----------------------------------------\n");
				}
		}
			
			
		 catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void getCount() {
		/*● Get count of all the papers submitted .*/
		try {
			Connection myConn = DriverManager.getConnection(DB_URL_1,USERNAME, PASSWORD);
			Statement  myStmt = myConn.createStatement();
			System.out.println("-----------------------------------------");
			System.out.println("QUERY 3:\nCount of total papers that are submitted.");
			System.out.println("-----------------------------------------");
			myStmt = myConn.createStatement();
			String query =  "SELECT COUNT(*) AS TOTAL FROM paper;";					
			
			ResultSet rs = myStmt.executeQuery(query);
		
				
				
				while (rs.next()) {
				
					System.out.println("Total Submitted Papers: " + rs.getString(1));

				}
		}
			
			
		 catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
	}

	public void newSubmission() {
		/*● Create a new paper submission. Remember this includes creating new records in both
the Author and Paper tables.*/
		try {
			Connection myConn = DriverManager.getConnection(DB_URL_1,USERNAME, PASSWORD);
			Statement  myStmt = myConn.createStatement();
			System.out.println("-----------------------------------------");
			System.out.println("QUERY 4:\nNew paper submission");
			System.out.println("-----------------------------------------");
			myStmt = myConn.createStatement();
		
		    String query = " INSERT INTO Author (emailAdd, firstName, lastName)"
		    	        + " values (?, ?, ?)";

		    // create the mysql insert preparedstatement
		    PreparedStatement preparedStmt = myConn.prepareStatement(query);
		    preparedStmt.setString (1, "mary.tiger@gmail.com");
		    preparedStmt.setString (2, "Mary");
		    preparedStmt.setString   (3, "Tiger");

		   // execute the preparedstatement
		    preparedStmt.execute();
		    
		    String Paperquery = " INSERT INTO Paper (paperId, title, abstract, fileName, contactEmailAdd)"
	    	        + " values (?, ?, ?, ?, ?)";
    		//"(6, 'Title6', NULL, NULL,'mary.tiger@gmail.com');\n" + 


		    // create the mysql insert preparedstatement
		    preparedStmt = myConn.prepareStatement(Paperquery);
		    preparedStmt.setInt (1, 6);
		    preparedStmt.setString (2, "Title6");
		    preparedStmt.setString   (3, "NULL");
		    preparedStmt.setString   (4, "NULL");
		    preparedStmt.setString   (5, "mary.tiger@gmail.com");
		    
		    


		    // execute the preparedstatement
		    preparedStmt.execute();
		    

		  //  Close 
		    myConn.close();

		    
			
		}	
			
			
		 catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
	}	
	
	
	
	
	
	
	
	

	
	public static void main(String[] args) {
		
		Driver demo = new Driver();

		demo.getSubmittedPaperDetails();
		demo.getReviews();
		demo.getCount();
		demo.newSubmission();

		
	}

	

}
