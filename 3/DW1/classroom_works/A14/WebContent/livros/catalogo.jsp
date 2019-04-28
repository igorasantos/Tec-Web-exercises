<%@ include file="/cabecalho.jsp" %>
<!-- a importação foi feita aqui, pois a tela inicial é diferente das demais -->
		<h1 class="mt-5">Carrinho de compras</h1>
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
			<h2>Livros disponíveis para compra</h2>
			<div class="row">
				<c:forEach var="livro" begin="0" items="${livrariaBean.livros}">				
					<div class="col-sm-6">						
						<div class="card m-3">
							<div class="card-body">
								<c:set var="idLivro" value="${livro.idLivro}"/>
								<c:url var="url" value="/livros/detalhesLivro">
									<c:param name="idLivro" value="${idLivro}"/>
								</c:url>
								
								<h5 class="card-title"><a href="${url}">${livro.titulo}</a></h5>
								<h6 class="card-subtitle mb-2 text-muted">${livro.autores}</h6>
								<p class="card-text float-left"><strong>
									<fmt:formatNumber value="${livro.preco}" type="currency"/>
								</strong></p>
								<c:url var="url" value="/livros/catalogo">
									<c:param name="Add" value="${idLivro}"/>
								</c:url>						
								<a href="${url}" class="card-link float-right"><i class="fas fa-cart-plus"></i> Adicionar ao carrinho</a>
							</div>
						</div>
					</div>				
				</c:forEach>
			</div>
			<c:choose>
				<c:when test="sessionScope.cart.numeroItens > 0">
					<c:url var="url" value="/livros/mostrarCarrinho">
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
		
<%@ include file="/rodape.jsp"%>