<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Vari�veis da p�gina -->
<c:set var="paginaTitulo" value="Erro :("></c:set>
<c:set var="paginaId" value="erro"></c:set>
<!-- Vari�veis da p�gina -->

		<%@include file="componente/topo.jsp"%>
			<div class="container py-5">
				<div class="row">
					<c:set var="erro_modelo_titulo" value="Erro!"></c:set>
					<c:set var="erro_modelo_mensagem" value="Um imprevisto ocorreu e n�o tivemos como atender sua solicita��o. Tente de novo mais tarde. Pedimos desculpas pelo transtorno."></c:set>
					<%@include file="componente/erroModelo.jsp"%>
				</div>
			</div>
			
		<%@include file="componente/rodape.jsp"%>
	</body>
</html>