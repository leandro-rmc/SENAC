//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package controle;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.dao.FuncionarioDAO;
import modelo.dao.UsuarioDAO;
import modelo.entidade.Endereco;
import modelo.entidade.Funcionario;
import modelo.entidade.Usuario;

/**
 * Servlet implementation class UsuarioControle
 */
@WebServlet({"/UsuarioControle","/logar.html","/deslogar","/cadastrar.html","/perfil.html"})
public class UsuarioControle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsuarioControle() {
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
		if(url.equals("/logar.html")){
			if(request.getParameter("acao") != null && request.getParameter("acao").equals("logar")){
				logar(request,response);
			}
			else{
				request.getRequestDispatcher("logar.jsp").forward(request, response);
			}
		}
		if(url.equals("/deslogar")){
			deslogar(request,response);
		}
		if(url.equals("/cadastrar.html")){
			if(request.getParameter("acao") != null && request.getParameter("acao").equals("cadastrar")){
				cadastrar(request,response);
			}
			else{
				request.getRequestDispatcher("cadastrar.jsp").forward(request, response);
			}
		}
		if(url.equals("/perfil.html")){
			if(request.getParameter("acao") != null && request.getParameter("acao").equals("salvarEdicao")){
				editarPerfil(request,response);
			}
			else{
				mostrarPerfil(request,response);
			}
		}
	}
	
	protected void editarPerfil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try{
			ArrayList<String> campos = new ArrayList<>();
	    	HttpSession session = request.getSession(false);
	    	if(session == null){
	    		response.sendRedirect("logar.jsp");
	    		return;
	    	}

	    	campos.add("nome");
	    	campos.add("email");
	    	campos.add("bairro");
	    	campos.add("telefone");
	    	campos.add("celular");
	    	campos.add("cep");
	    	campos.add("cidade");
	    	campos.add("complemento");
	    	campos.add("logradouro");
	    	campos.add("numero");
	    	
	    	campos.add("diaNascimento");
	    	campos.add("mesNascimento");
	    	campos.add("anoNascimento");
	    	
	    	
	    	for(String campo : campos){
	    		request.setAttribute(campo, request.getParameter(campo));
	    	}
	    	
	    	request.removeAttribute("sucesso");
	    	request.removeAttribute("erro");
			
	    	Usuario usuario = new Usuario();
	    	Endereco endereco = new Endereco();
	    	UsuarioDAO usuarioDAO = new UsuarioDAO();
	    		
	    		//Validações server side são muito importantes e se pode deixar de fazer
	    		//As validações abaixo são bem simples e não são o suficiente, mas servem como exemplo
	    		if(request.getParameter("nome") == "" || request.getParameter("nome").length() < 5){
		    		request.setAttribute("erroNome", "Mínimo de 5 caracteres!");
		    		request.setAttribute("isInvalidNome", "is-invalid");
		    		request.setAttribute("erro", true);
	    		}
	    		
	    		if(request.getParameter("email") == ""){
		    		request.setAttribute("erroEmail", "Campo obrigatório!");
		    		request.setAttribute("isInvalidEmail", "is-invalid");
		    		request.setAttribute("erro", true);
	    		}
	    		
	    		if(request.getParameter("numero") == ""){
		    		request.setAttribute("erroNumero", "Campo obrigatório!");
		    		request.setAttribute("isInvalidNumero", "is-invalid");
		    		request.setAttribute("erro", true);
	    		}
	    		
	    		if(request.getParameter("logradouro") == ""){
		    		request.setAttribute("erroLogradouro", "Campo obrigatório!");
		    		request.setAttribute("isInvalidLogradouro", "is-invalid");
		    		request.setAttribute("erro", true);
	    		}
	    		
	    		if(request.getAttribute("erro") != null){
	    			request.getRequestDispatcher("perfil.jsp?acao=editar").forward(request, response);
	    		}
	    		else{
			    	usuario.setNome(request.getParameter("nome"));
			    	
			    	if(request.getParameter("diaNascimento") != "" && request.getParameter("mesNascimento") != "" && request.getParameter("anoNascimento") != ""){
				    	SimpleDateFormat formato = new SimpleDateFormat("yyyyMMdd");
				    	java.util.Date dataUtil = new java.util.Date();
				    	
				    	//Preenche com 0 datas inválidas
				    	String anoNascimento = "0000".substring(request.getParameter("anoNascimento").length()) + request.getParameter("anoNascimento");
				    	String mesNascimento = "00".substring(request.getParameter("mesNascimento").length()) + request.getParameter("mesNascimento");
				    	String diaNascimento = "00".substring(request.getParameter("diaNascimento").length()) + request.getParameter("diaNascimento");
				    	
				    	dataUtil = formato.parse(anoNascimento+mesNascimento+diaNascimento);
				    	
				    	java.sql.Date dataSql = new java.sql.Date(dataUtil.getTime());
				    	usuario.setDataNascimento(dataSql);
			    	}
			    	
			    	usuario.setId(Integer.parseInt(session.getAttribute("usuarioId").toString()));
			    	usuario.setEmail(request.getParameter("email"));
			    	usuario.setTelefone(request.getParameter("telefone"));
			    	usuario.setCelular(request.getParameter("celular"));
			    	
			    	
			    	
			    	endereco.setBairro(request.getParameter("bairro"));
			    	endereco.setCep(request.getParameter("cep"));
			    	endereco.setCidade(request.getParameter("cidade"));
			    	endereco.setComplemento(request.getParameter("complemento"));
			    	endereco.setLogradouro(request.getParameter("logradouro"));
			    	endereco.setNumero(Integer.parseInt(request.getParameter("numero")));
			    	usuario.setEndereco(endereco);
					
			    	
			    	
			    	if(usuarioDAO.editarUsuario(usuario) == false){
			    		response.sendRedirect("index.jsp");
			    	}
			    	else{
		    			session.setAttribute("usuarioNome",usuario.getNome());
		    			session.setAttribute("usuarioEmail",usuario.getEmail());
		    			session.setAttribute("usuarioId",usuario.getId());
				    	request.setAttribute("sucesso",true);
				    	request.setAttribute("dataNascimento", usuario.getDataNascimento());
				    	
				    	request.getRequestDispatcher("perfil.jsp").forward(request, response);
			    	}
		    	}
		}
		catch(Exception ex){
			response.sendRedirect("erro.jsp");
		}
	}
	
	protected void mostrarPerfil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			HttpSession session = request.getSession(false);
	    	if(session == null){
	    		response.sendRedirect("logar.jsp");
	    		return;
	    	}
			
	    	Usuario usuario = new Usuario();
	    	UsuarioDAO usuarioDAO = new UsuarioDAO();
	    	usuario = usuarioDAO.getUsuarioPorEmail(session.getAttribute("usuarioEmail").toString());
	    	request.setAttribute("nome", usuario.getNome());
	    	
	    	Date data = usuario.getDataNascimento();
	    	if (data != null){
	    		String dataTexto = data.toString();
	    		String datas[] = dataTexto.split("-");
	    		
		    	request.setAttribute("dataNascimento", usuario.getDataNascimento());
		    	
		    	request.setAttribute("diaNascimento", datas[2]);
		    	request.setAttribute("mesNascimento", datas[1]);
		    	request.setAttribute("anoNascimento", datas[0]);
	    	}
	    	
	    	request.setAttribute("email", usuario.getEmail());
	    	request.setAttribute("bairro", usuario.getEndereco().getBairro());
	    	request.setAttribute("telefone", usuario.getTelefone());
	    	request.setAttribute("celular", usuario.getCelular());
	    	request.setAttribute("cep", usuario.getEndereco().getCep());
	    	request.setAttribute("cidade", usuario.getEndereco().getCidade());
	    	request.setAttribute("complemento", usuario.getEndereco().getComplemento());
	    	request.setAttribute("logradouro", usuario.getEndereco().getLogradouro());
	    	request.setAttribute("numero", usuario.getEndereco().getNumero());
	    	
	    	request.getRequestDispatcher("perfil.jsp").forward(request, response);
		}
		catch(Exception ex){
			System.out.println("Erro ao mostrar o perfil: "+ex.getMessage());
			response.sendRedirect("erro.jsp");
		}
	}
	
	protected void deslogar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session != null){
			session.invalidate();
			response.sendRedirect("index.jsp");
		}
	}
	
	protected void logar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
	    	ArrayList<String> campos = new ArrayList<>();
	    	campos.add("nome");
	    	campos.add("senha");
	    	
	    	for(String campo : campos){
	    		request.setAttribute(campo, request.getParameter(campo));
	    		String campoC = campo.substring(0,1).toUpperCase() + campo.substring(1);
	    		request.setAttribute("isInvalid"+campoC, "");
	    		request.setAttribute("erro"+campoC, "");
	    	}
			
			HttpSession session = request.getSession(false);
			UsuarioDAO usuarioDAO = new UsuarioDAO();
	    	Usuario usuario = new Usuario();
	    	usuario = usuarioDAO.getUsuarioPorEmail(request.getParameter("email"));
	    	session.removeAttribute("emailNovaConta");
	    	if(usuario == null){
	    		request.setAttribute("isInvalidEmail", "is-invalid");
	    		request.setAttribute("erroEmail", "Usuário inválido");
	    		request.setAttribute("email", request.getParameter("email"));
	    		request.getRequestDispatcher("logar.jsp").forward(request, response);
	    	}
	    	else{
	    		if(usuarioDAO.logar(request.getParameter("email"), request.getParameter("senha"))){
	    			session.setAttribute("logado",true);
	    			session.setAttribute("usuarioNome",usuario.getNome());
	    			session.setAttribute("usuarioEmail",usuario.getEmail());
	    			session.setAttribute("usuarioId",usuario.getId());
	    			
	        		Funcionario funcionario = new Funcionario();
	        		FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
	        		funcionario = funcionarioDAO.getFuncionario(usuario);
	        		if(funcionario == null){
	        			session.setAttribute("funcionario",false);
	        		}
	        		else{
	        			session.setAttribute("funcionario",true);
	        			session.setAttribute("funcionario_cargo",funcionario.getCargo());
	        		}
	        		response.sendRedirect("index.jsp");
	    		}
	    		else{
	        		request.setAttribute("isInvalidSenha", "is-invalid");
	        		request.setAttribute("erroSenha", "Senha inválida");
	    			request.setAttribute("email", request.getParameter("email"));
	    			request.getRequestDispatcher("logar.jsp").forward(request, response);
	    		}
	    	}	
		}
		catch(Exception ex){
			response.sendRedirect("erro.jsp");
		}
	}
	
	protected void cadastrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try{
			ArrayList<String> campos = new ArrayList<>();
	    	HttpSession session = request.getSession(false);

	    	campos.add("nome");
	    	campos.add("email");
	    	campos.add("senha");
	    	campos.add("confirmarSenha");
	    	campos.add("bairro");
	    	campos.add("telefone");
	    	campos.add("celular");
	    	campos.add("cep");
	    	campos.add("cidade");
	    	campos.add("complemento");
	    	campos.add("logradouro");
	    	campos.add("numero");
	    	
	    	campos.add("diaNascimento");
	    	campos.add("mesNascimento");
	    	campos.add("anoNascimento");
	    	
	    	
	    	for(String campo : campos){
	    		request.setAttribute(campo, request.getParameter(campo));
	    	}
	    	
	    	request.removeAttribute("sucesso");
	    	request.removeAttribute("erro");
			
	    	Usuario usuario = new Usuario();
	    	Endereco endereco = new Endereco();
	    	UsuarioDAO usuarioDAO = new UsuarioDAO();
	    	
	    	if(usuarioDAO.getUsuarioPorEmail(request.getParameter("email")) != null){
	    		
	    		request.setAttribute("email", request.getParameter("email"));
	    		request.setAttribute("isInvalidEmail", "is-invalid");
	    		request.setAttribute("erroEmail", "Email já existente!");
	    		request.setAttribute("erro", true);
	    		request.getRequestDispatcher("cadastrar.jsp").forward(request, response);
	    		
	    	}
	    	else{
	    		
	    		//Validações server side são muito importantes e se pode deixar de fazer
	    		//As validações abaixo são bem simples e não são o suficiente, mas servem como exemplo
	    		
	    		if(request.getParameter("nome") == "" || request.getParameter("nome").length() < 5){
		    		request.setAttribute("erroNome", "Mínimo de 5 caracteres!");
		    		request.setAttribute("isInvalidNome", "is-invalid");
		    		request.setAttribute("erro", true);
	    		}
	    		
	    		if(request.getParameter("email") == ""){
		    		request.setAttribute("erroEmail", "Campo obrigatório!");
		    		request.setAttribute("isInvalidEmail", "is-invalid");
		    		request.setAttribute("erro", true);
	    		}
	    		
	    		if(request.getParameter("numero") == ""){
		    		request.setAttribute("erroNumero", "Campo obrigatório!");
		    		request.setAttribute("isInvalidNumero", "is-invalid");
		    		request.setAttribute("erro", true);
	    		}
	    		
	    		if(request.getParameter("logradouro") == ""){
		    		request.setAttribute("erroLogradouro", "Campo obrigatório!");
		    		request.setAttribute("isInvalidLogradouro", "is-invalid");
		    		request.setAttribute("erro", true);
	    		}
	    		
	    		if((request.getParameter("senha") != "" && request.getParameter("confirmarSenha") != "")){
	    			if(!request.getParameter("senha").equals(request.getParameter("confirmarSenha"))){
		    			request.setAttribute("erroSenha", "Senhas não conferem!");
			    		request.setAttribute("isInvalidSenha", "is-invalid");
			    		request.setAttribute("erroConfirmarSenha", "Senhas não conferem!");
			    		request.setAttribute("isInvalidConfirmarSenha", "is-invalid");
			    		request.setAttribute("erro", true);
	    			}
	    		}
	    		
	    		if(request.getParameter("senha") == ""){
		    		request.setAttribute("erroSenha", "Campo obrigatório!");
		    		request.setAttribute("isInvalidSenha", "is-invalid");
		    		request.setAttribute("erro", true);
	    		}
	    		
	    		
	    		if(request.getParameter("confirmarSenha") == ""){
		    		request.setAttribute("erroConfirmarSenha", "Campo obrigatório!");
		    		request.setAttribute("isInvalidConfirmarSenha", "is-invalid");
		    		request.setAttribute("erro", true);
	    		}
	    		
	    		
	    		
	    		if(request.getAttribute("erro") != null){
	    			request.getRequestDispatcher("cadastrar.jsp").forward(request, response);
	    		}
	    		else{
			    	usuario.setNome(request.getParameter("nome"));
			    	
			    	if(request.getParameter("diaNascimento") != "" && request.getParameter("mesNascimento") != "" && request.getParameter("anoNascimento") != ""){
				    	SimpleDateFormat formato = new SimpleDateFormat("yyyyMMdd");
				    	java.util.Date dataUtil = new java.util.Date();
				    	
				    	String anoNascimento = "0000".substring(request.getParameter("anoNascimento").length()) + request.getParameter("anoNascimento");
				    	String mesNascimento = "00".substring(request.getParameter("mesNascimento").length()) + request.getParameter("mesNascimento");
				    	String diaNascimento = "00".substring(request.getParameter("diaNascimento").length()) + request.getParameter("diaNascimento");
				    	dataUtil = formato.parse(anoNascimento+mesNascimento+diaNascimento);
				    	
				    	java.sql.Date dataSql = new java.sql.Date(dataUtil.getTime());
				    	usuario.setDataNascimento(dataSql);
			    	}
			    	
			    	usuario.setEmail(request.getParameter("email"));
			    	
			    	//Senha está sendo salva em texto puro apenas para fins de testes
			    	//Normalmente eu usaria SHA-256
			    	usuario.setSenha(request.getParameter("senha"));
			    	usuario.setTelefone(request.getParameter("telefone"));
			    	usuario.setCelular(request.getParameter("celular"));
			    	
			    	endereco.setBairro(request.getParameter("bairro"));
			    	endereco.setCep(request.getParameter("cep"));
			    	endereco.setCidade(request.getParameter("cidade"));
			    	endereco.setComplemento(request.getParameter("complemento"));
			    	endereco.setLogradouro(request.getParameter("logradouro"));
			    	endereco.setNumero(Integer.parseInt(request.getParameter("numero")));
			    	usuario.setEndereco(endereco);
			    	
			    	if(usuarioDAO.cadastrarUsuario(usuario) == false){
			    		response.sendRedirect("erro.jsp");
			    	}
			    	else{
			    		session.setAttribute("endereco",endereco);
			    		session.setAttribute("emailNovaConta",usuario.getEmail());
				    	request.setAttribute("sucesso",true);
				    	request.getRequestDispatcher("cadastrar.jsp").forward(request, response);
			    	}
	    		}
	    	}
    	}
    	catch(Exception ex){
    		System.out.println("Erro ao cadastrar usuário! "+ex.getMessage());
    		response.sendRedirect("erro.jsp");
    	}
	}
}