<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="col">
	<h1 class="display-1 m-0 text-danger text-center"><strong><c:out value="${erro_modelo_titulo}"/></strong></h1>
	<div class="row">
		<div class="mt-2 col-12 col-md-8 offset-md-2 text-center lead">
			 <strong><c:out value="${erro_modelo_mensagem}"/></strong>
		</div>
	</div>
	<div class="row my-5">
		<div class="col-12 text-center mb-4">
			 <c:if test="${!empty erro_modelo_botao_link}">
			 	<a href="${erro_modelo_botao_link}"><button class="btn btn-warning">${erro_modelo_botao_texto}</button></a>
			 </c:if>
			 <c:if test="${empty erro_modelo_botao_link}">
				 <a href="index.jsp"><button class="btn btn-warning">Voltar para a página inicial</button></a>
			</c:if>
		</div>
	</div>
</div>