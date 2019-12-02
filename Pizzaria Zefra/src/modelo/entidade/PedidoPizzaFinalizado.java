//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package modelo.entidade;

import java.io.Serializable;
import java.util.List;

public class PedidoPizzaFinalizado implements Serializable{

	private static final long serialVersionUID = 1L;
	int id;
	int id_pedido;
	ItemPedidoFinalizado itemPedidoFinalizado;
	Tamanho tamanho;
	List<Ingrediente> ingredientesRemovidos;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_pedido() {
		return id_pedido;
	}
	public void setId_pedido(int id_pedido) {
		this.id_pedido = id_pedido;
	}
	public ItemPedidoFinalizado getItemPedidoFinalizado() {
		return itemPedidoFinalizado;
	}
	public void setItemPedidoFinalizado(ItemPedidoFinalizado itemPedidoFinalizado) {
		this.itemPedidoFinalizado = itemPedidoFinalizado;
	}
	public Tamanho getTamanho() {
		return tamanho;
	}
	public void setTamanho(Tamanho tamanho) {
		this.tamanho = tamanho;
	}
	public List<Ingrediente> getIngredientesRemovidos() {
		return ingredientesRemovidos;
	}
	public void setIngredientesRemovidos(List<Ingrediente> ingredientesRemovidos) {
		this.ingredientesRemovidos = ingredientesRemovidos;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + id_pedido;
		result = prime
				* result
				+ ((ingredientesRemovidos == null) ? 0 : ingredientesRemovidos
						.hashCode());
		result = prime
				* result
				+ ((itemPedidoFinalizado == null) ? 0 : itemPedidoFinalizado
						.hashCode());
		result = prime * result + ((tamanho == null) ? 0 : tamanho.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PedidoPizzaFinalizado other = (PedidoPizzaFinalizado) obj;
		if (id != other.id)
			return false;
		if (id_pedido != other.id_pedido)
			return false;
		if (ingredientesRemovidos == null) {
			if (other.ingredientesRemovidos != null)
				return false;
		} else if (!ingredientesRemovidos.equals(other.ingredientesRemovidos))
			return false;
		if (itemPedidoFinalizado == null) {
			if (other.itemPedidoFinalizado != null)
				return false;
		} else if (!itemPedidoFinalizado.equals(other.itemPedidoFinalizado))
			return false;
		if (tamanho == null) {
			if (other.tamanho != null)
				return false;
		} else if (!tamanho.equals(other.tamanho))
			return false;
		return true;
	}
}