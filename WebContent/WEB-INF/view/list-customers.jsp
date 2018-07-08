<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<title>Customer List</title>
<link type="text/css" rel="stylesheet" 
href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	
		<div id="container">
		<div id="content">
		
		<input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd';
		return false;" class="add-button"/>
		
		
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				
				<c:forEach var="tempCustomer" items="${customers}">
				
				<!-- Construct update link with customer id -->
				<c:url var="updateLink" value="showFormForUpdate">
					<c:param name="customerId" value="${tempCustomer.id}"/>
				</c:url>

					<c:url var="deleteLink" value="deleteCustomer">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>

					<tr>
						<td>${tempCustomer.first_name}</td>
						<td>${tempCustomer.last_name}</td>
						<td>${tempCustomer.email}</td>
						<td>					
							<a href="${updateLink}">Update</a>					
						</td>
						<td>					
							<a href="${deleteLink}"
							onclick="if(!(confirm('Delete Customer'))) return false">Delete</a>					
						</td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
	</div>
	
</body>

</html>