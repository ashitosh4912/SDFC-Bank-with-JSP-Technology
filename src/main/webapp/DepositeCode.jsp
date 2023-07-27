<%@page import= "java.sql.*"%>
<%
long account_no=Long.parseLong(request.getParameter("accno"));
String name=request.getParameter("name");
String password=request.getParameter("password");
double balance=Double.parseDouble(request.getParameter("amount"));
String address=request.getParameter("address");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ashu","4912");
	PreparedStatement ps1=con.prepareStatement("select balance from bank where account_no=? and name=?");
	ps1.setLong(1,account_no);
	ps1.setString(2,name);
	ResultSet rs=ps1.executeQuery();
	double x=0;
	if(rs.next()){
		 x=rs.getDouble("balance");
	}
	balance=balance+x;
	PreparedStatement ps=con.prepareStatement("update bank set balance=? where account_no=? and name=?");
	ps.setLong(2,account_no);
	ps.setString(3,name);
	ps.setDouble(1,balance);	
	int i=ps.executeUpdate();
out.println(i+" Deposit done sucessfully");
con.close();
}
catch(Exception ex){
	out.print(ex);
}
%>
