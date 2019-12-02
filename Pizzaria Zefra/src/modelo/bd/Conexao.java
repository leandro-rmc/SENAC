package modelo.bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	private static final String URL = "jdbc:mysql://localhost/zefra";
	private static final String USUARIO = "root";
	private static final String SENHA = "";
	private static Connection conexao = null;
	
	public static Connection getConexao(){
	 try{
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection(URL,USUARIO,SENHA);
            System.out.println("Conexão realizada com sucesso");
            return conexao;
        }
        catch(SQLException | ClassNotFoundException ex){
            System.out.println("Erro durante a conexão! - " + ex.getMessage());
        }
	 	return null;
	}
}