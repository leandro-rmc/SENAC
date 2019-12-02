//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package controle;

import java.io.IOException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.dao.AvaliacaoDAO;
import modelo.dao.PizzaDAO;
import modelo.dao.ProdutoDAO;
import modelo.dao.ProdutoVariedadeDAO;
import modelo.dao.UsuarioDAO;
import modelo.entidade.Avaliacao;
import modelo.entidade.ProdutoPizza;
import modelo.entidade.ProdutoVariedade;
import modelo.entidade.Usuario;

/**
 * Servlet implementation class ProdutoControle
 */
@WebServlet({"/ProdutoControle","/produtos.html","/produto.html","/avaliarproduto.html","/removeravaliacao.html"})
public class ProdutoControle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdutoControle() {
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
		if(url.equals("/produtos.html")){
			if(request.getParameter("tipo") != null){
				if(request.getParameter("tipo").equalsIgnoreCase("pizza")){
					buscarPizzas(request, response);
				}
				else{
					buscarVariedadesPorTipo(request, response);
				}
			}
			else{
				//Aqui poderia estar uma chamada de função que mostre todos os produtos na mesma página (pizza e variedades)
			}
		}
		if(url.equals("/produto.html")){
			if(request.getParameter("id") != null){
				getProdutoPorId(request, response);
			}
			else{
				response.sendRedirect("index.jsp");
			}
		}
		if(url.equals("/avaliarproduto.html")){
			if(request.getParameter("idProduto") != null){
				avaliarProduto(request, response);
			}
			else{
				response.sendRedirect("index.jsp");
			}
		}
		if(url.equals("/removeravaliacao.html")){
			if(request.getParameter("idAvaliacao") != null){
				deletarAvaliacao(request, response);
			}
			else{
				response.sendRedirect("index.jsp");
			}
		}
	}
	
	protected void deletarAvaliacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			AvaliacaoDAO avaliacaoDao = new AvaliacaoDAO();
			HttpSession session = request.getSession(false);
			if(session == null){
				response.sendRedirect("index.jsp");
				return;
			}
			int idAvaliacao = Integer.parseInt(request.getParameter("idAvaliacao"));
			if(session != null)
				if(session.getAttribute("usuarioId") != null){
					//Verificações simples para evitar que hackers deletem as avaliações de outras pessoas ao enviar outros parâmetros para a página
					int idUsuario = Integer.parseInt(session.getAttribute("usuarioId").toString());
					int idResponsavel = avaliacaoDao.getIdResponsavelAvaliacao(idAvaliacao);
					
					if(idUsuario == idResponsavel){
						avaliacaoDao.deletarAvaliacaoPorIdAvaliacao(idAvaliacao);
					}
					else{
						System.out.println("Tentativa de deletar comentários dos outros detectada!");
					}
				}
			
			response.sendRedirect(request.getHeader("referer"));
		}
		catch(Exception ex){
			System.out.println("Erro ao deletar a avaliação!"+ex.getMessage());
		}
	}
	
	protected void avaliarProduto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			AvaliacaoDAO avaliacaoDao = new AvaliacaoDAO();
			Avaliacao avaliacao = new Avaliacao();
			Usuario usuario = new Usuario();
			UsuarioDAO usuarioDao = new UsuarioDAO();
			HttpSession session = request.getSession(false);
			
			if(session == null){
				response.sendRedirect("index.jsp");
				return;
			}
			//Faz conversão de data e hora para o formato correto
			Date data = new Date(System.currentTimeMillis());
			Time horas = new Time(System.currentTimeMillis());
			java.sql.Date dataSql = new java.sql.Date(data.getTime());
			java.sql.Time timeSql = new java.sql.Time(horas.getTime());
			
			usuario = usuarioDao.getUsuarioPorId(Integer.parseInt(session.getAttribute("usuarioId").toString()));
			avaliacaoDao.deletarAvaliacaoPorIdUsuario(usuario.getId(),Integer.parseInt(request.getParameter("idProduto").toString()));
			
			avaliacao.setComentario(request.getParameter("comentario"));
			avaliacao.setNota(Integer.parseInt(request.getParameter("nota")));
			avaliacao.setData(dataSql);
			avaliacao.setHora(timeSql);
			avaliacao.setUsuario(usuario);
			avaliacao.setIdProduto(Integer.parseInt(request.getParameter("idProduto")));
			
			avaliacaoDao.criarAvaliacao(avaliacao);
			//Redireciona para a página do produto que foi avaliado usando um parâmetro GET
			//O #avaliacoes serve para mover o scroll até o elemento com esse id, que no caso é a section de avaliações
			response.sendRedirect("produto.html?id="+request.getParameter("idProduto")+"#avaliacoes");
		}
		catch(Exception ex){
			System.out.println("Erro ao avaliar o produto!"+ex.getMessage());
			response.sendRedirect("erro.jsp");
		}
	}
	
	protected void getProdutoPorId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			ProdutoDAO produtoDAO = new ProdutoDAO();
			String tipo = produtoDAO.getTipoPorId(Integer.parseInt(request.getParameter("id")));
			
			HttpSession session = request.getSession(false);
			AvaliacaoDAO avaliacaoDao = new AvaliacaoDAO();
			
			List<Avaliacao> avaliacoes = new ArrayList<Avaliacao>();
			avaliacoes = avaliacaoDao.getAvaliacoesPorIdProduto(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("avaliacoes", avaliacoes);
	    	
			if(tipo != null){
				if(tipo.equalsIgnoreCase("pizza")){
					PizzaDAO pizzaDao = new PizzaDAO();
					ProdutoPizza produto = new ProdutoPizza();
					produto = pizzaDao.getPizzaPorId(Integer.parseInt(request.getParameter("id")));
					
			    	if(session != null){
			    		if(session.getAttribute("usuarioId") != null){
			    			if(avaliacaoDao.isUsuarioCompradorDoProduto(Integer.parseInt(session.getAttribute("usuarioId").toString()), Integer.parseInt(request.getParameter("id")))){
			    				produto.setAvaliacao(avaliacaoDao.getAvaliacaoPorIdProdutoEIdUsuario(produto.getIdProduto(), Integer.parseInt(session.getAttribute("usuarioId").toString())));
			    				produto.setComprador(true);
			    			}
			    		}
			    	}
					
					request.setAttribute("produto", produto);
				}
				else{
					ProdutoVariedadeDAO produtoVariedadeDAO = new ProdutoVariedadeDAO();
					ProdutoVariedade produtoVariedade = new ProdutoVariedade();
					produtoVariedade = produtoVariedadeDAO.getProdutoPorId(Integer.parseInt(request.getParameter("id")));
					
			    	if(session != null){
			    		if(session.getAttribute("usuarioId") != null){
			    			if(avaliacaoDao.isUsuarioCompradorDoProduto(Integer.parseInt(session.getAttribute("usuarioId").toString()), Integer.parseInt(request.getParameter("id")))){
			    				produtoVariedade.setAvaliacao(avaliacaoDao.getAvaliacaoPorIdProdutoEIdUsuario(produtoVariedade.getIdProduto(), Integer.parseInt(session.getAttribute("usuarioId").toString())));
			    				produtoVariedade.setComprador(true);
			    			}
			    		}
			    	}
					
					request.setAttribute("produto", produtoVariedade);
				}
				request.getRequestDispatcher("produto.jsp").forward(request, response);
			}
			else{
				request.setAttribute("produto", null);
				request.getRequestDispatcher("produto.jsp").forward(request, response);
			}
		}
		catch(Exception ex){
			response.sendRedirect("erro.jsp");
		}
	}
	
	protected void buscarPizzas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			PizzaDAO pizzaDao = new PizzaDAO();
			AvaliacaoDAO avaliacaoDao = new AvaliacaoDAO();
			HttpSession session = request.getSession(false);
			List<ProdutoPizza> produtos = new ArrayList<ProdutoPizza>();
			produtos = pizzaDao.getPizzas();
			
			if(session != null)
			if(session.getAttribute("usuarioId") != null){
				int idUsuario = Integer.parseInt(session.getAttribute("usuarioId").toString());
				for(ProdutoPizza pp : produtos){
					if(avaliacaoDao.isUsuarioCompradorDoProduto(idUsuario, pp.getIdProduto())){
						pp.setAvaliacao(avaliacaoDao.getAvaliacaoPorIdProdutoEIdUsuario(pp.getIdProduto(), idUsuario));
						pp.setComprador(true);
					}
				}
			}
			
			request.setAttribute("produtos", produtos);
			request.getRequestDispatcher("produtos.jsp").forward(request, response);
		}
		catch(Exception ex){
			response.sendRedirect("erro.jsp");
		}
	}
	
	protected void buscarVariedadesPorTipo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			HttpSession session = request.getSession();
			ProdutoVariedadeDAO produtoVariedadeDAO = new ProdutoVariedadeDAO();
			ArrayList<ProdutoVariedade> produtos = produtoVariedadeDAO.getProdutosPorTipo(request.getParameter("tipo"));
			AvaliacaoDAO avaliacaoDao = new AvaliacaoDAO();
			
			if(session != null)
			if(session.getAttribute("usuarioId") != null){
				int idUsuario = Integer.parseInt(session.getAttribute("usuarioId").toString());
				for(ProdutoVariedade pv : produtos){
					if(avaliacaoDao.isUsuarioCompradorDoProduto(idUsuario, pv.getIdProduto())){
						pv.setAvaliacao(avaliacaoDao.getAvaliacaoPorIdProdutoEIdUsuario(pv.getIdProduto(), idUsuario));
						pv.setComprador(true);
					}
				}
			}
			
			request.setAttribute("produtos", produtos);
			request.getRequestDispatcher("produtos.jsp").forward(request, response);
		}
		catch(Exception ex){
			response.sendRedirect("erro.jsp");
		}
	}
}