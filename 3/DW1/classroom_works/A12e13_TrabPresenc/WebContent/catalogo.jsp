<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt" class="h-100">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>DW1 A12 e 13</title>
	<meta name="template-source" content="https://getbootstrap.com/docs/4.3/examples/sticky-footer-navbar/">
	<!-- Bootstrap core CSS -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!-- Custom styles for this template -->
	<link href="https://getbootstrap.com/docs/4.3/examples/sticky-footer-navbar/sticky-footer-navbar.css" rel="stylesheet">
	</head>
<body class="d-flex flex-column h-100">
	<header>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="livraria">Projeto Livraria</a>
	  	<!-- botão para expandir o menu, em tela pequena -->
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarCollapse">
	    	<ul class="navbar-nav mr-auto">
		        <li class="nav-item">
		        	<a class="nav-link" href="livraria">Home</a>
		        </li>
		        <li class="nav-item">
		        	<a class="nav-link" href="#">Pedidos</a>
		        </li>
		        <li class="nav-item active">
		        	<a class="nav-link" href="catalogo">Carrinho <span class="sr-only">(página atual)</span></a>
		        </li>
		        <li class="nav-item">
		        	<a class="nav-link" href="#">Contato</a>
		        </li>
	      	</ul>
      		<form class="form-inline mt-2 mt-md-0">
	        	<input class="form-control mr-sm-2" type="text" placeholder="Buscar produto" aria-label="Buscar produto">
	        	<button class="btn btn-outline-info my-2 my-sm-0" type="submit">Go</button>
	      	</form>
	    </div>
	</nav>
	</header>
	<main role="main" class="flex-shrink-0">
		<div class="container">
			<h1 class="mt-5">Carrinho de compras</h1>
				<!-- 
				<p class="lead">Pin a footer to the bottom of the viewport in desktop browsers with this custom HTML and CSS. A fixed navbar has been added with <code>padding-top: 60px;</code> on the <code>main &gt; .container</code>.</p>
				<p>Back to <a href="/docs/4.3/examples/sticky-footer/">the default sticky footer</a> minus the navbar.</p>
				 -->
		<jsp:useBean id="livrariaBean" class="negocio.LivrariaBean" scope="page">
			<jsp:setProperty name="livrariaBean" property="sistema" value="${sistemaLivraria}"/>
		</jsp:useBean>
		<c:if test="${not empty param.Add}">
			<c:set var="idL" value="${param.Add}"/>
			<jsp:setProperty name="livrariaBean" property="idLivro" value="${idL}"/>
			<c:set var="livroAdicionado" value="${livrariaBean.livro}"/>
			<div class="alert alert-success" role="alert">
  				Você adicionou o livro <em>${livroAdicionado.titulo}</em> ao seu carrinho de compras!
			</div>
		</c:if>
		<c:choose>
			<c:when test="sessionScope.cart.numeroItens > 0">
				<c:url var="url" value="livros/mostrarCarrinho">
					<c:param name="limpar" value="0"/>
					<c:param name="remover" value="0"/>
				</c:url>				
				<a href="${url}" class="btn btn-secondary btn-md" role="button">					
					Ver carrinho
				</a>
				<c:url var="url" value="/livros/comprar"/>
				<a href="${url}" class="btn btn-primary btn-md" role="button">					
					Finalizar compras					
				</a>
			</c:when>
			<c:otherwise>
				<div class="alert alert-warning" role="alert">
					Seu carrinho de compras está vazio.
				</div>
			</c:otherwise>
		</c:choose>
		</div>
	</main>
	<footer class="footer mt-auto py-3">
		<div class="container">
			<p><span class="text-muted">Implemented by <a href="https://github.com/igorasantos">Igor Santos</a> &#8226; classroom worksource by <a href="https://portal.imd.ufrn.br/">IMD</a> &#8226; UI by <a href="https://getbootstrap.com/docs/4.3/examples/sticky-footer-navbar/">Bootstrap</a>.</span></p>
		</div>
	</footer>
</body>
</html>