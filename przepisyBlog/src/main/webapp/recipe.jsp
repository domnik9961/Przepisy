<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Przepisy</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="fragments/navigation.jspf" %>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<div class="container">
	<div class="row">
		<h2>${recipe.getId()}. ${recipe.getName()}</h2>
		<div class="col-md-4">
			<img height="300px" src="/getRecipePhoto/<c:out value='${recipe.getId()}'/>" alt="Zdjecie">
		</div>
		<div class="col-md-4">
			<h4>Czas: <span>${recipe.getTime()}</span></h4>	
			<h4>Poziom: <span>${recipe.getLvl()}</span></h4>
			<h5><strong>Stworzone przez:</strong> <span>${recipe.getUser().getUsername()}</span></h5>
		</div>
	</div>
		<hr>
	</div>
    <div class="container">
	      <form method="POST" modelAttribute="commentForm" action="${contextPath}/recipe/${recipeById.getId()}">
	        <div class="form-group ">
	        	<c:if test="${pageContext.request.userPrincipal.name != null}">
		        	<h3>Wszystkie komentarze</h3>
		            <input name="body" type="text" class="form-control" placeholder=""
		                   autofocus="true"/>
		            <button class="btnbtn-primary btn-block" type="save">Dodaj komentarz</button>
		        </c:if>  
	        </div>
	      </form>
	    </div>
  	    <div class="container">
			<h4>Komentarze:</h4>
			<div class="col-md-4">
						
				<c:forEach items="${commentToRecipe}" var="comment">
					${comment.getBody()}<br>
					<p>Data: <span>${comment.getCreateDate()}</span></p>		
					<p>Stworzone przez: <span>${comment.getUser().getUsername()}</span></p>
					<br>
				</c:forEach>
			</div>
	    </div>
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>