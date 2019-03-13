<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<body>
		<c:set var="tempStr" value="Functions e Tags tem sintaxe diferente"/>
		<p>String usada: <em>"Functions e Tags tem sintaxe diferente"</em> in var=<em>"tempStr"</em>.</p>
		<p>O tamanho da String tempStr é: ${fn:length(tempStr)}</p>
		<p>A substring depois da palavra "Tags" é: ${fn:substringAfter(tempStr,"Tags")}</p>
		<p>A substring antes da palavra "tem" é: ${fn:substringBefore(tempStr,"tem")}</p>
		<p>Esta string contém a palavra "tags"? ${fn:containsIgnoreCase(tempStr,"tags")}</p>
	</body>
</html>