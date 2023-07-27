
<%@ page import=" java.sql.*"%>
<%
long account_no =Long.parseLong(request.getParameter("accno"));
String name =request.getParameter("name");
String password =request.getParameter("password");
String cpassword =request.getParameter("cpassword");
double balance =Double.parseDouble(request.getParameter("amount"));
String address =request.getParameter("address");
long mobile_no =Long.parseLong(request.getParameter("mob"));

if(password.equals(cpassword))
{
	try
	{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashu","4912");
	PreparedStatement ps=con.prepareStatement("insert into bank values(?,?,?,?,?,?,?)");

	ps.setLong(1,account_no);
	ps.setString(2,name);
	ps.setString(3,password);
	ps.setDouble(4,balance);
	ps.setString(5,address);
	ps.setLong(6,mobile_no);
	ps.setString(7, "Active");

	int i=ps.executeUpdate();
	out.println(i+"new account created successfully");
	con.close();

	}
catch (Exception ex)
{
	out.println(ex);
}
}
else
{
	out.println("password and confirm password does not match");
}
%>