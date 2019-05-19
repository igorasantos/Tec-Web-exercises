<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DW2 a05 e 06 trab presenc</title>	
</head>
<body onload="get('todas',carregarReceitas)">
	<script src="../../code_to_jsp.js"></script>
	<h1>Receitas</h1>
	<select id="receitas" size="5" onChange="carregarReceita(this.value)" style="width: 100%">		
	</select>
	<br>
	<div id="receitaSelecionada" style="visibility:hidden;">
		<table class="table" border="1" width="100%">
			<tr>
				<td>Título:</td>
				<td id="titulo"></td>				
			</tr>
			<tr>
				<td>Descrição:</td>
				<td id="descricao"></td>				
			</tr>
			<tr>
				<td>Ingredientes:</td>
				<td id="ingredientes"></td>				
			</tr>
			<tr>
				<td>Preparo:</td>
				<td id="preparo"></td>				
			</tr>
		</table>
	</div>	
	
</body>
</html>