<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
    <link href="bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <meta charset="ISO-8859-1">
    <title>View Results</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<center>
		<h3>
			<pre>
				<font color="blue">List Of Results</font>
		</h3>
		</pre>
	</center>
    <sql:setDataSource driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/OesDb" user="root" password="root" />
    <sql:query var="resultsQuery" sql="SELECT * FROM result" />

<table class="table table-bordered table-hover">
        <thead>
            <tr tr class="table-dark">
            	<th>sl no.</th>
                <th>User ID</th>
                <th>Correct Answers</th>
                <th>Attempted Answers</th>
                <th>Wrong Answers</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="result" items="${resultsQuery.rows}">
                <tr>
              		  <% int i=0; %>
              		<td><%=i++%></td>
                    <td>${result.userId}</td>
                    <td>${result.correctAnswers}</td>
                    <td>${result.attemptedAnswers}</td>
                    <td>${result.wrongAnswers}</td>
                </tr>
            </c:forEach>
        </tbody>
        
        	<tr>
			<th colspan="2"><center>
					<input type="button" class="btn btn-outline-danger"
						value="Back to Panel" onclick="location.href='StudentInstructions.jsp'">
				</center></th>
		</tr>
        
        
        
      
    </table>
</body>
</html>
