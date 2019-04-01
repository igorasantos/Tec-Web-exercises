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
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
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
		        <li class="nav-item <c:if test="${param.thisPage}=='pedidos'">active</c:if>">
		        	<a class="nav-link" href="#">Pedidos</a>
		        </li>
		        <li class="nav-item <c:if test="${param.thisPage}=='catalogo'">active</c:if>">		        		        
		        	<a class="nav-link" href="catalogo">Carrinho <span class="sr-only">(página atual)</span></a>
		        </li>
		        <li class="nav-item <c:if test="${param.thisPage}=='contato'">active</c:if>">
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
			