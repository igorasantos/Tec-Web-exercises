<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<h1>Lista de filmes</h1>
		<table>
			<%
				String[] filmes = (String[]) request.getAttribute("filmes");
				String filme=null;
				for (int i = 0; i < filmes.length; i++) {
					filme = filmes[i];
			%>
			<tr>
				<td><%= filme %></td>
			</tr>
				<%}%>
		</table>
	</body>
</html>