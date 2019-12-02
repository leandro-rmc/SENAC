//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package controle;

import java.io.IOException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
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
import modelo.entidade.ItemPedidoFinalizado;
import modelo.entidade.ItemPedidoPizza;
import modelo.entidade.PedidoFinalizado;
import modelo.entidade.PedidoPizzaFinalizado;
import modelo.entidade.PPizzaIngredientesFinalizado;
import modelo.entidade.ProdutoVariedade;
import modelo.entidade.Tamanho;
import modelo.entidade.TipoPagamento;

/**
 * Servlet implementation class PedidoFinalizadoDao
 */
@WebServlet({"/PedidoFinalizadoControle","/pedido.html","/pedidos.html"})
public class PedidoFinalizadoControle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PedidoFinalizadoControle() {
        super();
        // TODO Auto-generated constructor stub
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
		if(url.equals("/pedidos.html")){
			exibirPedidos(request, response);
		}
		if(url.equals("/pedido.html")){
			if(request.getParameter("acao") != null){ 
				if(request.getParameter("acao").equals("novoPedido")){
					novoPedido(request,response);
				}
			}
			else{
				if(request.getParameter("id") != null){
					exibirPedido(request, response);
				}
			}
		}
	}
	
	protected void exibirPedido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			PedidoDAO pedidoDao = new PedidoDAO();
			PedidoFinalizado pedidoFinalizado = new PedidoFinalizado();
			HttpSession session = request.getSession(false);
	    	if(session == null){
	    		response.sendRedirect("logar.jsp");
	    		return;
	    	}
	    	pedidoFinalizado = pedidoDao.getPedidoFPorId(Integer.parseInt(request.getParameter("id")));
	    	
	    	//Verifica se o pedido pertece a quem está acessando
	    	if(pedidoFinalizado.getId_usuario() != Integer.parseInt(session.getAttribute("usuarioId").toString())){
	    		response.sendRedirect("pedidos.jsp");
	    		return;
	    	}
	    	
	    	
	    	pedidoFinalizado.setQuantidadeTotal(pedidoDao.getQuantidadeTotalItensPedidoPorId(Integer.parseInt(request.getParameter("id"))));
	    	pedidoFinalizado.setValorTotal(pedidoDao.getPrecoTotalPedidoPorId(Integer.parseInt(request.getParameter("id"))));
	    	request.setAttribute("pedidoFinalizado", pedidoFinalizado);
	    	request.setAttribute("indexPedido", pedidoDao.getIndexPedidoFPorId(pedidoFinalizado.getId()));
	    	
	    	ItemPedido itemPedido = null;
	    	ItemPedido itemPedido2 = null;
	    	List<ItemPedido> itensPedido = new ArrayList<ItemPedido>();
	    	
	    	//PedidosFinalizados pedidosFinalizados = new PedidosFinalizados();
	    	//pedidosFinalizados.setItensPedidoFinalizado(pedidoDao.getItensPedidoFinalizadoPorIdPedido(Integer.parseInt(request.getParameter("id"))));
	    	
	    	List<ItemPedidoFinalizado> itensPedidosF = new ArrayList<ItemPedidoFinalizado>();
	    	itensPedidosF = pedidoDao.getItensPedidoFPorIdPedido(Integer.parseInt(request.getParameter("id")));
	    	ItemPedidoPizza itemPedidoPizza;
	    	
	    	for(ItemPedidoFinalizado ipf : itensPedidosF){
	    		if(ipf.getTipo().equals("variedade")){
	    			itemPedido = new ItemPedido();
	    			itemPedido.setValor(ipf.getValor());
	    			itemPedido.setQuantidade(ipf.getQuantidade());
	    			itemPedido.setTipo("variedade");
	    			
	    			ProdutoVariedade produtoVariedade = new ProdutoVariedade();
	    			ProdutoVariedadeDAO produtoVariedadeDao = new ProdutoVariedadeDAO();
	    			produtoVariedade = produtoVariedadeDao.getProdutoPorId(ipf.getId_produto());
	    			itemPedido.setProdutoVariedade(produtoVariedade);
	    			itensPedido.add(itemPedido);
	    		}
	    		else{
	    			itemPedido2 = new ItemPedido();
	    			itemPedidoPizza = new ItemPedidoPizza();
	    			itemPedido2.setTipo("pizza");
	    			
	    			itemPedidoPizza.setPreco(ipf.getValor());
	    			itemPedidoPizza.setQuantidade(ipf.getQuantidade());
	    			
	    			PedidoPizzaFinalizado pedidoPizzaFinalizado = new PedidoPizzaFinalizado();
	    			pedidoPizzaFinalizado = pedidoDao.getPedidoPizzaFPorIdItemPedidoF(ipf.getId());
	    			
	    			itemPedidoPizza.setTamanho(pedidoPizzaFinalizado.getTamanho());
	    			itemPedidoPizza.setIngredientesRemovidos(pedidoPizzaFinalizado.getIngredientesRemovidos());
	    			PizzaDAO pizzaDao = new PizzaDAO();
	    			itemPedidoPizza.setProdutoPizza(pizzaDao.getPizzaPorId(ipf.getId_produto()));
	    			
	    			itemPedido2.setItemPedidoPizzaSingle(itemPedidoPizza);
	    			itensPedido.add(itemPedido2);
	    		}
	    		
	    	}
	    	
	    	request.setAttribute("itensPedido", itensPedido);
	    	request.getRequestDispatcher("pedido.jsp").forward(request, response);
		}
		catch(Exception ex){
			response.sendRedirect("logar.jsp");
		}
	}
	
	protected void exibirPedidos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			PedidoDAO pedidoDao = new PedidoDAO();
			List<PedidoFinalizado> pedidoFinalizado = new ArrayList<PedidoFinalizado>();
			HttpSession session = request.getSession(false);	
	    	if(session == null){
	    		response.sendRedirect("logar.jsp");
	    		return;
	    	}
			pedidoFinalizado = pedidoDao.getListPedidoFinalizadoPorIdUsuario(Integer.parseInt(session.getAttribute("usuarioId").toString()));
			
			for(PedidoFinalizado pf : pedidoFinalizado){
				pf.setQuantidadeTotal(pedidoDao.getQuantidadeTotalItensPedidoPorId(pf.getId()));
				pf.setValorTotal(pedidoDao.getPrecoTotalPedidoPorId(pf.getId()));
			}
			
			request.setAttribute("pedidoFinalizado", pedidoFinalizado);
			request.getRequestDispatcher("pedidos.jsp").forward(request, response);
		}
		catch(Exception ex){
			System.out.println("Erro ao exibir os pedidos: "+ex.getMessage());
			response.sendRedirect("logar.jsp");
		}
	}
	
	protected void novoPedido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			HttpSession session = request.getSession(false);
	    	if(session == null){
	    		response.sendRedirect("logar.jsp");
	    		return;
	    	}
	    	session.removeAttribute("pedidoAddSucesso");
	    	session.removeAttribute("sucessoPedidoId");
			@SuppressWarnings("unchecked")
			LinkedHashMap<Integer, ItemPedido> carrinho = (LinkedHashMap<Integer, ItemPedido>) session.getAttribute("carrinho");
			PedidoDAO pedidoDao = new PedidoDAO();
			PedidoFinalizado pedidoFinalizado = new PedidoFinalizado();
			int idTipoPagamento = Integer.parseInt(request.getParameter("tipoPagamento"));
			TipoPagamento tipoPagamento = new TipoPagamento();
			tipoPagamento.setId(idTipoPagamento);
			
			//Faz conversão de data para o formato correto
			Date data = new Date(System.currentTimeMillis());
			Time horas = new Time(System.currentTimeMillis());
			java.sql.Date dataSql = new java.sql.Date(data.getTime());
			java.sql.Time timeSql = new java.sql.Time(horas.getTime());
			
			pedidoFinalizado.setTipoPagamento(tipoPagamento);
			pedidoFinalizado.setData(dataSql);
			pedidoFinalizado.setHora(timeSql);
			pedidoFinalizado.setId_usuario(Integer.parseInt(session.getAttribute("usuarioId").toString()));
			pedidoFinalizado.setId(pedidoDao.criarPedido(pedidoFinalizado));
			ItemPedidoFinalizado itemPedidoFinalizado = new ItemPedidoFinalizado();
			itemPedidoFinalizado.setId_pedido(pedidoFinalizado.getId());
			for(Integer key : carrinho.keySet()){
				String tipo = carrinho.get(key).getTipo();
				
				itemPedidoFinalizado.setId_produto(key);
				
				if(tipo.equalsIgnoreCase("variedade")){
					itemPedidoFinalizado.setQuantidade(carrinho.get(key).getQuantidade());
					itemPedidoFinalizado.setTipo(carrinho.get(key).getTipo());
					itemPedidoFinalizado.setValor(carrinho.get(key).getValor());
					itemPedidoFinalizado.setId(pedidoDao.criarItemPedido(itemPedidoFinalizado));
				}
				if(tipo.equalsIgnoreCase("pizza")){
					//Como uma pizza possui muito mais características do que um produto variedade, o código é maior e diferente
					for(ItemPedidoPizza itemPedidoPizza : carrinho.get(key).getItemPedidoPizza()){
						
						itemPedidoFinalizado.setQuantidade(itemPedidoPizza.getQuantidade());
						itemPedidoFinalizado.setTipo(carrinho.get(key).getTipo());
						itemPedidoFinalizado.setValor(itemPedidoPizza.getPreco());
						itemPedidoFinalizado.setId(pedidoDao.criarItemPedido(itemPedidoFinalizado));
	
						PedidoPizzaFinalizado pedidoPizzaFinalizado = new PedidoPizzaFinalizado();
						Tamanho tamanho = new Tamanho();
						PizzaDAO pizzaDao = new PizzaDAO();
						
						tamanho = pizzaDao.getTamanhoPorId(itemPedidoPizza.getTamanho().getId());
						
						pedidoPizzaFinalizado.setItemPedidoFinalizado(itemPedidoFinalizado);
						pedidoPizzaFinalizado.setTamanho(tamanho);
						
						pedidoDao.criarPedidoPizza(pedidoPizzaFinalizado);
						
						PPizzaIngredientesFinalizado pPizzaIngredientesFinalizado = new PPizzaIngredientesFinalizado();
						
						for(Ingrediente ingrediente : itemPedidoPizza.getIngredientesRemovidos()){
							pPizzaIngredientesFinalizado.setId_ingrediente(ingrediente.getId());
							pPizzaIngredientesFinalizado.setItemPedidoFinalizado(itemPedidoFinalizado);
							pPizzaIngredientesFinalizado.setRemovido(true); 
							//Originalmente eu iria colocar os ingredientes que não foram removidos
							//Talvez eu queira futuramente, portanto vou deixar aqui
							pedidoDao.criarPedidoPizzaIngrediente(pPizzaIngredientesFinalizado);
						}
						
					}
				}
			}
			carrinho.clear();
			session.setAttribute("pedidoAddSucesso",true);
			session.setAttribute("sucessoPedidoId",pedidoFinalizado.getId());
			response.sendRedirect(request.getHeader("referer"));
		}
		catch(Exception ex){
			response.sendRedirect("erro.jsp");
			System.out.println("Erro ao criar novo pedido: "+ex.getMessage());
		}
	}
}