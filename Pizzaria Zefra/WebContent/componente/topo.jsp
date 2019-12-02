<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:if test="${sessionScope.logado == true}">
	<c:if test="${paginaId == 'logar'}">
		<c:redirect url = "/index.jsp"/>
	</c:if>
	<c:if test="${paginaId == 'cadastrar'}">
		<c:redirect url = "/index.jsp"/>
	</c:if>
</c:if>
<c:if test="${sessionScope.logado != true}">
	<c:if test="${paginaId == 'perfil'}">
		<c:redirect url = "/index.jsp"/>
	</c:if>
</c:if>

<c:if test="${fn:length(sessionScope.carrinho) > 0 }">
	<c:set var="quantidadeTotalProdutos" value="0"></c:set>
	<c:forEach items="${sessionScope.carrinho}" var="c">
		<c:choose>
			<c:when test="${c.value.tipo != 'pizza'}">
				<c:set var="quantidadeTotalProdutos" value="${quantidadeTotalProdutos + c.value.quantidade}"></c:set>
			</c:when>
			<c:otherwise>
				<c:forEach items="${c.value.itemPedidoPizza}" var="p">
					<c:set var="quantidadeTotalProdutos" value="${quantidadeTotalProdutos + p.quantidade}"></c:set>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</c:if>

<c:if test="${paginaId == 'index'}"><c:set var="indexAtivo" value="active"></c:set></c:if>
<c:if test="${paginaId == 'cadastrar'}"><c:set var="cadastrarAtivo" value="active"></c:set></c:if>
<c:if test="${paginaId == 'logar'}"><c:set var="logarAtivo" value="active"></c:set></c:if>
<c:if test="${paginaId == 'produtos'}"><c:set var="produtosAtivo" value="active"></c:set></c:if>
<c:if test="${paginaId == 'carrinho'}"><c:set var="carrinhoAtivo" value="active"></c:set></c:if>
<c:if test="${paginaId == 'perfil'}"><c:set var="perfilAtivo" value="active"></c:set></c:if>
<c:if test="${paginaId == 'pedidos'}"><c:set var="pedidosAtivo" value="active"></c:set></c:if>

<c:if test="${param.tipo == 'pizza'}">
	<c:set var="pizzaActive" value="active"></c:set>
</c:if>
<c:if test="${param.tipo == 'bebida'}">
	<c:set var="bebidaActive" value="active"></c:set>
</c:if>
<c:if test="${param.tipo == 'sobremesa'}">
	<c:set var="sobremesaActive" value="active"></c:set>
</c:if>

<!DOCTYPE html>
<html>
	<head>
		<title>${paginaTitulo}</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
		<c:if test="${paginaId == 'index'}">
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.css">
		</c:if>
		<link rel="stylesheet" href="css/estilo.css">
	</head>
	<body id="topo">
		<div class="parallax bg-pizza-img">
			<div class="bg-semitransparente-70">
				<nav class="navbar navbar-expand-lg navbar-dark">
					<div class="container-fluid">
						<button class="navbar-toggler" data-toggle="collapse" data-target="#navMenu">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navMenu">
							<div class="navbar-nav mr-auto">
								<a href="index.jsp" class="nav-item nav-link mr-4 ${indexAtivo}">Início</a>
								<!--
								<div class="dropdown dropdown-pizza mr-3">
								  <a class="nav-item nav-link dropdown-toggle ${produtosAtivo}" href="#" role="button" data-toggle="dropdown">
									Cardápio
								  </a>
								  <div class="dropdown-menu">
									<a class="dropdown-item ${pizzaActive}" href="produtos.html?tipo=pizza">Pizzas</a>
									<a class="dropdown-item ${bebidaActive}" href="produtos.html?tipo=bebida">Bebidas</a>
									<a class="dropdown-item ${sobremesaActive}" href="produtos.html?tipo=sobremesa">Sobremesas</a>
								  </div>
								</div>
								-->
								<a href="produtos.html?tipo=pizza" class="nav-item nav-link mr-4 ${pizzaActive}">Pizzas</a>
								<a href="produtos.html?tipo=bebida" class="nav-item nav-link mr-4 ${bebidaActive}">Bebidas</a>
								<a href="produtos.html?tipo=sobremesa" class="nav-item nav-link mr-4 ${sobremesaActive}">Sobremesas</a>
								<c:if test="${sessionScope.logado == true}">
									<a href="perfil.html" class="nav-item nav-link mr-4 ${perfilAtivo}">Perfil</a>	
									<a href="pedidos.html" class="nav-item nav-link mr-4 ${pedidosAtivo}">Pedidos</a>	
								</c:if>
								<a href="carrinho.html" class="nav-item nav-link mr-4 ${carrinhoAtivo}">Carrinho <span class="badge badge-danger"><c:out value="${quantidadeTotalProdutos}"></c:out></span></a>
							</div>	
							
							<div class="navbar-nav navbbar">
								<c:if test="${sessionScope.logado != true}">
									<a href="cadastrar.jsp" class="nav-item nav-link mr-4 ${cadastrarAtivo}">Cadastrar</a>
									<a href="logar.jsp" class="nav-item nav-link ${logarAtivo}">Logar</a>
								</c:if>
								<c:if test="${sessionScope.logado == true}">
									<a href="deslogar" class="nav-item nav-link">Deslogar</a>
								</c:if>
							</div>
						</div>
					</div>
				</nav>
				<header class="pb-5 pt-5 text-light">
					<div class="pb-5 container">
						<div class="row">
							<div class="col-lg-12 text-center">
								<div class="text-center">
									<h1 class="display-4"><strong>Pizzaria Zefra</strong></h1>
									<h6 class="lead">
										<c:if test="${sessionScope.logado != true}">
											Compre online e receba em casa!
										</c:if>
										<c:if test="${sessionScope.logado == true}">
											Olá, <span class="text-laranja-escuro"><strong><c:out value="${sessionScope.usuarioNome}"/></strong></span>
										</c:if>
									</h6>
								</div>
							</div>
				
						</div>
					</div>
				</header>
			</div>
		</div>