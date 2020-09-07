<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <meta charset="utf-8">
    <title>Admin panel</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>
<body>
<%@ include file="fragments/navigation.jspf" %>
  <div class="container">
	<c:forEach items="${recipeList}" var="recipe">
		<div class="row">
			<h2>${recipe.getId()}. ${recipe.getName()}</h2>
			<div class="col-md-4">
				<img height="300px" src="/getRecipePhoto/<c:out value='${recipe.getId()}'/>" alt="Zdjecie">
			</div>
			<div class="col-md-4">
				<h4>Czas: <span>${recipe.getTime()}</span></h4>	
				<h4>Poziom: <span>${recipe.getLvl()}</span></h4>
				<p>
					<a class="btn btn-primary" href="${contextPath}/recipe/${recipe.getId()}">Czytaj wiecej</a>
				</p>
				<form method="POST" modelAttribute="recipeToDelete" action="${contextPath}/admin/${recipe.getId()}">
					<button class="btn btn-danger" type="submit">Usuń</button>
				</form>
				<h5><strong>Stworzone przez:</strong> <span>${recipe.getUser().getUsername()}</span></h5>
			</div>
		</div>
		<hr>
	
	</c:forEach>							
</div>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>