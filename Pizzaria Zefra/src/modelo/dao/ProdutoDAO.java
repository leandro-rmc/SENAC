//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import modelo.bd.Conexao;

public class ProdutoDAO {
	private Connection connection = null;
	private PreparedStatement pstmt = null;
	private ResultSet resultSet = null;
	
	public String getTipoPorId(int id){
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM produto WHERE id = ?");
			pstmt.setInt(1, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				return resultSet.getString("produto.tipo");
			}
		}
		catch(SQLException ex){
			System.out.println("Erro durante a busca de tipo de produto por ID: "+ex.getMessage());
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