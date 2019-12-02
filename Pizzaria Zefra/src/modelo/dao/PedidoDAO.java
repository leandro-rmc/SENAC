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
import java.util.ArrayList;
import java.util.List;

import modelo.bd.Conexao;
import modelo.entidade.Ingrediente;
import modelo.entidade.ItemPedidoFinalizado;
import modelo.entidade.PedidoFinalizado;
import modelo.entidade.PedidoPizzaFinalizado;
import modelo.entidade.PPizzaIngredientesFinalizado;
import modelo.entidade.Tamanho;
import modelo.entidade.TipoPagamento;

public class PedidoDAO {
	private Connection connection = null;
	private PreparedStatement pstmt = null;
	private ResultSet resultSet = null;
	
	public int criarPedido(PedidoFinalizado pedidoFinalizado){
		connection = Conexao.getConexao();
		try{
			pstmt = connection.prepareStatement("INSERT INTO pedido (data,id_usuario,hora,id_tipo_pagamento) VALUES(?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
			pstmt.setDate(1, (Date) pedidoFinalizado.getData());
			pstmt.setInt(2, pedidoFinalizado.getId_usuario());
			pstmt.setTime(3, pedidoFinalizado.getHora());
			pstmt.setInt(4, pedidoFinalizado.getTipoPagamento().getId());
			pstmt.execute();
			resultSet = pstmt.getGeneratedKeys();
			resultSet.first();
			return resultSet.getInt(1);
		}
		catch(SQLException ex){
			System.out.println("Erro durante a criação do pedido: "+ex);
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
	
	public int criarItemPedido(ItemPedidoFinalizado itemPedidoFinalizado){
		connection = Conexao.getConexao();
		try{
			pstmt = connection.prepareStatement("INSERT INTO item_pedido (id_produto,id_pedido,quantidade,tipo,valor) VALUES(?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, itemPedidoFinalizado.getId_produto());
			pstmt.setInt(2, itemPedidoFinalizado.getId_pedido());
			pstmt.setInt(3, itemPedidoFinalizado.getQuantidade());
			pstmt.setString(4, itemPedidoFinalizado.getTipo());
			pstmt.setDouble(5, itemPedidoFinalizado.getValor());
			pstmt.execute();
			resultSet = pstmt.getGeneratedKeys();
			resultSet.first();
			return resultSet.getInt(1);
			
		}
		catch(SQLException ex){
			System.out.println("Erro durante a criação do item_pedido: "+ex);
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
	
	public int criarPedidoPizza(PedidoPizzaFinalizado pedidoPizzaFinalizado){
		connection = Conexao.getConexao();
		try{
			pstmt = connection.prepareStatement("INSERT INTO pedido_pizza (id_item_pedido,id_tamanho) VALUES(?,?)",Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, pedidoPizzaFinalizado.getItemPedidoFinalizado().getId());
			pstmt.setInt(2, pedidoPizzaFinalizado.getTamanho().getId());
			pstmt.execute();
			resultSet = pstmt.getGeneratedKeys();
			resultSet.first();
			return resultSet.getInt(1);
		}
		catch(SQLException ex){
			System.out.println("Erro durante a criação do pedido_pizza: "+ex);
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
	
	public int criarPedidoPizzaIngrediente(PPizzaIngredientesFinalizado pedidoPizzaIngredientesFinalizado){
		connection = Conexao.getConexao();
		try{
			pstmt = connection.prepareStatement("INSERT INTO pedido_pizza_ingredientes (id_item_pedido,removido,id_ingrediente) VALUES(?,?,?)",Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, pedidoPizzaIngredientesFinalizado.getItemPedidoFinalizado().getId());
			pstmt.setBoolean(2, pedidoPizzaIngredientesFinalizado.isRemovido());
			pstmt.setInt(3, pedidoPizzaIngredientesFinalizado.getId_ingrediente());
			pstmt.execute();
			resultSet = pstmt.getGeneratedKeys();
			resultSet.first();
			return resultSet.getInt(1);
		}
		catch(SQLException ex){
			System.out.println("Erro durante a criação do pedido_pizza_ingrediente: "+ex);
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
	
	public List<PedidoFinalizado> getListPedidoFinalizadoPorIdUsuario(int id){
		connection = Conexao.getConexao();
		PedidoFinalizado pedidoFinalizado = new PedidoFinalizado();
		List<PedidoFinalizado> listPedidoFinalizado = new ArrayList<PedidoFinalizado>();
		try{
			pstmt = connection.prepareStatement("SELECT * FROM pedido WHERE id_usuario = ?");
			pstmt.setInt(1, id);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				pedidoFinalizado = new PedidoFinalizado();
				pedidoFinalizado.setId(resultSet.getInt("pedido.id"));
				pedidoFinalizado.setId_usuario(resultSet.getInt("pedido.id_usuario"));
				pedidoFinalizado.setData(resultSet.getDate("pedido.data"));
				pedidoFinalizado.setHora(resultSet.getTime("pedido.hora"));
				
				TipoPagamento tipoPagamento = new TipoPagamento();
				tipoPagamento = getTipoPagamentoPorId(resultSet.getInt("pedido.id_tipo_pagamento"));
				pedidoFinalizado.setTipoPagamento(tipoPagamento);
				
				listPedidoFinalizado.add(pedidoFinalizado);
				
			}
			return listPedidoFinalizado;
			
		}
		catch(Exception ex){
			System.out.println("Erro durante a busca por pedidos do usuário: "+ex);
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
		return listPedidoFinalizado;
	}
	
	public List<ItemPedidoFinalizado> getItensPedidoFPorIdPedido(int id){
		connection = Conexao.getConexao();
		ItemPedidoFinalizado itemPedidoFinalizado;
		List<ItemPedidoFinalizado> itensPedidoFinalizado = new ArrayList<ItemPedidoFinalizado>();
		try{
			pstmt = connection.prepareStatement("SELECT * FROM item_pedido WHERE id_pedido = ?");
			pstmt.setInt(1, id);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				itemPedidoFinalizado = new ItemPedidoFinalizado();
				itemPedidoFinalizado.setId(resultSet.getInt("item_pedido.id"));
				itemPedidoFinalizado.setId_produto(resultSet.getInt("item_pedido.id_produto"));
				itemPedidoFinalizado.setQuantidade(resultSet.getInt("item_pedido.quantidade"));
				itemPedidoFinalizado.setTipo(resultSet.getString("item_pedido.tipo"));
				itemPedidoFinalizado.setValor(resultSet.getDouble("item_pedido.valor"));
				itensPedidoFinalizado.add(itemPedidoFinalizado);
			}
			return itensPedidoFinalizado;
		}
		catch(Exception ex){
			System.out.println("Erro durante a busca de itens pedido por id pedido: "+ex);
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
	
	public double getPrecoTotalPedidoPorId(int id){
		connection = Conexao.getConexao();
		try{
			pstmt = connection.prepareStatement("SELECT sum(valor) FROM item_pedido WHERE id_pedido = ?");
			pstmt.setInt(1, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				return resultSet.getDouble(1);
			}
		}
		catch(Exception ex){
			System.out.println("Erro durante a busca de preço de pedido por id: "+ex);
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
	
	private TipoPagamento getTipoPagamentoPorId(int id){
		try{
			
			PreparedStatement stmt2 = connection.prepareStatement("SELECT * FROM tipo_pagamento WHERE id = ?");
			stmt2.setInt(1, id);
			ResultSet resultSet2 = stmt2.executeQuery();
			if(resultSet2.next()){
				TipoPagamento tipoPagamento = new TipoPagamento();
				tipoPagamento.setId(resultSet2.getInt("tipo_pagamento.id"));
				tipoPagamento.setTipo(resultSet2.getString("tipo_pagamento.tipo"));
				return tipoPagamento;
			}
		}
		catch(Exception ex){
			System.out.println("Erro ao buscar tipo de pagamento por id: "+ex);
		}
		return null;
	}
	
	public List<TipoPagamento> getTiposDePagamento(){
		connection = Conexao.getConexao();
		List<TipoPagamento> tiposPagamento = new ArrayList<TipoPagamento>();
		TipoPagamento tipoPagamento;
		try{
			pstmt = connection.prepareStatement("SELECT * FROM tipo_pagamento");
			resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				tipoPagamento = new TipoPagamento();
				tipoPagamento.setId(resultSet.getInt("tipo_pagamento.id"));
				tipoPagamento.setTipo(resultSet.getString("tipo_pagamento.tipo"));
				tiposPagamento.add(tipoPagamento);
			}
			return tiposPagamento;
		}
		catch(Exception ex){
			System.out.println("Erro durante a busca de tipos de pagamento: "+ex);
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
	

	public PedidoPizzaFinalizado getPedidoPizzaFPorIdItemPedidoF(int id){
		connection = Conexao.getConexao();
		PedidoPizzaFinalizado pedidoPizzaFinalizado = new PedidoPizzaFinalizado();
		try{
			pstmt = connection.prepareStatement("SELECT * FROM pedido_pizza WHERE id_item_pedido = ?");
			pstmt.setInt(1, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				int idTamanho = resultSet.getInt("pedido_pizza.id_tamanho");
				Tamanho tamanho = new Tamanho();
				pstmt = connection.prepareStatement("SELECT * FROM tamanho WHERE id = ?");
				pstmt.setInt(1, idTamanho);
				resultSet = pstmt.executeQuery();
				if(resultSet.next()){
					tamanho.setId(resultSet.getInt("tamanho.id"));
					tamanho.setCmTamanho(resultSet.getInt("tamanho.cm_tamanho"));
					tamanho.setNomeTamanho(resultSet.getString("tamanho.nome_tamanho"));
					pedidoPizzaFinalizado.setTamanho(tamanho);
					Ingrediente ingrediente;
					List<Ingrediente> ingredientes = new ArrayList<Ingrediente>();
					pstmt = connection.prepareStatement("SELECT * FROM pedido_pizza_ingredientes JOIN ingrediente ON pedido_pizza_ingredientes.id_ingrediente = ingrediente.id WHERE id_item_pedido = ?");
					pstmt.setInt(1, id);
					resultSet = pstmt.executeQuery();
					while(resultSet.next()){
						ingrediente = new Ingrediente();
						ingrediente.setId(resultSet.getInt("ingrediente.id"));
						ingrediente.setNome(resultSet.getString("ingrediente.nome"));
						ingredientes.add(ingrediente);
					}
					pedidoPizzaFinalizado.setIngredientesRemovidos(ingredientes);
				}
				return pedidoPizzaFinalizado;
			}
		}
		catch(Exception ex){
			System.out.println("Erro durante a busca de pedido pizza por id de item pedido: "+ex);
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
	
	public int getQuantidadeTotalItensPedidoPorId(int id){
		connection = Conexao.getConexao();
		try{
			pstmt = connection.prepareStatement("SELECT sum(quantidade) FROM item_pedido WHERE id_pedido = ?");
			pstmt.setInt(1, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				return resultSet.getInt(1);
			}
		}
		catch(Exception ex){
			System.out.println("Erro durante a busca de quantidade de itens de pedido por id: "+ex);
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
	
	public PedidoFinalizado getPedidoFPorId(int id){
		connection = Conexao.getConexao();
		PedidoFinalizado pedidoFinalizado = new PedidoFinalizado();
		try{
			pstmt = connection.prepareStatement("SELECT * FROM pedido WHERE id = ?");
			pstmt.setInt(1, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				pedidoFinalizado = new PedidoFinalizado();
				pedidoFinalizado.setId(resultSet.getInt("pedido.id"));
				pedidoFinalizado.setId_usuario(resultSet.getInt("pedido.id_usuario"));
				pedidoFinalizado.setData(resultSet.getDate("pedido.data"));
				pedidoFinalizado.setHora(resultSet.getTime("pedido.hora"));
				
				TipoPagamento tipoPagamento = new TipoPagamento();
				tipoPagamento = getTipoPagamentoPorId(resultSet.getInt("pedido.id_tipo_pagamento"));
				pedidoFinalizado.setTipoPagamento(tipoPagamento);
				
				return pedidoFinalizado;
			}
		}
		catch(Exception ex){
			System.out.println("Erro durante a busca por pedidos do usuário por id: "+ex);
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
	
	public int getIndexPedidoFPorId(int id){
		connection = Conexao.getConexao();
		try{
			pstmt = connection.prepareStatement("SELECT * FROM pedido WHERE id = ?");
			pstmt.setInt(1, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				int idUsuario = resultSet.getInt("pedido.id_usuario");
				pstmt = connection.prepareStatement("SELECT * FROM pedido WHERE id_usuario = ?");
				pstmt.setInt(1, idUsuario);
				resultSet = pstmt.executeQuery();
				
				while(resultSet.next()){
					if(resultSet.getInt("pedido.id") == id){
						return resultSet.getRow();
					}
				}
			}
		}
		catch(Exception ex){
			System.out.println("Erro durante a busca do indíce do pedido do usuário por id: "+ex);
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
}