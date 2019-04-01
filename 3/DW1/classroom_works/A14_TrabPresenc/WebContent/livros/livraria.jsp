<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="template-author-link" content="https://twitter.com/mdo">
    <meta name="template-source" content="https://getbootstrap.com/docs/4.3/examples/cover/">
    <title>DW1 A12 e 13</title>
    <!-- Bootstrap core CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/4.3/examples/cover/cover.css" rel="stylesheet">
    <style>
      body {
        background-image: url("https://source.unsplash.com/2JIvboGLeho/1366x768");
        /* Photo by Susan Yin on Unsplash: https://unsplash.com/photos/2JIvboGLeho */
        background-size: cover;
      }
      div#mask{
        background-color: rgba(33, 33, 33, 0.65);        
      }
    </style>
  </head>
  <body class="text-center">
    <div id="mask" class="w-100 h-100">
      <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
        <header class="masthead mb-auto">
          <div class="inner">
            <h3 class="masthead-brand">Projeto Livraria</h3>
            <nav class="nav nav-masthead justify-content-center">
              <a class="nav-link active" href="#">Home</a>
              <a class="nav-link" href="#">Pedidos</a>
              <a class="nav-link" href="catalogo">Carrinho</a>
              <a class="nav-link" href="#">Contato</a>
            </nav>
          </div>
        </header>
        <main role="main" class="inner cover">
          <h1 class="cover-heading">Livro.</h1>
          <p class="lead">Uma das melhores fontes do conhecimento humano. Compre um agora mesmo.</p>
          <p class="lead">
            <c:url var="url" value="/livros/catalogo"/>
            <a href="${url}?Add=" class="btn btn-lg btn-secondary">Iniciar compras</a>
          </p>
        </main>
        <footer class="mastfoot mt-auto">
          <div class="inner">
            <p>Implemented by <a href="https://github.com/igorasantos">Igor Santos</a> &#8226; classroom worksource by <a href="https://portal.imd.ufrn.br/">IMD</a><br>UI by <a href="https://getbootstrap.com/docs/4.3/examples/cover/">Bootstrap</a> &#8226; Template by <a href="https://twitter.com/mdo">@mdo</a>.</p>
          </div>
        </footer>
      </div>
    </div>
  </body>
</html>


