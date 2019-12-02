//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.bd.Conexao;
import modelo.entidade.Ingrediente;
import modelo.entidade.PizzaIngredientes;
import modelo.entidade.PizzaPrecosTamanhos;
import modelo.entidade.ProdutoPizza;
import modelo.entidade.Tamanho;

public class PizzaDAO {
	private Connection connection = null;
	private PreparedStatement pstmt = null;
	private ResultSet resultSet = null;
	
	public void criarTamanho(Tamanho tamanho){
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("INSERT INTO tamanho (nome_tamanho, cm_tamanho) VALUES (?,?)");
			pstmt.setString(1, tamanho.getNomeTamanho());
			pstmt.setInt(2, tamanho.getCmTamanho());
			pstmt.execute();
		}
		catch(Exception ex){
			System.out.println("Erro ao cadastrar um novo tamanho de pizza: " + ex.getMessage());
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
	
	public List<Tamanho> getTamanhos(){
		Tamanho tamanho = null;
		List<Tamanho> tamanhos = null;
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM tamanho");
			resultSet = pstmt.executeQuery();
			tamanhos = new ArrayList<Tamanho>();
			while(resultSet.next()){
				tamanho = new Tamanho();
				tamanho.setId(resultSet.getInt("tamanho.id"));
				tamanho.setCmTamanho(resultSet.getInt("tamanho.cm_tamanho"));
				tamanho.setNomeTamanho(resultSet.getString("tamanho.nome_tamanho"));
				tamanhos.add(tamanho);
			}
			return tamanhos;
		}
		catch(Exception ex){
			System.out.println("Erro ao buscar os tamanhos de pizza: " + ex.getMessage());
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
	
	public Tamanho getTamanhoPorId(int id){
		Tamanho tamanho = null;
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM tamanho WHERE id = ?");
			pstmt.setInt(1, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				tamanho = new Tamanho();
				tamanho.setId(resultSet.getInt("tamanho.id"));
				tamanho.setCmTamanho(resultSet.getInt("tamanho.cm_tamanho"));
				tamanho.setNomeTamanho(resultSet.getString("tamanho.nome_tamanho"));
			}
			return tamanho;
		}
		catch(Exception ex){
			System.out.println("Erro ao buscar o tamanho de pizza por id: " + ex.getMessage());
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
	
	public Ingrediente getIngredientePorId(int id){
		Ingrediente ingrediente = null;
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM ingrediente WHERE id = ?");
			pstmt.setInt(1, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				ingrediente = new Ingrediente();
				ingrediente.setId(resultSet.getInt("ingrediente.id"));
				ingrediente.setNome(resultSet.getString("ingrediente.nome"));
			}
			return ingrediente;
		}
		catch(Exception ex){
			System.out.println("Erro ao buscar o ingrediente por id: " + ex.getMessage());
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
	
	//Jamais fechar resultSet, pstmt ou connection aqui.
	private List<PizzaPrecosTamanhos> getPizzaTamanhosPorIdProduto(int idProduto, boolean abrirConexao){
		Tamanho tamanho = null;
		PizzaPrecosTamanhos pizzaPrecosTamanhos = null;
		List<PizzaPrecosTamanhos> lPizzaPrecosTamanhos = null;
		try{
			if (abrirConexao)
				connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM tamanho JOIN pizza_precos_tamanhos ON pizza_precos_tamanhos.id_tamanho = tamanho.id WHERE id_produto = ?");
			pstmt.setInt(1, idProduto);
			resultSet = pstmt.executeQuery();
			lPizzaPrecosTamanhos = new ArrayList<PizzaPrecosTamanhos>();
			while(resultSet.next()){
				pizzaPrecosTamanhos = new PizzaPrecosTamanhos();
				tamanho = new Tamanho();
				pizzaPrecosTamanhos.setId(resultSet.getInt("pizza_precos_tamanhos.id"));
				pizzaPrecosTamanhos.setId_produto(resultSet.getInt("pizza_precos_tamanhos.id_produto"));
				pizzaPrecosTamanhos.setPreco(resultSet.getDouble("pizza_precos_tamanhos.preco"));
				
				tamanho.setCmTamanho(resultSet.getInt("tamanho.cm_tamanho"));
				tamanho.setId(resultSet.getInt("tamanho.id"));
				tamanho.setNomeTamanho(resultSet.getString("tamanho.nome_tamanho"));
				
				pizzaPrecosTamanhos.setTamanho(tamanho);
				lPizzaPrecosTamanhos.add(pizzaPrecosTamanhos);
			}
			return lPizzaPrecosTamanhos;
		}
		catch(Exception ex){
			System.out.println("Erro ao buscar os tamanhos da pizza por idProduto: " + ex.getMessage());
		}
		return null;
	}
	
	public List<Ingrediente> getIngredientes(){
		Ingrediente ingrediente = null;
		List<Ingrediente> ingredientes = null;
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM ingrediente");
			resultSet = pstmt.executeQuery();
			ingredientes = new ArrayList<Ingrediente>();
			while(resultSet.next()){
				ingrediente = new Ingrediente();

				ingrediente.setId(resultSet.getInt("ingrediente.id"));
				ingrediente.setNome(resultSet.getString("ingrediente.nome"));
				ingredientes.add(ingrediente);
			}
			return ingredientes;
		}
		catch(Exception ex){
			System.out.println("Erro ao buscar ingredientes: " + ex.getMessage());
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
	
	//Jamais fechar resultSet, pstmt ou connection aqui.
	private List<PizzaIngredientes> getPizzaIngredientesPorIdProduto(int idProduto, boolean abrirConexao){
		Ingrediente ingrediente = null;
		PizzaIngredientes pizzaIngrediente = null;
		List<PizzaIngredientes> pizzaIngredientes = null;
		try{
			if (abrirConexao)
				connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM ingrediente JOIN pizza_ingredientes ON ingrediente.id = pizza_ingredientes.id_ingrediente WHERE id_produto = ?");
			pstmt.setInt(1, idProduto);
			resultSet = pstmt.executeQuery();
			pizzaIngredientes = new ArrayList<PizzaIngredientes>();
			while(resultSet.next()){
				ingrediente = new Ingrediente();
				pizzaIngrediente = new PizzaIngredientes();
				pizzaIngrediente.setId(resultSet.getInt("pizza_ingredientes.id"));
				ingrediente.setId(resultSet.getInt("ingrediente.id"));
				ingrediente.setNome(resultSet.getString("ingrediente.nome"));
				pizzaIngrediente.setIngrediente(ingrediente);
				pizzaIngredientes.add(pizzaIngrediente);
			}
			return pizzaIngredientes;
		}
		catch(Exception ex){
			System.out.println("Erro ao buscar ingredientes da pizza por idProduto: " + ex.getMessage());
		}
		return null;
	}
	
	public double getPrecoDoTamanhoDePizza(int idProduto, int idTamanho){
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT preco FROM pizza_precos_tamanhos WHERE id_produto = ? AND id_tamanho = ?");
			pstmt.setInt(1, idProduto);
			pstmt.setInt(2, idTamanho);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				return resultSet.getDouble("pizza_precos_tamanhos.preco");
			}
			else{
				return -1;
			}
		}
		catch(Exception ex){
			System.out.println("Erro ao buscar o tamanho de pizza por id: " + ex.getMessage());
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
		return -1;
	}
	
	public List<ProdutoPizza> getPizzas(){
		ProdutoPizza produtoPizza = null;
		List<ProdutoPizza> produtos_pizza = null;
		List<PizzaPrecosTamanhos> lPizzaPrecosTamanhos = null;
		List<PizzaIngredientes> pizzaIngredientes = null;
		
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM produto WHERE tipo = ? ORDER BY titulo");
			pstmt.setString(1, "pizza");
			ResultSet resultSetProduto = pstmt.executeQuery();
			produtos_pizza = new ArrayList<ProdutoPizza>();
			while(resultSetProduto.next()){
				lPizzaPrecosTamanhos = getPizzaTamanhosPorIdProduto(resultSetProduto.getInt("produto.id"),false);
				pizzaIngredientes = getPizzaIngredientesPorIdProduto(resultSetProduto.getInt("produto.id"),false);
				produtoPizza = new ProdutoPizza();
				produtoPizza.setIdProduto(resultSetProduto.getInt("produto.id"));
				produtoPizza.setDescricao(resultSetProduto.getString("descricao"));
				produtoPizza.setTipo(resultSetProduto.getString("tipo"));
				produtoPizza.setImg(resultSetProduto.getString("img"));
				produtoPizza.setTitulo(resultSetProduto.getString("titulo"));
				produtoPizza.setPizzaIngredientes(pizzaIngredientes);
				produtoPizza.setPizzaPrecosTamanhos(lPizzaPrecosTamanhos);
				
				int total = 0;
				double media = 0;
				
				pstmt = connection.prepareStatement("SELECT COUNT(*) FROM avaliacao WHERE id_produto = ? AND comentario != ''");
				pstmt.setInt(1, resultSetProduto.getInt("produto.id"));
				ResultSet resultSet2 = pstmt.executeQuery();
				if(resultSet2.next()){
					produtoPizza.setNumeroComentarios(resultSet2.getInt(1));
				}

				pstmt = connection.prepareStatement("SELECT COUNT(*) FROM avaliacao WHERE id_produto = ?");
				pstmt.setInt(1, resultSetProduto.getInt("produto.id"));
				resultSet2 = pstmt.executeQuery();
				if(resultSet2.next()){
					total = resultSet2.getInt(1);
				}
				
				pstmt = connection.prepareStatement("SELECT SUM(nota) FROM avaliacao WHERE id_produto = ?");
				pstmt.setInt(1, resultSetProduto.getInt("produto.id"));
				resultSet2 = pstmt.executeQuery();
				if(resultSet2.next()){
					if(total > 0){
						media = (double) resultSet2.getInt(1) / total;
					}
					else{
						media = -1;
					}
					produtoPizza.setMediaNotas(media);
				}
				
				produtos_pizza.add(produtoPizza);
			}
			return produtos_pizza;
		}
		catch(SQLException ex){
			System.out.println("Erro ao buscar pizzas: " + ex.getMessage());
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
	
	public ProdutoPizza getPizzaPorId(int id){
		ProdutoPizza produtoPizza = null;
		List<PizzaPrecosTamanhos> pizzaPrecosTamanhos = null;
		List<PizzaIngredientes> pizzaIngredientes = null;
		
		try{
			connection = Conexao.getConexao();
			pstmt = connection.prepareStatement("SELECT * FROM produto WHERE tipo = ? AND id = ?");
			pstmt.setString(1, "pizza");
			pstmt.setInt(2, id);
			ResultSet resultSetProduto = pstmt.executeQuery();
			if(resultSetProduto.next()){
				pizzaPrecosTamanhos = getPizzaTamanhosPorIdProduto(id,false);
				pizzaIngredientes = getPizzaIngredientesPorIdProduto(id,false);
				produtoPizza = new ProdutoPizza();
				produtoPizza.setIdProduto(resultSetProduto.getInt("produto.id"));
				produtoPizza.setDescricao(resultSetProduto.getString("descricao"));
				produtoPizza.setTipo(resultSetProduto.getString("tipo"));
				produtoPizza.setImg(resultSetProduto.getString("img"));
				produtoPizza.setTitulo(resultSetProduto.getString("titulo"));
				produtoPizza.setPizzaIngredientes(pizzaIngredientes);
				produtoPizza.setPizzaPrecosTamanhos(pizzaPrecosTamanhos);
				
				int total = 0;
				double media = 0;
				
				pstmt = connection.prepareStatement("SELECT COUNT(*) FROM avaliacao WHERE id_produto = ? AND comentario != ''");
				pstmt.setInt(1, resultSetProduto.getInt("produto.id"));
				ResultSet resultSet2 = pstmt.executeQuery();
				if(resultSet2.next()){
					produtoPizza.setNumeroComentarios(resultSet2.getInt(1));
				}

				pstmt = connection.prepareStatement("SELECT COUNT(*) FROM avaliacao WHERE id_produto = ?");
				pstmt.setInt(1, resultSetProduto.getInt("produto.id"));
				resultSet2 = pstmt.executeQuery();
				if(resultSet2.next()){
					total = resultSet2.getInt(1);
				}
				
				pstmt = connection.prepareStatement("SELECT SUM(nota) FROM avaliacao WHERE id_produto = ?");
				pstmt.setInt(1, resultSetProduto.getInt("produto.id"));
				resultSet2 = pstmt.executeQuery();
				if(resultSet2.next()){
					if(total > 0){
						media = (double) resultSet2.getInt(1) / total;
					}
					else{
						media = -1;
					}
					produtoPizza.setMediaNotas(media);
				}
			}
			return produtoPizza;
		}
		catch(SQLException ex){
			System.out.println("Erro ao buscar pizza por id: " + ex.getMessage());
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