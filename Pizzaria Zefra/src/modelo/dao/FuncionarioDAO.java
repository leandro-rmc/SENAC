//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import modelo.bd.Conexao;
import modelo.entidade.Funcionario;
import modelo.entidade.Usuario;

public class FuncionarioDAO {
	private Connection connection = null;
	private PreparedStatement pstmt = null;
	private ResultSet resultSet = null;
	
	public Funcionario getFuncionario(Usuario usuario){
		Funcionario funcionario = null;
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM funcionario WHERE id_usuario = ?");
			pstmt.setInt(1, usuario.getId());
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				funcionario = new Funcionario();
				funcionario.setId(resultSet.getInt("funcionario.id"));
				funcionario.setUsuario(usuario);
				return funcionario;
			}
			
		}
		catch(SQLException ex){
			System.out.println("Erro durante a busca de funcionário: "+ex.getMessage());
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