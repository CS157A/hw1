<%//IGNORE THIS FILE - was just testing something %>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Hello this is homework1</title>
</head>
<body>
<table>
    <% 
    String database = "hw1"; 
    try {
 		java.sql.Connection con; 
 		Class.forName("com.mysql.jdbc.Driver"); 

 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + database + "?verifyServerCertificate=false&useSSL=true", "root","newpassword");

 		
 		
    	String query = "select * from emp";
    	Statement stmt=con.createStatement();
    	
    	//id, username, password, full_name
		//stmt.executeUpdate("INSERT INTO database (name, age) " +"VALUES ('Vince', 21)");    	

		
		// http://localhost:8080/homework1Test1/homework1.jsp
		//stmt.executeUpdate("INSERT INTO database (username, password, full_name) " +"VALUES (request.getParameter('username'), request.getParameter('password'), request.getParameter('fullName'))");    	
		
		stmt.executeUpdate("INSERT INTO emp (id, username, password, fullName) " +"VALUES ('31', 'Vince', 'hi', 'bye')");    	

    	ResultSet rs = stmt.executeQuery(query);
    	while(rs.next()) {
   	%>	
  		<tr>
  		<td><%out.println(rs.getInt(1)); %></td>
  		<td><%out.println(rs.getString(2)); %></td>
  		<td><%out.println(rs.getString(3)); %></td>
  		  		<td><%out.println(rs.getString(4)); %></td>
  		
  		</tr>
 
    <%
    	}
    %>
    </table>
    <%
    rs.close();
    stmt.close();
    con.close();
    }
    catch(SQLException e) {
    	out.println("SQLException caught: " + e.getMessage());
    	} 
    %>
</body>
</html>