<%@page import= "java.sql.*"%>
<%
long account_no=Long.parseLong(request.getParameter("accno"));
String name=request.getParameter("name");
String password=request.getParameter("password");
long taccountno=Long.parseLong(request.getParameter("target"));
double tamount=Double.parseDouble(request.getParameter("amount"));
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
	
	double am1=0;
	if(rs2.next())
	{
		 am1=rs2.getDouble("balance");
	}
	if(tamount<am1){
		
	 am1=am1-tamount;
	PreparedStatement ps3=con.prepareStatement("update bank set balance=? where account_no=? and name=?");
	ps3.setDouble(1,am1);
	ps3.setLong(2,account_no);
	ps3.setString(3,name);
	int j=ps3.executeUpdate();
	
	//2person
	PreparedStatement ps4=con.prepareStatement("select balance from bank where account_no=?");
	ps4.setLong(1,taccountno);
	ResultSet rs3=ps4.executeQuery();
	double am2=0;
	if(rs3.next())
	{
		 am2=rs3.getDouble("balance");
	}
	am2=tamount+am2;
	PreparedStatement ps5=con.prepareStatement("update bank set balance=? where account_no=?");
	
	ps5.setDouble(1,am2);	
	ps5.setLong(2,account_no);
	int i=ps5.executeUpdate();
	
out.println(i+" transfer done sucessfully");
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