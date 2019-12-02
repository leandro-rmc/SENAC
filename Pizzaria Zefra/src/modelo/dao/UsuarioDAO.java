//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package modelo.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import modelo.bd.Conexao;
import modelo.entidade.Endereco;
import modelo.entidade.Usuario;

public class UsuarioDAO {
	private Connection connection = null;
	private PreparedStatement pstmt = null;
	private ResultSet resultSet = null;
	
	public Usuario getUsuarioPorEmail(String email){
		Usuario usuario = null;
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM usuario WHERE email = ?");
			pstmt.setString(1, email);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				usuario = new Usuario();
				usuario.setId(resultSet.getInt("usuario.id"));
				usuario.setNome(resultSet.getString("usuario.nome"));
				usuario.setDataNascimento(resultSet.getDate("usuario.dataNascimento"));
				usuario.setEmail(resultSet.getString("usuario.email"));
				usuario.setSenha(resultSet.getString("usuario.senha"));
				usuario.setTelefone(resultSet.getString("usuario.telefone"));
				usuario.setCelular(resultSet.getString("usuario.celular"));
				
				pstmt = connection.prepareStatement("SELECT * FROM endereco WHERE id_usuario = ?");
				pstmt.setInt(1, usuario.getId());
				resultSet = pstmt.executeQuery();
				
				if(resultSet.next()){
					Endereco endereco = new Endereco();
					endereco.setId(resultSet.getInt("endereco.id"));
					endereco.setCep(resultSet.getString("endereco.cep"));
					endereco.setCidade(resultSet.getString("endereco.cidade"));
					endereco.setBairro(resultSet.getString("endereco.bairro"));
					endereco.setLogradouro(resultSet.getString("endereco.logradouro"));
					endereco.setNumero(resultSet.getInt("endereco.numero"));
					endereco.setComplemento(resultSet.getString("endereco.complemento"));
					
					usuario.setEndereco(endereco);
				}
				
				return usuario;
			}
			
		}
		catch(SQLException ex){
			System.out.println("Erro durante a busca de usuário por email: "+ex.getMessage());
		}
		finally{
			try{
				resultSet.close();
				pstmt.close();
				connection.close();
			}
			catch(SQLException ex){
				System.out.println("Erro ao fechar instâncias " + ex.getMessage());
			}
		}
		return null;
	}
	
	public Usuario getUsuarioPorId(int id){
		Usuario usuario = null;
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM usuario WHERE id = ?");
			pstmt.setInt(1, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				usuario = new Usuario();
				usuario.setId(resultSet.getInt("usuario.id"));
				usuario.setNome(resultSet.getString("usuario.nome"));
				usuario.setDataNascimento(resultSet.getDate("usuario.dataNascimento"));
				usuario.setEmail(resultSet.getString("usuario.email"));
				usuario.setSenha(resultSet.getString("usuario.senha"));
				usuario.setTelefone(resultSet.getString("usuario.telefone"));
				usuario.setCelular(resultSet.getString("usuario.celular"));
				
				pstmt = connection.prepareStatement("SELECT * FROM endereco WHERE id_usuario = ?");
				pstmt.setInt(1, usuario.getId());
				resultSet = pstmt.executeQuery();
				
				if(resultSet.next()){
					Endereco endereco = new Endereco();
					endereco.setId(resultSet.getInt("endereco.id"));
					endereco.setCep(resultSet.getString("endereco.cep"));
					endereco.setCidade(resultSet.getString("endereco.cidade"));
					endereco.setBairro(resultSet.getString("endereco.bairro"));
					endereco.setLogradouro(resultSet.getString("endereco.logradouro"));
					endereco.setNumero(resultSet.getInt("endereco.numero"));
					endereco.setComplemento(resultSet.getString("endereco.complemento"));
					
					usuario.setEndereco(endereco);
				}
				
				return usuario;
			}
			
		}
		catch(SQLException ex){
			System.out.println("Erro durante a busca de usuário por id: "+ex.getMessage());
		}
		finally{
			try{
				resultSet.close();
				pstmt.close();
				connection.close();
			}
			catch(SQLException ex){
				System.out.println("Erro ao fechar instâncias " + ex.getMessage());
			}
		}
		return null;
	}
	
	public boolean isFuncionario(int id_usuario){
		connection = Conexao.getConexao();
		try{
			pstmt = connection.prepareStatement("SELECT * FROM funcionario WHERE id_usuario = ?");
			pstmt.setInt(1, id_usuario);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				return true;
			}
		}
		catch(SQLException ex){
			System.out.println("Erro durante a verificação de funcionário: "+ex.getMessage());
		}
		finally{
			try{
				resultSet.close();
				pstmt.close();
				connection.close();
			}
			catch(SQLException ex){
				System.out.println("Erro ao fechar instâncias " + ex.getMessage());
			}
		}
		return false;
	}
	
	public Boolean logar(String email, String senha){
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM usuario WHERE email = ? AND senha = ?");
			pstmt.setString(1, email);
			pstmt.setString(2, senha);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				return true;
			}
		}
		catch(SQLException ex){
			System.out.println("Erro durante o login: "+ex.getMessage());
		}
		finally{
			try{
				resultSet.close();
				pstmt.close();
				connection.close();
			}
			catch(SQLException ex){
				System.out.println("Erro ao fechar instâncias " + ex.getMessage());
			}
		}
		return false;
	}
	
	public Boolean cadastrarUsuario(Usuario usuario){
		Boolean resultado = false;
		try{
			connection = Conexao.getConexao();
			connection.setAutoCommit(false);
			pstmt = connection.prepareStatement("INSERT INTO usuario (nome, dataNascimento, email, senha, telefone, celular) VALUES(?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, usuario.getNome());
			pstmt.setDate(2, (Date) usuario.getDataNascimento());
			pstmt.setString(3, usuario.getEmail());
			pstmt.setString(4, usuario.getSenha());
			pstmt.setString(5, usuario.getTelefone());
			pstmt.setString(6, usuario.getCelular());
			pstmt.execute();
			
			resultSet = pstmt.getGeneratedKeys();
			resultSet.first();
			
			pstmt = connection.prepareStatement("INSERT INTO endereco (id_usuario, cep, cidade, bairro, logradouro, numero, complemento) VALUES(?,?,?,?,?,?,?)");
			pstmt.setInt(1, resultSet.getInt(1));
			pstmt.setString(2, usuario.getEndereco().getCep());
			pstmt.setString(3, usuario.getEndereco().getCidade());
			pstmt.setString(4, usuario.getEndereco().getBairro());
			pstmt.setString(5, usuario.getEndereco().getLogradouro());
			pstmt.setInt(6, usuario.getEndereco().getNumero());
			pstmt.setString(7, usuario.getEndereco().getComplemento());
			pstmt.execute();
			
			connection.commit();
			resultado = true;
		}
		catch(SQLException ex){
			System.out.println("Erro ao cadastrar o usuário: " + ex.getMessage());
			try{
				connection.rollback();
				System.out.println("Rollback executado com sucesso!");
			}
			catch(SQLException ex2){
				System.out.println("Erro no Rollback: " + ex2.getMessage());
			}
		}
		finally{
			try{
				resultSet.close();
				pstmt.close();
				connection.close();
			}
			catch(SQLException ex){
				System.out.println("Erro ao fechar instâncias " + ex.getMessage());
			}
		}
		return resultado;
	}
	
	public Boolean editarUsuario(Usuario usuario){
		Boolean resultado = false;
		try{
			System.out.println(usuario.getId());
			connection = Conexao.getConexao();
			connection.setAutoCommit(false);
			pstmt = connection.prepareStatement("UPDATE usuario SET nome = ?, dataNascimento = ?, email = ?, telefone = ?, celular = ? WHERE id = ?");
			pstmt.setString(1, usuario.getNome());
			pstmt.setDate(2, (Date) usuario.getDataNascimento());
			pstmt.setString(3, usuario.getEmail());
			pstmt.setString(4, usuario.getTelefone());
			pstmt.setString(5, usuario.getCelular());
			pstmt.setInt(6, usuario.getId());
			//pstmt.setInt(6, 7);
			pstmt.executeUpdate();
			
			pstmt = connection.prepareStatement("UPDATE endereco SET cep = ?, cidade = ?, bairro = ?, logradouro = ?, numero = ?, complemento = ? WHERE id_usuario = ?");
			pstmt.setString(1, usuario.getEndereco().getCep());
			pstmt.setString(2, usuario.getEndereco().getCidade());
			pstmt.setString(3, usuario.getEndereco().getBairro());
			pstmt.setString(4, usuario.getEndereco().getLogradouro());
			pstmt.setInt(5, usuario.getEndereco().getNumero());
			pstmt.setString(6, usuario.getEndereco().getComplemento());
			pstmt.setInt(7, usuario.getId());
			//pstmt.setInt(7, 7);
			pstmt.executeUpdate();
			System.out.println("Chegou aqui no final");
			connection.commit();
			System.out.println("Chegou aqui no final 2");
			resultado = true;
		}
		catch(SQLException ex){
			System.out.println("Erro ao editar o usuário: " + ex.getMessage());
			try{
				connection.rollback();
				System.out.println("Rollback executado com sucesso!");
			}
			catch(SQLException ex2){
				System.out.println("Erro no Rollback: " + ex2.getMessage());
			}
		}
		finally{
			try{
				pstmt.close();
				connection.close();
			}
			catch(SQLException ex){
				System.out.println("Erro ao fechar instâncias " + ex.getMessage());
			}
		}
		System.out.println("Chegou aqui no final 3");
		return resultado;
	}
}