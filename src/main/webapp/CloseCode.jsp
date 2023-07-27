<%@page import= "java.sql.*"%>
<%
long account_no=Long.parseLong(request.getParameter("accno"));
String name=request.getParameter("name");
String password=request.getParameter("password");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashu","4912");
	PreparedStatement ps=con.prepareStatement("select password from bank where account_no=? and name=?");
	ps.setLong(1,account_no);
	ps.setString(2,name);
	ResultSet rs=ps.executeQuery();
	String p="";
	if(rs.next())
	{
		 p=rs.getString("password");
	}
	if(password.equals(p))
{
		
	String status="Inactive";
	PreparedStatement ps1=con.prepareStatement("update bank set status=? where account_no=?");
	
	ps1.setString(1,status);
	ps1.setLong(2,account_no);	
	int j=ps1.executeUpdate();
out.println(j+"account closed sucessfully");
con.close();
	
}
	else
	{
		out.print("please enter valid password");
	}
}
	catch(Exception ex)
	{
		out.print(ex);
	}
%>