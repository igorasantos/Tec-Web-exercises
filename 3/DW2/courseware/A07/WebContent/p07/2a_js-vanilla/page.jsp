<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>JSON + JS Vanilla</title>
  <!--
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  -->  
</head>
<body onload="onLoad();">
  <script src="code.js"></script>
  <select id="livros" size="2" onclick="carregarLivro(this.value)">
  </select>
  <br>  
  <table border="1" style="visibility: hidden;" id="tabLivroSelecionado">
      <tr>
        <td>Nome:</td>
        <td id="nome"></td>
      </tr>
      <tr>
        <td>ISBN:</td>
        <td id="isbn"></td>
      </tr>
      <tr>
        <td>Editora:</td>
        <td id="editora"></td>
      </tr>
      <tr>
        <td>Edição:</td>
        <td id="edicao"></td>
      </tr>
      <tr>
        <td>Autor(es):</td>
        <td id="autores"></td>
      </tr>
      <tr>
        <td>Preço:</td>
      	<td id="preco"></td>
      </tr>
      <tr>
        <td>Sinopse:</td>
        <td id="sinopse"></td>
      </tr>
  </table>
</body>
</html>