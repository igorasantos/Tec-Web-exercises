<%@ include file="/directives.jsp" %>
<c:set var="currentPage" value="receipt" scope="session" />
<%@ include file="/cabecalho_checkout.jsp" %>
<c:remove var="currentPage" scope="session"/>
<%@ include file="/cabecalho.jsp" %>

	<main role="main" class="flex-shrink-0">
		<div class="container">
			<div class="py-5 text-center">
				<h2>Obrigado, ${param.firstName}.</h2>
				<jsp:useBean id="now" class="java.util.Date"/>
				<jsp:setProperty name="now" property="time" value="${now.time+432000000}"/>
				<p class="lead">Seus livros serão enviados para você em <fmt:formatDate value="${now}" type="date" dateStyle="full"/>.</p>
			</div>
			<div class="d-flex p-2 justify-content-center">
				<c:remove var="cart" scope="session"/>
				<c:url var="url" value="/index.jsp"/>
	     		<a class="btn btn-success btn-lg" href="${url}" role="button">Continuar comprando</a>				    
			</div>
		</div>
	</main>			
	<%@ include file="/rodape.jsp"%>
</body>
</html>