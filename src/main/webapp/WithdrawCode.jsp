<%@page import= "java.sql.*"%>
<%
long account_no=Long.parseLong(request.getParameter("accno"));
String name=request.getParameter("name");
String password=request.getParameter("password");
double balance=Double.parseDouble(request.getParameter("amount"));
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashu","4912");
	PreparedStatement ps1=con.prepareStatement("select password from bank where account_no=? and name=?");
	ps1.setLong(1,account_no);
	ps1.setString(2,name);
	ResultSet rs1=ps1.executeQuery();
	String p="";
	if(rs1.next())
	{
		 p=rs1.getString("password");
	}
	if(password.equals(p)){
		PreparedStatement ps2=con.prepareStatement("select balance from bank where account_no=? and password=?");
		ps2.setLong(1,account_no);
		ps2.setString(2,password);
		ResultSet rs2=ps2.executeQuery();
	
	double x=0;
	if(rs2.next())
	{
		 x=rs2.getDouble("balance");
	}
	if(balance<x){
		
	balance=x-balance;
	PreparedStatement ps3=con.prepareStatement("update bank set balance=? where account_no=? and name=?");
	ps3.setDouble(1,balance);
	ps3.setLong(2,account_no);
	ps3.setString(3,name);

		
	int j=ps3.executeUpdate();
out.println(j+" Withdraw done sucessfully");
con.close();
	}
	else
	{
		out.print("balance insufficient");
	}
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