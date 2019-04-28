<%@ include file="/directives.jsp" %>
<c:set var="currentPage" value="catalogo" scope="session" />
<%@ include file="/cabecalho.jsp" %>
<c:remove var="currentPage" scope="session"/>
	<main role="main" class="flex-shrink-0">
		<div class="container">
			<h1 class="mt-5">Catálogo</h1>
			<jsp:useBean id="livrariaBean" class="negocio.LivrariaBean" scope="page">
				<jsp:setProperty name="livrariaBean" property="sistema" value="${sistemaLivraria}"/>
			</jsp:useBean>
			
			<h2 class="m-1">Livros disponíveis</h2>
			<div class="row">
				<c:forEach var="livro" begin="0" items="${livrariaBean.livros}">				
					<div class="col-sm-6">						
						<div class="card m-3">
							<div class="card-body">
								<c:set var="idLivro" value="${livro.idLivro}"/>
								<c:url var="url" value="/loja/detalhesLivro">
									<c:param name="idLivro" value="${idLivro}"/>
								</c:url>
								
								<h5 class="card-title"><a href="${url}">${livro.titulo}</a></h5>
								<h6 class="card-subtitle mb-2 text-muted">${livro.autores}</h6>
								<p class="card-text float-left"><strong>
									<fmt:formatNumber value="${livro.preco}" type="currency"/>
								</strong></p>
								<c:url var="url" value="/loja/catalogo">
									<c:param name="Add" value="${idLivro}"/>
								</c:url>						
								<a href="${url}" class="card-link float-right"><i class="fas fa-cart-plus"></i> Adicionar ao carrinho</a>
							</div>
						</div>
					</div>				
				</c:forEach>
			</div>
			<c:if test="${not empty param.Add}">
				<c:set var="idL" value="${param.Add}"/>
				<jsp:setProperty name="livrariaBean" property="idLivro" value="${idL}"/>
				<c:set var="livroAdicionado" value="${livrariaBean.livro}"/>
				<div class="alert alert-success alert-dismissible fade show" role="alert">
	  				Você adicionou o livro <strong>${livroAdicionado.titulo}</strong> ao seu carrinho de compras!
	  				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</c:if>
			<div class="row m-3">
				<c:choose>
					<c:when test="${sessionScope.cart.numeroItens > 0}">
						<c:url var="url" value="/loja/mostrarCarrinho">
							<c:param name="limpar" value="0"/>
							<c:param name="remover" value="0"/>
						</c:url>				
						<a href="${url}" class="btn btn-primary btn-md m-1" role="button">					
							Ver carrinho
						</a>
						<c:url var="url" value="/loja/comprar"/>
						<a href="${url}" class="btn btn-success btn-md m-1" role="button">					
							Finalizar compras					
						</a>
					</c:when>
					<c:otherwise>
						<div class="alert alert-dark alert-dismissible fade show" role="alert">
			  				Carrinho vazio.
			  				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</main>
	<%@ include file="/rodape.jsp"%>
</body>
</html>
