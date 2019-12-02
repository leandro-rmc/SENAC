package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.bd.Conexao;
import modelo.entidade.Avaliacao;
import modelo.entidade.Usuario;

public class AvaliacaoDAO {
	private Connection connection = null;
	private PreparedStatement pstmt = null;
	private ResultSet resultSet = null;
	
	public Boolean isUsuarioCompradorDoProduto(int id_usuario, int id_produto){
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT COUNT(*) FROM pedido JOIN item_pedido ON item_pedido.id_pedido = pedido.id WHERE id_usuario = ? AND id_produto = ?");
			pstmt.setInt(1, id_usuario);
			pstmt.setInt(2, id_produto);
			resultSet = pstmt.executeQuery();
			resultSet.first();
			return (resultSet.getInt(1) > 0);
		}
		catch(Exception ex){
			System.out.println("Erro durante a verificação de comprador: "+ex.getMessage());
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
	
	public void deletarAvaliacaoPorIdUsuario(int id_usuario, int id_produto){
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("DELETE FROM avaliacao WHERE id_usuario = ? AND id_produto = ?");
			pstmt.setInt(1, id_usuario);
			pstmt.setInt(2, id_produto);
			pstmt.execute();
		}
		catch(Exception ex){
			System.out.println("Erro durante a exclusão das avaliações: "+ex.getMessage());
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
	}
	
	public void deletarAvaliacaoPorIdAvaliacao(int id){
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("DELETE FROM avaliacao WHERE id = ?");
			pstmt.setInt(1, id);
			pstmt.execute();
		}
		catch(Exception ex){
			System.out.println("Erro durante a exclusão da avaliação: "+ex.getMessage());
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
	}
	
	public int getIdResponsavelAvaliacao(int idAvaliacao){
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT id_usuario FROM avaliacao WHERE id = ?");
			pstmt.setInt(1, idAvaliacao);
			resultSet = pstmt.executeQuery();
			resultSet.first();
			return resultSet.getInt(1);
		}
		catch(Exception ex){
			System.out.println("Erro durante a exclusão da avaliação: "+ex.getMessage());
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
		return -1;
	}
	
	public void criarAvaliacao(Avaliacao avaliacao){
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("INSERT INTO avaliacao (id_produto, id_usuario, comentario, nota, data, hora) VALUES (?,?,?,?,?,?)");
			
			pstmt.setInt(1, avaliacao.getIdProduto());
			pstmt.setInt(2, avaliacao.getUsuario().getId());
			pstmt.setString(3, avaliacao.getComentario());
			pstmt.setInt(4, avaliacao.getNota());
			pstmt.setDate(5, avaliacao.getData());
			pstmt.setTime(6, avaliacao.getHora());
			pstmt.execute();
		}
		catch(Exception ex){
			System.out.println("Erro durante a criação de avaliação: "+ex.getMessage());
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
	}
	
	public List<Avaliacao> getAvaliacoesPorIdProduto(int idProduto){
		Avaliacao avaliacao = null;
		Usuario usuario = null;
		List<Avaliacao> avaliacoes = new ArrayList<Avaliacao>();
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM avaliacao WHERE id_produto = ?");
			pstmt.setInt(1, idProduto);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				avaliacao = new Avaliacao();
				avaliacao.setComentario(resultSet.getString("avaliacao.comentario"));
				avaliacao.setId(resultSet.getInt("avaliacao.id"));
				avaliacao.setIdProduto(resultSet.getInt("avaliacao.id_produto"));
				avaliacao.setData(resultSet.getDate("avaliacao.data"));
				avaliacao.setHora(resultSet.getTime("avaliacao.hora"));
				avaliacao.setNota(resultSet.getInt("avaliacao.nota"));
				
				usuario = new Usuario();
				pstmt = connection.prepareStatement("SELECT * FROM usuario WHERE id = ?");
				pstmt.setInt(1, resultSet.getInt("avaliacao.id_usuario"));
				ResultSet resultSet2 = pstmt.executeQuery();
				if(resultSet2.next()){
					usuario.setId(resultSet2.getInt("usuario.id"));
					usuario.setNome(resultSet2.getString("usuario.nome"));
					usuario.setDataNascimento(resultSet2.getDate("usuario.dataNascimento"));
					usuario.setEmail(resultSet2.getString("usuario.email"));
					usuario.setSenha(resultSet2.getString("usuario.senha"));
					usuario.setTelefone(resultSet2.getString("usuario.telefone"));
					usuario.setCelular(resultSet2.getString("usuario.celular"));
				}
				avaliacao.setUsuario(usuario);
				avaliacoes.add(avaliacao);
			}
		}
		catch(SQLException ex){
			System.out.println("Erro durante a busca de avaliações por id_produto: "+ex.getMessage());
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
		return avaliacoes;
	}
	
	public Avaliacao getAvaliacaoPorIdProdutoEIdUsuario(int idProduto, int idUsuario){
		Avaliacao avaliacao = null;
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM avaliacao WHERE id_produto = ? AND id_usuario = ?");
			pstmt.setInt(1, idProduto);
			pstmt.setInt(2, idUsuario);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				avaliacao = new Avaliacao();
				avaliacao.setComentario(resultSet.getString("avaliacao.comentario"));
				avaliacao.setId(resultSet.getInt("avaliacao.id"));
				avaliacao.setIdProduto(resultSet.getInt("avaliacao.id_produto"));
				avaliacao.setData(resultSet.getDate("avaliacao.data"));
				avaliacao.setHora(resultSet.getTime("avaliacao.hora"));
				avaliacao.setNota(resultSet.getInt("avaliacao.nota"));
			}
		}
		catch(SQLException ex){
			System.out.println("Erro durante a busca de avaliações por id_produto e id_usuario: "+ex.getMessage());
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
		return avaliacao;
	}
}