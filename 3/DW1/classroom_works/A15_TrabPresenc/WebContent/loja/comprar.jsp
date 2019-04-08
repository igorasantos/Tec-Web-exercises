<%@ include file="/directives.jsp" %>
<c:set var="currentPage" value="checkout" scope="session" />
<%@ include file="/cabecalho_checkout.jsp" %>
<c:remove var="currentPage" scope="session"/>
	<main role="main" class="flex-shrink-0">
		<div class="container">
			<div class="py-5 text-center">
				<h2>Finalizar compra</h2>
				<p class="lead">Para efetuarmos sua compra, precisamos de alguns dados.</p>
			</div>		
			<div class="row">
				<div class="col-md-4 order-md-2 mb-4">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-muted">Suas compras</span>
						<span class="badge badge-secondary badge-pill">${sessionScope.cart.numeroItens}</span>
					</h4>
					<ul class="list-group mb-3">			    
						<c:forEach var="itemCompra" items="${sessionScope.cart.itens}">
							<c:set var="livro" value="${itemCompra.item}"/>
							<li class="list-group-item d-flex justify-content-between lh-condensed">
								<div>
									<h6 class="my-0">${livro.titulo}</h6>
									<small class="text-muted">${livro.ano}</small>
								</div>
								<span class="text-muted">
									<fmt:formatNumber value="${livro.preco}" type="currency"/><wbr>(x${itemCompra.quantidade})								
								</span>
							</li>			 			
						</c:forEach>
						<li class="list-group-item d-flex justify-content-between">
							<span>Total (BRL)</span>
							<strong>
								<fmt:formatNumber value="${sessionScope.cart.total}" type="currency"/>
							</strong>
						</li>
					</ul>							    
				</div>			  
				<div class="col-md-8 order-md-1">
					<h4 class="mb-3">Dados de cobrança</h4>
				    <c:url var="url" value="recibo"/>
				    <form action="${url}" method="post">
				    <!-- <form class="needs-validation" action="${url}" method="post" novalidate=""> -->
						<div class="row">
				        	<div class="col-md-6 mb-3">
								<label for="firstName">Nome</label>
								<input type="text" class="form-control" id="firstName" name="firstName" placeholder="Primeiro nome" value="" required="">
								<div class="invalid-feedback">
									Digite um nome válido.
								</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="lastName">Sobrenome</label>
								<input type="text" class="form-control" id="lastName" name="lastName" placeholder="Último nome" value="" required="">
								<div class="invalid-feedback">
									Digite um nome válido.
								</div>
							</div>
						</div>
						<hr class="mb-4">			
						<h4 class="mb-3">Pagamento</h4>			
							<div class="d-block my-3">
							  <div class="custom-control custom-radio">
							    <input id="creditOption" name="metodoPagamento" type="radio" class="custom-control-input" checked="" required="">
							    <label class="custom-control-label" for="creditOption">Cartão de Crédito</label>
							  </div>
							  <div class="custom-control custom-radio">
							    <input id="boletoOption" name="metodoPagamento" type="radio" class="custom-control-input" required="">
							    <label class="custom-control-label" for="boletoOption">Boleto Bancário</label>
							  </div>
							</div>
							<fieldset id ="inputsToCCred">
								<div class="row">
									<div class="col-md-6 mb-3">
										<label for="cc-name">Nome do titular</label>
										<input type="text" class="form-control" id="cc-name" name="cc-name" placeholder="" required="">
										<small class="text-muted">Nome completo conforme impresso no cartão</small>
										<div class="invalid-feedback">
											Digite o nome do titular do cartão
										</div>
									</div>
									<div class="col-md-6 mb-3">
										<label for="cc-number">Número do cartão de crédito</label>
										<input type="text" class="form-control" id="cc-number" name="cc-number" placeholder="XXXX XXXX XXXX XXXX" required="">
										<div class="invalid-feedback">
											Digite o número do cartão de crédito
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3 mb-3">
										<label for="cc-expiration">Data de vencimento</label>
										<input type="text" class="form-control" id="cc-expiration" name="cc-expiration" placeholder="MM/YY" required="">
										<div class="invalid-feedback">
											Digite a data de vencimento do cartão
										</div>
									</div>
									<div class="col-md-3 mb-3">
										<label for="cc-cvv">Código de segurança</label>
										<input type="text" class="form-control" id="cc-cvv" name="cc-cvv" placeholder="CVV" required="" size="3">
										<div class="invalid-feedback">
											Digite o código de segurança
										</div>
									</div>
								</div>
							</fieldset>
				      		<hr class="mb-4">
				      		<button class="btn btn-success btn-lg btn-block" type="submit">Comprar</button>
				    </form>
				</div>
			</div>
		</div>
	</main>			
	<%@ include file="/rodape.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/jquery-mask-plugin@1.14.15/dist/jquery.mask.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#cc-number').mask('0000 0000 0000 0000');
			$('#cc-expiration').mask('00/00');
		});
		$("#creditOption").click(function() {$("#inputsToCCred").prop("disabled", false);});
		$("#boletoOption").click(function() {$("#inputsToCCred").prop("disabled", true);});
	</script>
</body>
</html>