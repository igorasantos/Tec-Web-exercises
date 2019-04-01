<%@ include file="/cabecalho.jsp" %>
		<jsp:useBean id="livrariaBean" class="negocio.LivrariaBean" scope="page">
			<jsp:setProperty name="livrariaBean" property="sistema" value="${sistemaLivraria}"/>
		</jsp:useBean>
		<div class="jumbotron m-3">
			<div class="clearfix">
				<c:if test="${!empty param.idLivro}">
					<c:set var="id" value="${param.idLivro}"/>
					<jsp:setProperty name="livrariaBean" property="idLivro" value="${id}"/>
					<c:set var="livro" value="${livrariaBean.livro}"/>				
						<h1 class="display-4">Consulta de livro</h1>
						<p class="lead">${livro.titulo}</p>
						<hr class="my-4">
						<p>Autoria de <em>${livro.autores}</em> (${livro.ano})</p>
						<h2>Descrição</h2>
						<p><em>${livro.descricao}</em></p>
						<p class="float-left"><strong><fmt:formatNumber value="${livro.preco}" type="currency"/></strong></p>
						<c:url var="url" value="/livros/catalogo">
							<c:param name="Add" value="${id}"/>
						</c:url>						
						<a href="${url}" class="float-right"><i class="fas fa-cart-plus"></i> Adicionar ao carrinho</a>								
				</c:if>
			</div>					
			<c:url var="url" value="/livros/catalogo">
				<c:param name="Add" value=""/>
			</c:url>
			<a class="btn btn-primary btn-lg" href="${url}" role="button">Continuar comprando</a>
		</div>
<%@ include file="/rodape.jsp"%>