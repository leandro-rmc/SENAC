//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package controle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.dao.PedidoDAO;
import modelo.dao.PizzaDAO;
import modelo.dao.ProdutoVariedadeDAO;
import modelo.entidade.Ingrediente;
import modelo.entidade.ItemPedido;
import modelo.entidade.ItemPedidoPizza;
import modelo.entidade.PizzaPrecosTamanhos;
import modelo.entidade.ProdutoPizza;
import modelo.entidade.ProdutoVariedade;
import modelo.entidade.Tamanho;
import modelo.entidade.TipoPagamento;

/**
 * Servlet implementation class CarrinhoControle
 */
@WebServlet({"/CarrinhoControle","/carrinho.html"})
public class CarrinhoControle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarrinhoControle() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request,response);
	}
	
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath().toLowerCase();
		HttpSession session = request.getSession(false);
		
		if(url.equals("/carrinho.html")){
			
			//Cria o LinkkedHashMap e passa para a Session caso a mesma n�o tenha
			if (session == null || session.getAttribute("carrinho") == null) {
				LinkedHashMap<Integer, ItemPedido> carrinho = new LinkedHashMap<Integer, ItemPedido>();
				request.getSession().setAttribute("carrinho", carrinho);
			}
			if(request.getParameter("acao") != null){
				if(request.getParameter("acao").equalsIgnoreCase("addCarrinho")){
					addProdutoCarrinho(request, response);
				}
				if(request.getParameter("acao").equalsIgnoreCase("removerProduto")){
					removerProdutoCarrinho(request, response);
				}
				if(request.getParameter("acao").equalsIgnoreCase("editarProduto")){
					editarProdutoCarrinho(request, response);
				}
				if(request.getParameter("acao").equalsIgnoreCase("limparCarrinho")){
					limparCarrinho(request, response);
				}
			}
			else{
				//Ao acessar a p�gina do carrinho, todos os tipos de pagamentos ser�o pegos do banco e passados para a p�gina
				PedidoDAO pedidoDao = new PedidoDAO();
				List<TipoPagamento> tipoPagamento = new ArrayList<TipoPagamento>();
				tipoPagamento = pedidoDao.getTiposDePagamento();
				request.setAttribute("tipoPagamento", tipoPagamento);
				request.getRequestDispatcher("carrinho.jsp").forward(request, response);
			}
		}
	}
	
	protected void limparCarrinho(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			HttpSession session = request.getSession(false);
			@SuppressWarnings("unchecked")
			LinkedHashMap<Integer, ItemPedido> carrinho = (LinkedHashMap<Integer, ItemPedido>) session.getAttribute("carrinho");
			carrinho.clear();
			response.sendRedirect(request.getHeader("referer"));
		}
		catch(Exception ex){
			response.sendRedirect("index.jsp");
		}
	}
	
	protected void editarProdutoCarrinho(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			HttpSession session = request.getSession(false);
			@SuppressWarnings("unchecked")
			LinkedHashMap<Integer, ItemPedido> carrinho = (LinkedHashMap<Integer, ItemPedido>) session.getAttribute("carrinho");
			if (carrinho != null) {
				Integer produto = Integer.parseInt(request.getParameter("id"));
				if(request.getParameter("tipo").equalsIgnoreCase("pizza")){
					Integer index = Integer.parseInt(request.getParameter("indexPizza"));
					//Faz compara��o entre dois c�digos de prote��o (hash) de cada produto para evitar que produtos sejam editados do carrinho de forma errada
					//Evita problemas que multiplas abas abertas do carrinho causariam
					if(Integer.parseInt(request.getParameter("codigoProtecao")) != carrinho.get(produto).getItemPedidoPizza().get(index).getCodigoProtecao()){
						System.out.println("N�o � o mesmo item, c�digo de prote��o o salvou!");
					}
					else{
						System.out.println("Ok para editar a pizza");
						//Index � a posi��o do produtoPizza na ArrayList que est� dentro do LinkedHashMap
						Integer idTamanho = carrinho.get(produto).getItemPedidoPizza().get(index).getTamanho().getId();
						Double valorAtual = 0.0;
						//Passa por todos os pre�os de uma determinada pizza e encontra o pre�o correto da pizza da lista
						for(PizzaPrecosTamanhos ppt : carrinho.get(produto).getItemPedidoPizza().get(index).getProdutoPizza().getPizzaPrecosTamanhos()){
							System.out.println(ppt.getTamanho().getId());
							if(idTamanho == ppt.getTamanho().getId()){
								valorAtual = ppt.getPreco();
							}
						}
						//Apenas evita que a quantidade selecionada na edi��o seja menor que 1. Caso seja, ir� se tornar 1.
						//O JavaScript j� impede isso, mas valida��o server-side sempre � importante
						//A valida��o aqui deveria ser mais complexa, essa s� n�o � o suficiente, mas � apenas para exemplo
						int quantidade = Integer.parseInt(request.getParameter("quantidade"));
						if(quantidade < 1){
							quantidade = 1;
						}
						//Seta a nova quantidade da pizza que est� dentro da ArrayList que est� dentro do LinkedHashMap
						carrinho.get(produto).getItemPedidoPizza().get(index).setQuantidade(quantidade);
						Integer quantidadeAtual = carrinho.get(produto).getItemPedidoPizza().get(index).getQuantidade();
						carrinho.get(produto).getItemPedidoPizza().get(index).setPreco(valorAtual * quantidadeAtual);
						session.setAttribute("carrinho", carrinho);
					}
				}
				else{
					//Seta a quantidade do produto variedade que est� dentro do LinkedHashMap
					carrinho.get(produto).setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
					carrinho.get(produto).setValor(Double.parseDouble(request.getParameter("quantidade")) * carrinho.get(produto).getProdutoVariedade().getPreco());
					session.setAttribute("carrinho", carrinho);
				}
			}
			response.sendRedirect(request.getHeader("referer"));
		}
		catch(Exception ex){
			System.out.println(ex);
			response.sendRedirect("erro.jsp");
		}
	}
	
	protected void removerProdutoCarrinho(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			HttpSession session = request.getSession(false);
			//Remove o atributo que informa que o produto foi deletado do carrinho, sem isso a mensagem apareceria sempre
			session.removeAttribute("carrinhoRemoverSucesso");
			@SuppressWarnings("unchecked")
			LinkedHashMap<Integer, ItemPedido> carrinho = (LinkedHashMap<Integer, ItemPedido>) session.getAttribute("carrinho");
			if (carrinho != null) {
				Integer produto = Integer.parseInt(request.getParameter("id"));
				if(request.getParameter("tipo") != null){
					if(request.getParameter("tipo").equalsIgnoreCase("pizza")){
						int index = Integer.parseInt(request.getParameter("indexPizza"));
						//Se a �ltima pizza for removida da ArrayList, o carrinho limpar� tamb�m do LinkedHashMap o Produto correspondente
						//Dentro do produto � que fica a lista de pizzas no carrinho
						//Com uma lista vazia l� dentro, daria problema do produto ainda existir no LinkedHashMap, pois o mesmo possui atributos que ser�o acessados
						if(carrinho.get(produto).getItemPedidoPizza().size() == 1){
							carrinho.remove(produto);
						}
						else{
							//Faz compara��o entre dois c�digos de prote��o (hash) de cada produto para evitar que produtos sejam deletados do carrinho de forma errada
							//Evita problemas que multiplas abas abertas do carrinho causariam
							if(Integer.parseInt(request.getParameter("codigoProtecao")) == carrinho.get(produto).getItemPedidoPizza().get(index).getCodigoProtecao()){
								System.out.println("Ok para deletar!");
								carrinho.get(produto).getItemPedidoPizza().remove(index);
							}
							else{
								System.out.println("Produto n�o deletado! C�digo de prote��o o salvou");
							}
						}
					}
				}
				else{
					carrinho.remove(produto);
				}
				session.setAttribute("carrinho", carrinho);
				//Cria um atributo na Session informando que o produto foi deletado com sucesso do carrinho
				session.setAttribute("carrinhoRemoverSucesso",true);
			}
			response.sendRedirect(request.getHeader("referer"));
		}
		catch(Exception ex){
			response.sendRedirect(request.getHeader("referer"));
		}
	}
	
	protected void addProdutoCarrinho(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			HttpSession session = request.getSession(false);
			//Remove todos os atributos que informam se deu erro ou se deu certo, pois eles s�o acessados apenas...
			//...uma �nica vez ap�s uma a��o bem sucedida e ao ser redirecionado para uma p�gina espec�fica
			session.removeAttribute("carrinhoAddSucesso");
			session.removeAttribute("sucessoProdutoMesclado");
			session.removeAttribute("sucessoQuantidadeProduto");
			session.removeAttribute("sucessoTipoProduto");
			session.removeAttribute("sucessoIdProduto");
			session.removeAttribute("sucessoNomeProduto");
			
			session.removeAttribute("carrinhoAddErro");
			
			//Faz uma pequena valida��o server side para ver se a quantidade selecionada � aceit�vel
			if(Integer.parseInt(request.getParameter("quantidade-selecionada")) > 0 && Integer.parseInt(request.getParameter("quantidade-selecionada")) <= 99999){
				if(request.getParameter("tipo").equalsIgnoreCase("pizza")){
	
					PizzaDAO pizzaDao2 = new PizzaDAO();
					ItemPedidoPizza itemPedidoPizza = new ItemPedidoPizza();
					ProdutoPizza produtoPizza = new ProdutoPizza();
					Tamanho tamanho = new Tamanho();
					List<Ingrediente> ingredientesRemovidos = new ArrayList<Ingrediente>();
					
					if(request.getParameterValues("pizza_ingrediente") == null){
						for(String s : request.getParameterValues("pizza_todos_ingredientes")){
							ingredientesRemovidos.add(pizzaDao2.getIngredientePorId(Integer.parseInt(s)));
						}
					}
					else{
						boolean naoRemovido = false;
						for(String s : request.getParameterValues("pizza_todos_ingredientes")){
							for(String s2 : request.getParameterValues("pizza_ingrediente")){
								if(s.equals(s2)){
									naoRemovido = true;
								}
							}
							if(naoRemovido == false){
								ingredientesRemovidos.add(pizzaDao2.getIngredientePorId(Integer.parseInt(s)));
							}
							naoRemovido = false;
						}
					}
					
					produtoPizza = pizzaDao2.getPizzaPorId(Integer.parseInt(request.getParameter("id")));
					int quantidade = Integer.parseInt(request.getParameter("quantidade-selecionada"));
					tamanho = pizzaDao2.getTamanhoPorId(Integer.parseInt(request.getParameter("pizza_tamanho")));
					
					itemPedidoPizza.setIngredientesRemovidos(ingredientesRemovidos);
					itemPedidoPizza.setProdutoPizza(produtoPizza);
					itemPedidoPizza.setQuantidade(quantidade);
					itemPedidoPizza.setTamanho(tamanho);
					itemPedidoPizza.setPreco(pizzaDao2.getPrecoDoTamanhoDePizza(produtoPizza.getIdProduto(), tamanho.getId()) * quantidade);
					
					@SuppressWarnings("unchecked")
					LinkedHashMap<Integer, ItemPedido> carrinho = (LinkedHashMap<Integer, ItemPedido>) session.getAttribute("carrinho");
					ItemPedido itemPedido = carrinho.get(Integer.parseInt(request.getParameter("id")));
					
					//int pos = -1;
					if(itemPedido == null) {
						//Quando n�o existe uma pizza do mesmo sabor no seu carrinho
						itemPedido = new ItemPedido();
						itemPedido.setTipo("pizza");
						List<ItemPedidoPizza> itemPedidoPizzas = new ArrayList<ItemPedidoPizza>();
						itemPedidoPizza.setCodigoProtecao(itemPedidoPizza.hashCode());
						itemPedidoPizzas.add(itemPedidoPizza);
						itemPedido.setItemPedidoPizza(itemPedidoPizzas);
						carrinho.put(Integer.parseInt(request.getParameter("id")), itemPedido);
						
						session.setAttribute("carrinho", carrinho);
						session.setAttribute("sucessoNomeProduto",itemPedidoPizza.getProdutoPizza().getTitulo());
					}
					else{
						int pos = itemPedido.getItemPedidoPizza().indexOf(itemPedidoPizza);
						if(pos == -1){
							//Quando existe no seu carrinho uma pizza do mesmo sabor, mas n�o com as mesmas caracteristicas
							List<ItemPedidoPizza> itemPedidoPizzas = new ArrayList<ItemPedidoPizza>();
							itemPedidoPizzas = itemPedido.getItemPedidoPizza();
							itemPedidoPizza.setCodigoProtecao(itemPedidoPizza.hashCode());
							itemPedidoPizzas.add(itemPedidoPizza);
							itemPedido.setItemPedidoPizza(itemPedidoPizzas);
							carrinho.remove(Integer.parseInt(request.getParameter("id")));
							carrinho.put(Integer.parseInt(request.getParameter("id")), itemPedido);
							session.setAttribute("carrinho", carrinho);
							session.setAttribute("sucessoNomeProduto",itemPedidoPizza.getProdutoPizza().getTitulo());
						}
						else{
							//Quando existe uma pizza id�ntica no seu carrinho
							int quantidadeAtual = itemPedido.getItemPedidoPizza().get(pos).getQuantidade();
							itemPedido.getItemPedidoPizza().get(pos).setQuantidade(quantidadeAtual + Integer.parseInt(request.getParameter("quantidade-selecionada")));
							carrinho.put(Integer.parseInt(request.getParameter("id")), itemPedido);
							session.setAttribute("carrinho", carrinho);
							session.setAttribute("sucessoProdutoMesclado",true);
							session.setAttribute("sucessoNomeProduto",itemPedido.getItemPedidoPizza().get(pos).getProdutoPizza().getTitulo());
						}
						
					}
					session.setAttribute("carrinhoAddSucesso",true);
					session.setAttribute("sucessoQuantidadeProduto",request.getParameter("quantidade-selecionada"));
					session.setAttribute("sucessoTipoProduto",itemPedido.getTipo());
					session.setAttribute("sucessoIdProduto",request.getParameter("id"));
					
					response.sendRedirect(request.getHeader("referer"));
				}
				else{
					ProdutoVariedadeDAO pvd = new ProdutoVariedadeDAO();
					ProdutoVariedade pv = new ProdutoVariedade();
					pv = pvd.getProdutoPorId(Integer.parseInt(request.getParameter("id")));
					@SuppressWarnings("unchecked")
					LinkedHashMap<Integer, ItemPedido> carrinho = (LinkedHashMap<Integer, ItemPedido>) session.getAttribute("carrinho");
					int idProduto = Integer.parseInt(request.getParameter("id"));
					ItemPedido itemPedido = carrinho.get(idProduto);
					if(itemPedido == null) {
						//Quando um novo produto � adicionado ao carrinho
						itemPedido = new ItemPedido();
						itemPedido.setProdutoVariedade(pv);
						itemPedido.setTipo("variedade");
						itemPedido.setQuantidade(Integer.parseInt(request.getParameter("quantidade-selecionada")));
						itemPedido.setValor(pv.getPreco() * itemPedido.getQuantidade());
					}
					else{
						//Quando um produto � misturado com outro j� existente no carrinho
						itemPedido.setQuantidade(itemPedido.getQuantidade() + Integer.parseInt(request.getParameter("quantidade-selecionada")));
						itemPedido.setValor(itemPedido.getProdutoVariedade().getPreco() * itemPedido.getQuantidade());
						itemPedido.setTipo("variedade");
						session.setAttribute("sucessoProdutoMesclado",true);
					}
					carrinho.put(idProduto, itemPedido);
					session.setAttribute("carrinho", carrinho);
			    	session.setAttribute("carrinhoAddSucesso",true);
					session.setAttribute("sucessoQuantidadeProduto",request.getParameter("quantidade-selecionada"));
					session.setAttribute("sucessoTipoProduto",itemPedido.getTipo());
					session.setAttribute("sucessoIdProduto",request.getParameter("id"));
					session.setAttribute("sucessoNomeProduto",itemPedido.getProdutoVariedade().getTitulo());
			    	
			    	response.sendRedirect(request.getHeader("referer"));
				}
			}
			else{
				session.setAttribute("carrinhoAddErro",true);
				response.sendRedirect(request.getHeader("referer"));
			}
		}
		catch(Exception ex){
			System.out.println("Erro ao adicionar produto ao carrinho"+ex.getMessage());
		}
	}
}