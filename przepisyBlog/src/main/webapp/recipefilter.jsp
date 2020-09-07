<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Wyszukiwanie</title>
          <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
      <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>
<body>

<div class="container">
	<div class="col-md-4">
		Szukaj według: 
		<br>
		<br>
		
		<form method="POST" modelAttribute="recipeFilterForm" action="${contextPath}/recipe_filter">
			<div class="form-group ">
			Nazwa użytkownika:
			<input name="time" type="text" class="form-control" placeholder="" autofocus="true"/>
			Poziom:
			<input name="lvl" type="text" class="form-control" placeholder="" autofocus="true"/>
			Rodzaj jedzenia:
			<input name="foodKind" type="text" class="form-control" placeholder="" autofocus="true"/>
			<button class="btn btn-primary btn-block" type="submit">Szukaj</button>
			</div>
		</form>
	</div>
</div>

  
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<div class="container">
	<c:forEach items="${recipeList}" var="recipe">
		<h2>${recipe.getId()}. ${recipe.getName()}</h2>
		<div class="col-md-4">
			<img height="300px" src="/getRecipePhoto/<c:out value='${recipe.getId()}'/>" alt="Zdjecie">
		</div>
		<div class="col-md-4">
			<h4>Czas: <span>${recipe.getTime()}</span></h4>	
			<h4>Poziom: <span>${recipe.getLvl()}</span></h4>
			<h5><strong>Stworzone przez:</strong> <span>${recipe.getUser().getUsername()}</span></h5>
		</div>
		<hr>
	
	</c:forEach>							
</div>
  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>