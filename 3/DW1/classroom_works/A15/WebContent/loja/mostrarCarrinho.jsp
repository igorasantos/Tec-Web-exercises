<%@ include file="/directives.jsp" %>
<c:set var="currentPage" value="carrinho" scope="session" />
<%@ include file="/cabecalho.jsp" %>
<c:remove var="currentPage" scope="session"/>
	<main role="main" class="flex-shrink-0">					
		<jsp:useBean id="livrariaBean" class="negocio.LivrariaBean" scope="page">
			<jsp:setProperty name="livrariaBean" property="sistema" value="${sistemaLivraria}"/>
		</jsp:useBean>
		<c:if test = "${param.limpar == 'limpar'}">
			<div class="modal fade" id="modalEmptyCart" tabindex="-1" role="dialog" aria-labelledby="modalEmptyCartLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="modalEmptyCartLabel">Ahh...</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						</div>
						<div class="modal-body">
							<div class="alert alert-danger" role="alert">
								Que pena... O carrinho está vazio :(
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-danger" data-dismiss="modal">Ok</button>								
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${param.remover != '0'}">
			<c:set var="id" value="${param.remover}"/>
			<jsp:setProperty name="livrariaBean" property="idLivro" value="${id}"/>
			<c:set var="livroRemovido" value="${livrariaBean.livro}"/>				
			<div class="modal fade" id="modalRemover" tabindex="-1" role="dialog" aria-labelledby="modalRemoverLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="modalRemoverLabel">Remoção de item</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						</div>
						<div class="modal-body">
							<div class="alert alert-warning" role="alert">
								O livro <strong>${livroRemovido.titulo}</strong> foi removido do carrinho.
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-warning" data-dismiss="modal">Ok</button>								
						</div>
					</div>
				</div>
			</div>				
		</c:if>
		<c:if test="${sessionScope.cart.numeroItens <= 0}">			
			<div class="container">
				<h1 class="mt-5">Carrinho vazio</h1>				
				<c:url var="url" value="/loja/catalogo">
					<c:param name="Add" value="" />
				</c:url>
				<a class="btn btn-primary m-3" href="${url}" role="button">Ver catálogo</a>									
			</div>
		</c:if>			
		<c:if test="${sessionScope.cart.numeroItens > 0}">
			<div class="container">
				<h1 class="mt-5">Carrinho de compras</h1>
				<div class="alert alert-primary" role="alert">
	  				Quantidade de itens do carrinho: <em>${sessionScope.cart.numeroItens} </em>
	  				<c:choose>
						<c:when test="${sessionScope.cart.numeroItens == 1}">
							livro.
						</c:when>
						<c:otherwise>
							livros.
						</c:otherwise>
					</c:choose>
				</div>
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Quantidade</th>
							<th scope="col">Título</th>
							<th scope="col">Preço</th>
						</tr>
					</thead>
				 	<tbody>
				 		<c:forEach var="itemCompra" items="${sessionScope.cart.itens}">
				 			<c:set var="livro" value="${itemCompra.item}"/>
				 			<tr>
				 				<td>${itemCompra.quantidade}</td>
				 				<td>
				 					<c:url var="url" value="/loja/detalhesLivro">
				 						<c:param name="idLivro" value="${livro.idLivro}"/>
				 						<c:param name="Clear" value="0"/>
				 					</c:url>
				 					<strong><a href="${url}">${livro.titulo}</a></strong>
				 				</td>
				 				<td>
				 					<fmt:formatNumber value="${livro.preco}" type="currency"/>
				 					<c:url var="url" value="/loja/mostrarCarrinho">
			 							<c:param name="remover" value="${livro.idLivro}"/>
		 							</c:url>
		 							<a href="${url}">&nbsp;<i class="fas fa-trash-alt"></i></a>
				 				</td>
				 			</tr>
				 		</c:forEach>
				 	</tbody>
				 	<tfoot>
				 		<tr>
				 			<td></td>
				 			<td class="text-right"><strong>Subtotal</strong></td>
				 			<td>
				 				<fmt:formatNumber value="${sessionScope.cart.total}" type="currency"/>
				 			</td> 
				 		</tr>
				 	</tfoot>
				</table>
				<div class="row">								
					<c:url var="url" value="/loja/mostrarCarrinho">
						<c:param name="limpar" value="limpar" />
						<c:param name="remover" value="0" />
					</c:url>
					<a href="${url}" class="btn btn-secondary col m-3 p-2">Esvaziar carrinho</a>
					<c:url var="url" value="/loja/catalogo">
						<c:param name="Add" value=""/>
					</c:url>
					<a href="${url}" class="btn btn-primary col m-3 p-2">Continuar comprando</a>
					<c:url var="url" value="/loja/comprar" />
					<a href="${url}" class="btn btn-success col m-3 p-2">Finalizar compra</a>								
				</div>
			</div>
		</c:if>		
	</main>
	<%@ include file="/rodape.jsp"%>	
	<script>
		var urlParams = new URLSearchParams(window.location.search);
		if (urlParams.get('remover') !== '0') $('#modalRemover').modal();
		if (urlParams.get('limpar') === 'limpar') $('#modalEmptyCart').modal();
	</script>
</body>
</html>