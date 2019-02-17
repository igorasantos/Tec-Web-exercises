<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<p>Olá!</p>
		<!-- 1: Esse comentário vai para o navegador Web -->
		<%-- 2: já esse comentário não vai --%>
		<!--<%= " 3: já esse comentário, só vai pq tá retornando essa string." %>-->
		<!-- 4: e esse aqui dentro: [<% int i = 1; %>] não vai aparecer, pois contém um código realizando operação -->
	</body>
</html>