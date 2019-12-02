//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modelo.bd.Conexao;
import modelo.entidade.ProdutoVariedade;

public class ProdutoVariedadeDAO {
	private Connection connection = null;
	private PreparedStatement pstmt = null;
	private ResultSet resultSet = null;
	
	public ArrayList<ProdutoVariedade> getProdutosPorTipo(String tipo){
		ProdutoVariedade produtoVariedade = null;
		ArrayList<ProdutoVariedade> produtos = new ArrayList<ProdutoVariedade>();
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM produto_variedade JOIN produto ON produto.id = produto_variedade.id_produto WHERE produto.tipo = ? ORDER BY produto.titulo");
			pstmt.setString(1, tipo);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				produtoVariedade = new ProdutoVariedade();
				produtoVariedade.setIdProduto(resultSet.getInt("produto.id"));
				produtoVariedade.setDescricao(resultSet.getString("produto.descricao"));
				produtoVariedade.setImg(resultSet.getString("produto.img"));
				produtoVariedade.setTipo(resultSet.getString("produto.tipo"));
				produtoVariedade.setTitulo(resultSet.getString("produto.titulo"));
				produtoVariedade.setEstoque(resultSet.getInt("produto_variedade.estoque"));
				produtoVariedade.setId(resultSet.getInt("produto_variedade.id"));
				produtoVariedade.setPreco(resultSet.getDouble("produto_variedade.preco"));
				
				int total = 0;
				double media = 0;
				
				pstmt = connection.prepareStatement("SELECT COUNT(*) FROM avaliacao WHERE id_produto = ? AND comentario != ''");
				pstmt.setInt(1, resultSet.getInt("produto.id"));
				ResultSet resultSet2 = pstmt.executeQuery();
				if(resultSet2.next()){
					produtoVariedade.setNumeroComentarios(resultSet2.getInt(1));
				}

				pstmt = connection.prepareStatement("SELECT COUNT(*) FROM avaliacao WHERE id_produto = ?");
				pstmt.setInt(1, resultSet.getInt("produto.id"));
				resultSet2 = pstmt.executeQuery();
				if(resultSet2.next()){
					total = resultSet2.getInt(1);
				}
				
				pstmt = connection.prepareStatement("SELECT SUM(nota) FROM avaliacao WHERE id_produto = ?");
				pstmt.setInt(1, resultSet.getInt("produto.id"));
				resultSet2 = pstmt.executeQuery();
				if(resultSet2.next()){
					if(total > 0){
						media = (double) resultSet2.getInt(1) / total;
					}
					else{
						media = -1;
					}
					produtoVariedade.setMediaNotas(media);
				}
				
				

				produtos.add(produtoVariedade);
			}
			return produtos;
		}
		catch(SQLException ex){
			System.out.println("Erro durante a busca de produtos por categoria: "+ex.getMessage());
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
	
	public ProdutoVariedade getProdutoPorId(int id){
		ProdutoVariedade produtoVariedade = null;
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM produto_variedade JOIN produto ON produto.id = produto_variedade.id_produto WHERE produto.id = ?");
			pstmt.setInt(1, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				produtoVariedade = new ProdutoVariedade();
				produtoVariedade.setIdProduto(resultSet.getInt("produto.id"));
				produtoVariedade.setDescricao(resultSet.getString("produto.descricao"));
				produtoVariedade.setImg(resultSet.getString("produto.img"));
				produtoVariedade.setTipo(resultSet.getString("produto.tipo"));
				produtoVariedade.setTitulo(resultSet.getString("produto.titulo"));
				produtoVariedade.setEstoque(resultSet.getInt("produto_variedade.estoque"));
				produtoVariedade.setId(resultSet.getInt("produto_variedade.id"));
				produtoVariedade.setPreco(resultSet.getDouble("produto_variedade.preco"));
			
				int total = 0;
				double media = 0;
				
				pstmt = connection.prepareStatement("SELECT COUNT(*) FROM avaliacao WHERE id_produto = ? AND comentario != ''");
				pstmt.setInt(1, resultSet.getInt("produto.id"));
				ResultSet resultSet2 = pstmt.executeQuery();
				if(resultSet2.next()){
					produtoVariedade.setNumeroComentarios(resultSet2.getInt(1));
				}

				pstmt = connection.prepareStatement("SELECT COUNT(*) FROM avaliacao WHERE id_produto = ?");
				pstmt.setInt(1, resultSet.getInt("produto.id"));
				resultSet2 = pstmt.executeQuery();
				if(resultSet2.next()){
					total = resultSet2.getInt(1);
				}
				
				pstmt = connection.prepareStatement("SELECT SUM(nota) FROM avaliacao WHERE id_produto = ?");
				pstmt.setInt(1, resultSet.getInt("produto.id"));
				resultSet2 = pstmt.executeQuery();
				if(resultSet2.next()){
					if(total > 0){
						media = (double) resultSet2.getInt(1) / total;
					}
					else{
						media = -1;
					}
					produtoVariedade.setMediaNotas(media);
				}
			}
			return produtoVariedade;
		}
		catch(SQLException ex){
			System.out.println("Erro durante a busca de produto por ID: "+ex.getMessage());
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
}