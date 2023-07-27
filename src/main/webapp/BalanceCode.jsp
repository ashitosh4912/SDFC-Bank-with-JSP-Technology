<%@ page import=" java.sql.*"  %>
<%
long account_no =Long.parseLong(request.getParameter("accno"));
String name =request.getParameter("name");
String password =request.getParameter("password");


try {
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection con= DriverManager.getConnection("jdbc:Oracle:thin:@localhost:1521:xe","ashu","4912");
	
	PreparedStatement ps=con.prepareStatement("select * from bank where account_no=? and name=? and password=?");

	ps.setLong(1,account_no);
	ps.setString(2,name);
	ps.setString(3,password);

	
	ResultSet rs =ps.executeQuery();
	
	ResultSetMetaData rss =rs.getMetaData();
	
	out.print("<html><body><table border=1>");

	
	int n =rss.getColumnCount();
	
	for(int i=1;i<=n;i++) 
	{
		out.print("<td><font color=blue size=3>"+"<br>"+rss.getColumnName(i));	
	}
	out.println("<tr>");
	
	while(rs.next())
	{
		for(int j=1;j<=n;j++) 
		{
			
			out.print("<td><br>"+rs.getString(j));
			
		}
		out.print("<tr>");

	}
	out.println("</table></body></html>");
	con.close();
}
catch(Exception ex) 
{
out.println(ex);
}	

%>