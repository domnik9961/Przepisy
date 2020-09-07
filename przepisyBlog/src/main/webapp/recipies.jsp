<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
    <meta charset="utf-8">
    <title>Dodawanie przepisów</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    
</head>
<body>
  <div class="container">
  <%@ include file="fragments/navigation.jspf" %>
    <c:if test="${pageContext.request.userPrincipal.name != null}">

        <h2>Witaj ${pageContext.request.userPrincipal.name}</h2>   
        <h3>Dodaj nowy przepis</h3>      
   
    	<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<form enctype="multipart/form-data" method="POST"  action="${contextPath}/recipies">
	
					<div class="form-group ">
						Opis<br>
						<input name="description" type="text" class="form-control" placeholder="" autofocus="true"/>
						<br>Rodzaj jedzenia<br>
						<input name="foodKind" type="text" class="form-control" placeholder="" autofocus="true"/>
						<br>Poziom<br>
						<input name="lvl" type="text" class="form-control" placeholder="" autofocus="true"/>
						<br>Czas przygotowania<br>
						<input name="time" type="text" class="form-control" placeholder="" autofocus="true"/>
						<br>Zdjęcie<br>
						<input name="photo" type="file" class="form-control" placeholder="" autofocus="true"/>
						<br>
						<button class="btn btn-lg btn-primary btn-block" type="save">Dodaj</button>
					</div>
				</form>
			</div>
			<div class="col-md-4"></div>
		  </div>
    </c:if>
  </div>
<div class="nobootstrap">
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">

<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<div class="container">
<h3> Your recipies: </h3><br>
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
</div>

  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>