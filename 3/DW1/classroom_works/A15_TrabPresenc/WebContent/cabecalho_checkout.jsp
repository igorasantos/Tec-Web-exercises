<!DOCTYPE html>
<html lang="pt" class="h-100">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>DW1 A15</title>
	<meta name="template-source" content="https://getbootstrap.com/docs/4.3/examples/sticky-footer-navbar/">
	<meta name="template-source" content="https://getbootstrap.com/docs/4.3/examples/checkout/">
	<!-- Bootstrap core CSS -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!-- Custom styles for this template -->
	<link href="https://getbootstrap.com/docs/4.3/examples/sticky-footer-navbar/sticky-footer-navbar.css" rel="stylesheet">
	<link href="https://getbootstrap.com/docs/4.3/examples/checkout/form-validation.css" rel="stylesheet">	
	<!-- Bootstrap JS, Popper.js, and jQuery  -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<!-- FontAwesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>
<body class="d-flex flex-column h-100">
	<header>
	<!-- Fixed navbar -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<a class="navbar-brand" href="../index.jsp">Projeto Livraria</a>
		  	<!-- botão para expandir o menu, em tela pequena -->
		    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarCollapse">
		    	<ul class="navbar-nav mr-auto">
		    		<li class="nav-item">
			        	<a class="nav-link" href="../index.jsp">Home</a>
			        </li>
			        <li class="nav-item
			        	<c:if test="${sessionScope.currentPage == 'catalogo'}">
			        		active
		        		</c:if>
	        		">
			        	<a class="nav-link" href="catalogo.jsp">Produtos
				        	<c:if test="${sessionScope.currentPage == 'catalogo'}">
				        		<span class="sr-only">(página atual)</span>
			        		</c:if>		        	
			        	</a>
			        </li>
			        <li class="nav-item
			        	<c:if test="${sessionScope.currentPage == 'carrinho'}">
			        		active
		        		</c:if>
	        		">
	        			<c:url var="url" value="/loja/mostrarCarrinho">
							<c:param name="limpar" value="0"/>
							<c:param name="remover" value="0"/>
						</c:url>				
						<a class="nav-link" href="${url}">					
							Carrinho			        	
				        	<c:if test="${sessionScope.currentPage == 'carrinho'}">
				        		<span class="sr-only">(página atual)</span>
			        		</c:if>		        	
			        	</a>
			        </li>		        
		      	</ul>
	      		<form class="form-inline mt-2 mt-md-0">
		        	<input class="form-control mr-sm-2" type="text" placeholder="Buscar produto" aria-label="Buscar produto">
		        	<button class="btn btn-outline-info my-2 my-sm-0" type="submit">Go</button>
		      	</form>
		    </div>
		</nav>
	</header>			