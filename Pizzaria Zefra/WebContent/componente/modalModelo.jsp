<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div id="modalConfirmacao" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
		<h5 id="modalConfirmacao-titulo" class="modal-title lead m-auto"></h5>
      </div>
      <div class="modal-body">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="py-3" id="modalConfirmacao-mensagem">
					</div>
				</div>
			</div>
		</div>
      </div>
      
      <div class="modal-footer">
		<div class="container">
			<div class="row">
				<div class="col-6">
					<button id="modalConfirmacao-sim" type="button" class="form-control btn btn-pizza">Sim</button>
				</div>
				<div class="col-6">
					<button type="button" class="form-control btn btn-secondary" data-dismiss="modal">Não</button>
				</div>
			</div>
		</div>
      </div>
    </div>
  </div>
</div>

<div id="modalAvaliacao" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
		<h5 id="modalAvaliacao-titulo" class="modal-title lead m-auto"></h5>
      </div>
      <div class="modal-body">
		<div class="container">
			<form action="avaliarproduto.html" method="POST">
				<div class="row">
					<div class="col">
						<label for="modalAvaliacao-textoAvaliacao">
							Comentário <span class="text-muted font-monospace">(opcional)</span>
						</label>
						<textarea name="comentario" id="modalAvaliacao-textoAvaliacao" class="rounded texto-avaliacao" rows="6" class="form-control" placeholder="O que você achou do produto?"></textarea>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						<label for="modalAvaliacao-notas">
							Nota de 0 a 10
						</label>
						<select name="nota" id="modalAvaliacao-notas" class="form-control">
							<c:forEach begin="0" end="10" varStatus="notas">
								<option class="modalAvaliacao-option-nota modalAvaliacao-nota-${notas.index}" value="${notas.index}">${notas.index}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-6">
						<input type="hidden" name="idProduto" id="modalAvaliacao-idProduto" value="0">
						<button id="modalAvaliacao-enviar" class="form-control btn btn-success">Salvar</button>
					</div>
					<div class="col-6">
						<button class="form-control btn btn-secondary" data-dismiss="modal">Cancelar</button>
					</div>
				</div>
			</form>
		</div>
      </div>
    </div>
  </div>
</div>

<c:if test="${fn:length(tipoPagamento) != 0}">

	<div id="modalConfirmacaoPedido" class="modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
			<h5 id="modalConfirmacaoPedido-titulo" class="modal-title lead m-auto"></h5>
	      </div>
	      <div class="modal-body">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="py-3 text-center" id="modalConfirmacaoPedido-mensagem">
						</div>
						
						<div class="mt-2">
							<label for="modalConfirmacaoPedido-tipoPagamento" class="d-block text-muted">Tipo de pagamento</label>
							<select id="modalConfirmacaoPedido-tipoPagamento" name="tipoPagamento" class="form-control">
								<c:forEach items="${tipoPagamento}" var="tp">
									<option value="${tp.id}"><c:out value="${tp.tipo}"></c:out></option>
								</c:forEach>
								<!--
								<option value="1">Dinheiro</option>
								<option value="2">Cartão de Crédito</option>
								<option value="3">Cartão de Débito</option>
								 -->
							</select>
						</div>
						
					</div>
				</div>
			</div>
	      </div>
	      
	      <div class="modal-footer">
			<div class="container">
				<div class="row">
					<div class="col-6">
						<button id="modalConfirmacaoPedido-sim" type="button" class="form-control btn btn-pizza">Sim</button>
					</div>
					<div class="col-6">
						<button type="button" class="form-control btn btn-secondary" data-dismiss="modal">Não</button>
					</div>
				</div>
			</div>
	      </div>
	    </div>
	  </div>
	</div>
</c:if>



<div id="modalSucesso" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
		<h5 id="modalSucesso-titulo" class="m-auto text-success modal-title"></h5>
      </div>
      <div class="modal-body">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="py-3 text-center" id="modalSucesso-mensagem">
					</div>
				</div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<button id="modalSucesso-ok" data-dismiss="modal" type="button" class="form-control btn">Fechar</button>
				</div>
			</div>
		</div>
      </div>
    </div>
  </div>
</div>

<div id="modalErro" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
		<h5 id="modalErro-titulo" class="m-auto text-danger modal-title"></h5>
      </div>
      <div class="modal-body">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="py-3 text-center" id="modalErro-mensagem">
					</div>
				</div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<button id="modalErro-ok" data-dismiss="modal" type="button" class="form-control btn btn-secondary">Fechar</button>
				</div>
			</div>
		</div>
      </div>
    </div>
  </div>
</div>

<div id="modalEdicaoCarrinho" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
		<h5 id="modalEdicaoCarrinho-titulo" class="m-auto modal-title"></h5>
      </div>
      <div class="modal-body">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="py-3">
						<div class="form-group">
							<label for="quantidade">Quantidade</label>
							<input class="form-control" type="number" class="form-control" id="modalEdicaoCarrinho-quantidade">
						</div>
					</div>
				</div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
		<div class="container">
			<div class="row">
				<div class="col-6">
					<button id="modalEdicaoCarrinho-salvar" type="button" class="form-control btn btn-warning">Salvar</button>
				</div>
				<div class="col-6">
					<button id="modalEdicaoCarrinho-ok" data-dismiss="modal" type="button" class="form-control btn btn-secondary">Fechar</button>
				</div>
			</div>
		</div>
      </div>
    </div>
  </div>
</div>