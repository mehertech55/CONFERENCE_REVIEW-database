CS-623 Database Management Systems
Database Management Systems (Spring 2020) - Project Assignment - Implementation of Conference Review Database
Part 2: Java Application
To run the project,

Download and open project in eclipse, netbeans or any other IDE.
Open Driver.java and change username and password for MySQL.
Save the file and run.
Driver.java contains following functions:

connect(): Function to connect to the database using JDBC driver.
disconnect(): Function used to close the database connection.
getSubmit(): Function will return records for submitted paper’s details by the author’s Primary Key. The query will return the following data (columns): Paper.Id, Paper.Title, Paper.Abstract, Author.EmailAddress, Author.FirstName, Author.LastName
getReviews(): Function will return all reviews for a paper by the paper’s Id, where the paper was recommended to be published. The query will return the following data (columns): All columns from the Review table.
getCount(): Function will return count of all papers submitted
newPaperSubmission(): Function will create new paper submission. Also create record in Author table and Author Paper table.
delete(): Function will try to delete the first author, if it received an error than error message is displayed in console.
