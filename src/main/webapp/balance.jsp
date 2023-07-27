<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="yellow">
     <h1 align="center">SDFC BANK</h1><br>
     <h2 align="center">EXTRAORDINARY SERVICES</h2>
<form action="BalanceCode.jsp" method="post">
<table border="1" align="center" >
<td><a href="home.jsp">HOME</td>
<td><a href="newaccount.jsp">NEW ACCOUNT</td>
<td><a href="balance.jsp">BALANCE</td>
<td><a href="deposit.jsp">DEPOSIT</td>
<td><a href="withdraw.jsp">WITHDRAW</td>
<td><a href="transfer.jsp">TRANSFER</td>
<td><a href="close.jsp">CLOSE A/C</td>
<td><a href="abouts.jsp">ABOUTS</td>
</table>
<table align="center">
<h3>BALANCE FORM</h3>
Account Number : <input type="text" name="accno"><br>
Name  : <input type="text" name="name"><br>
Passwords : <input type="password" name="password"><br>
<input type="submit" value="Submit"> <input type="reset" value="Clear">
</table>
</form>
</body>
</html>