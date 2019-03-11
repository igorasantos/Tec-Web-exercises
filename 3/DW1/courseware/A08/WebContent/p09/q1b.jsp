<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt_BR" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Teste de fmt:formatDate</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<style>
			.emph{
				color: #856404;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<h1>fmt:formatDate</h1>
			<p>value=<em class="emph">"\${pessoas}"</em> in var=<em class="emph">"p"</em></p>
			<p>value=<em class="emph">"\${p[0].dataNascimento.getTime()}"</em> in var=<em class="emph">"dtP0"</em></p>
			<p>value=<em class="emph">"\${p[1].dataNascimento.getTime()}"</em> in var=<em class="emph">"dtP1"</em></p>
			<p>value=<em class="emph">"\${p[2].dataNascimento.getTime()}"</em> in var=<em class="emph">"dtP2"</em></p>
			<div class="table-responsive-md">
				<table class="table table-hover">
					<c:set value="${pessoas}" var="p"/>
					<thead class="thead-dark">
						<tr>
							<th scope="col">Formatação</th>
							<th scope="col">
								<c:set value="${p[0].nome}" var="p0"/>
								<c:set value="${p[0].dataNascimento.getTime()}" var="dtP0"/>
								<c:out value="${p0}"/>
							</th>
							<th scope="col">
								<c:set value="${p[1].nome}" var="p1"/>
								<c:set value="${p[1].dataNascimento.getTime()}" var="dtP1"/>
								<c:out value="${p1}"/>
							</th>
							<th scope="col">
								<c:set value="${p[2].nome}" var="p2"/>
								<c:set value="${p[2].dataNascimento.getTime()}" var="dtP2"/>
								<c:out value="${p2}"/>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">Type=<span class="emph">"date"</span><br>dateStyle=<span class="emph">"default"</span></th>
							<td><fmt:formatDate value="${dtP0}" type="date" dateStyle="default"/></td>
							<td><fmt:formatDate value="${dtP1}" type="date" dateStyle="default"/></td>
							<td><fmt:formatDate value="${dtP2}" type="date" dateStyle="default"/></td>
						</tr>
						<tr>
							<th scope="row">Type=<span class="emph">"time"</span><br>timeStyle=<span class="emph">"default"</span></th>
							<td><fmt:formatDate value="${dtP0}" type="time" timeStyle="default"/></td>
							<td><fmt:formatDate value="${dtP1}" type="time" timeStyle="default"/></td>
							<td><fmt:formatDate value="${dtP2}" type="time" timeStyle="default"/></td>
						</tr>
						<tr>
							<th scope="row">Type=<span class="emph">"both"</span><br>dateStyle=<span class="emph">"default"</span><br>timeStyle=<span class="emph">"default"</span></th>
							<td><fmt:formatDate value="${dtP0}" type="both" dateStyle="default" timeStyle="default"/></td>
							<td><fmt:formatDate value="${dtP1}" type="both" dateStyle="default" timeStyle="default"/></td>
							<td><fmt:formatDate value="${dtP2}" type="both" dateStyle="default" timeStyle="default"/></td>
						</tr>
						<tr>
							<th scope="row">Type=<span class="emph">"both"</span><br>dateStyle=<span class="emph">"short"</span><br>timeStyle=<span class="emph">"short"</span></th>
							<td><fmt:formatDate value="${dtP0}" type="both" dateStyle="short" timeStyle="short"/></td>
							<td><fmt:formatDate value="${dtP1}" type="both" dateStyle="short" timeStyle="short"/></td>
							<td><fmt:formatDate value="${dtP2}" type="both" dateStyle="short" timeStyle="short"/></td>
						</tr>
						<tr>
							<th scope="row">Type=<span class="emph">"both"</span><br>dateStyle=<span class="emph">"medium"</span><br>timeStyle=<span class="emph">"medium"</span></th>
							<td><fmt:formatDate value="${dtP0}" type="both" dateStyle="medium" timeStyle="medium"/></td>
							<td><fmt:formatDate value="${dtP1}" type="both" dateStyle="medium" timeStyle="medium"/></td>
							<td><fmt:formatDate value="${dtP2}" type="both" dateStyle="medium" timeStyle="medium"/></td>
						</tr>
						<tr>
							<th scope="row">Type=<span class="emph">"both"</span><br>dateStyle=<span class="emph">"long"</span><br>timeStyle=<span class="emph">"long"</span></th>
							<td><fmt:formatDate value="${dtP0}" type="both" dateStyle="long" timeStyle="long"/></td>
							<td><fmt:formatDate value="${dtP1}" type="both" dateStyle="long" timeStyle="long"/></td>
							<td><fmt:formatDate value="${dtP2}" type="both" dateStyle="long" timeStyle="long"/></td>
						</tr>
						<tr>
							<th scope="row">Type=<span class="emph">"both"</span><br>dateStyle=<span class="emph">"full"</span><br>timeStyle=<span class="emph">"full"</span></th>
							<td><fmt:formatDate value="${dtP0}" type="both" dateStyle="full" timeStyle="full"/></td>
							<td><fmt:formatDate value="${dtP1}" type="both" dateStyle="full" timeStyle="full"/></td>
							<td><fmt:formatDate value="${dtP2}" type="both" dateStyle="full" timeStyle="full"/></td>
						</tr>	
					</tbody>					
				</table>
			</div>
		</div>
	</body>
</html>