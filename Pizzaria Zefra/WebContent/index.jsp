<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Variáveis da página -->
<c:set var="paginaTitulo" value="Pizzaria Zefra"></c:set>
<c:set var="paginaId" value="index"></c:set>
<!-- Variáveis da página -->

<%@include file="componente/topo.jsp"%>
		<article>
			<section class="mt-5 wow fadeInLeftBig text-justify">
				<div class="container rounded py-3 text-dark section-shadow bg-branco">
					<div class="row">
						<div class="col-md-4">
							<img src="imagem/qualidade.jpg" class="img-fluid img-round rounded">
						</div>
						<div class="mt-3 mt-md-0 px-lg-5 col-md-8">
							<h2>Qualidade</h2>
							<h5 class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris non felis sed est aliquet pretium. Donec dictum, velit et gravida malesuada, mi enim pharetra mauris, sollicitudin ornare arcu massa at velit. Quisque semper varius lectus eget dapibus. Duis luctus justo at orci ultrices pellentesque.</h5>
						</div>
					</div>
				</div>
			</section>

			<section class="mt-5 wow fadeInLeftBig text-justify">
				<div class="container rounded py-3 text-dark section-shadow bg-branco">
					<div class="row d-flex flex-column-reverse flex-md-row">
						<div class="mt-3 mt-md-0 px-lg-5 col-md-8">
							<h2>Entrega eficiente</h2>
							<h5 class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris non felis sed est aliquet pretium. Donec dictum, velit et gravida malesuada, mi enim pharetra mauris, sollicitudin ornare arcu massa at velit. Quisque semper varius lectus eget dapibus. Duis luctus justo at orci ultrices pellentesque.</h5>
						</div>
						<div class="col-md-4">
							<img src="imagem/entrega.jpeg" class="img-fluid img-round rounded">
						</div>
					</div>
				</div>
			</section>

			<section class="mt-5 wow fadeInLeftBig text-justify">
				<div class="container rounded py-3 text-dark section-shadow bg-branco">
					<div class="row d-flex">
						<div class="col-md-4">
							<img src="imagem/seguranca.jpeg" class="img-fluid img-round rounded">
						</div>
						<div class="mt-3 mt-md-0 px-lg-5 col-md-8">
							<h2>Segurança</h2>
							<h5 class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris non felis sed est aliquet pretium. Donec dictum, velit et gravida malesuada, mi enim pharetra mauris, sollicitudin ornare arcu massa at velit. Quisque semper varius lectus eget dapibus. Duis luctus justo at orci ultrices pellentesque.</h5>
						</div>
					</div>
				</div>
			</section>

			<section class="mt-5 wow fadeInLeftBig text-justify">
				<div class="container rounded py-3 text-dark section-shadow bg-branco">
					<div class="row d-flex flex-column-reverse flex-md-row">
						<div class="mt-3 mt-md-0 px-lg-5 col-md-8">
							<h2>Preço baixo e promoções</h2>
							<h5 class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris non felis sed est aliquet pretium. Donec dictum, velit et gravida malesuada, mi enim pharetra mauris, sollicitudin ornare arcu massa at velit. Quisque semper varius lectus eget dapibus. Duis luctus justo at orci ultrices pellentesque.</h5>
						</div>
						<div class="col-md-4">
							<img src="imagem/preco.jpg" class="img-fluid img-round rounded">
						</div>
					</div>
				</div>
			</section>
		</article>

		<article id="avaliacoes" class="my-5">
			<div class="parallax bg-feliz-img mb-5">
				<div class="py-5 text-center text-light bg-semitransparente-50">
					<h2 class="py-5 display-2">Você em <span class="d-none d-sm-inline">primeiro</span><span class="d-inline d-sm-none">1º</span> lugar</h2>
					<p class="lead">Confira nossas avaliações abaixo</p>
				</div>
			</div>
			<section>
				<div class="container">
					<div class="row">

						<div class="col-12 col-sm-6 col-md-4 col-lg-3">
							<div class="card border-0 card-responsivo rounded-0 card-shadow h-100 wow fadeInLeftBig ">
								<div class="miniatura">
									<img class="avaliacao" src="imagem/mulher1.jpeg">
								</div>
								<div class="card-title text-center mt-2 mb-0">
									<h5 class="mb-0">Luciana Prado</h5>
								</div>
								<div class="card-body text-justify px-2">
									<cite>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla efficitur nunc nec pretium eleifend."</cite>
								</div>
								<div class="card-footer text-center bg-dark text-amarelo rounded-0">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</div>
							</div>
						</div>

						<div class="col-12 col-sm-6 col-md-4 col-lg-3 mt-5 mt-sm-0">
							<div class="card border-0 card-responsivo rounded-0 card-shadow h-100 wow fadeInLeftBig ">
								<div class="miniatura">
									<a href="https://github.com/leandro-rmc">
										<img class="avaliacao" src="imagem/lr.jpg">
									</a>
								</div>
								<div class="card-title text-center mt-2 mb-0">
									<h5 class="mb-0">Leandro Rocha</h5>
								</div>
								<div class="card-body text-justify px-2">
									<cite>"Sed vitae dignissim ex. In aliquet tincidunt eros, vitae blandit nunc porta ut"</cite>
								</div>
								<div class="card-footer text-center bg-dark rounded-0">
									<i class="text-amarelo fas fa-star"></i>
									<i class="text-amarelo fas fa-star"></i>
									<i class="text-amarelo fas fa-star"></i>
									<i class="text-amarelo fas fa-star"></i>
									<i class="text-amarelo fas fa-star"></i>
								</div>
							</div>
						</div>

						<div class="col-12 col-sm-6 col-md-4 col-lg-3 mt-5 mt-md-0">
							<div class="card border-0 card-responsivo rounded-0 card-shadow h-100 wow fadeInLeftBig ">
								<div class="miniatura">
									<img class="avaliacao" src="imagem/mulher2.jpeg">
								</div>
								<div class="card-title text-center mt-2 mb-0">
									<h5 class="mb-0">Paola Andrade</h5>
								</div>
								<div class="card-body text-justify px-2">
									<cite>"Dolor sit amet, consectetur adipiscing elit. Nulla efficitur nunc nec pretium eleifend. Sed vitae dignissim ex.</cite>
								</div>
								<div class="card-footer text-center bg-dark text-amarelo rounded-0">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</div>
							</div>
						</div>

						<div class="col-12 col-sm-6 col-md-4 col-lg-3 mt-5 mt-lg-0">
							<div class="card border-0 card-responsivo rounded-0 card-shadow h-100 wow fadeInLeftBig ">
								<div class="miniatura">
									<img class="avaliacao" src="imagem/homem2.jpeg">
								</div>
								<div class="card-title text-center mt-2 mb-0">
									<h5 class="mb-0">Roberto Castro</h5>
								</div>
								<div class="card-body text-justify px-2">
									<cite>"Dolor sit amet dignissim ex. In aliquet tincidunt eros, vitae blandit nunc porta ut."</cite>
								</div>
								<div class="card-footer text-center caixa-votos bg-dark rounded-0">
									<i class="text-amarelo fas fa-star"></i>
									<i class="text-amarelo fas fa-star"></i>
									<i class="text-amarelo fas fa-star"></i>
									<i class="text-amarelo fas fa-star"></i>
									<i class="fas fa-star"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</article>

		<%@include file="componente/rodape.jsp"%>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
		<script>
			var wow = new WOW(
			  {
				boxClass:     'wow',      // animated element css class (default is wow)
				animateClass: 'animated', // animation css class (default is animated)
				offset:       60,          // distance to the element when triggering the animation (default is 0)
				mobile:       false,       // trigger animations on mobile devices (default is true)
				live:         true,       // act on asynchronously loaded content (default is true)
				callback:     function(box) {
				  // the callback is fired every time an animation is started
				  // the argument that is passed in is the DOM node being animated
				},
				scrollContainer: null,    // optional scroll container selector, otherwise use window,
				resetAnimation: true,     // reset animation on end (default is true)
			  }
			);
			wow.init();
		</script>
	</body>
</html>