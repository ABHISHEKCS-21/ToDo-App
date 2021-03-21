<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<title><c:out value="${page }"></c:out></title>
</head>
<body>

	<div class="container mt-3">

		<h1 class="text-center">Welcome to TODO Manager</h1>
		
		<c:if test="${not empty msg}">
			<div class="alert alert-success text-center">
				<b><c:out value="${msg }"></c:out> </b>
			</div>
		</c:if>

		<div class="row mt-5">

			<div class="col-md-2">

				<div class="list-group">
					<button type="button"
						class="list-group-item list-group-item-action active">Manu</button>
					<a href='<c:url value='/add'></c:url>'
						class="list-group-item list-group-item-action">Add TODO</a> <a
						href='<c:url value='/home'></c:url>'
						class="list-group-item list-group-item-action">View TODO</a>

				</div>
			</div>

			<div class="col-md-10">
				<c:if test="${page=='home'}">
					<h1 class="text-center">All TODOS</h1>
					<c:forEach items="${todos }" var="t">
					<div class="card">
					<div class="card-body">
					<h3><c:out value="${t.todoTitle }"></c:out></h3>
					<p> <c:out value="${t.todoContent }"></c:out></p>
					</div>
					</div>
					</c:forEach>
					
				</c:if>

				<c:if test="${page=='add'}">
					<h3 class="text-center">Add TODO</h3>

					<form:form action="saveTodo" method="post" modelAttribute="todo">
						<div class="form-grup">
							<form:input path="todoTitle" cssClass="form-controle"
								placeholder="Enter todo Title" cssStyle="width:900px;" />
						</div>
						<br>
						<div class="form-grup">
							<form:textarea path="todoContent" cssClass="form-controle"
								cssStyle="height:300px;width:900px;" placeholder="Enter Content" />
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Save</button>
						</div>

					</form:form>

				</c:if>
			</div>
		</div>


	</div>





	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
</body>
</html>
