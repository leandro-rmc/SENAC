//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package modelo.entidade;

import java.io.Serializable;

public class PPizzaIngredientesFinalizado implements Serializable{

	private static final long serialVersionUID = 1L;
	int id;
	int id_ingrediente;
	int id_produto;
	ItemPedidoFinalizado itemPedidoFinalizado;
	Ingrediente ingrediente;
	boolean removido;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_ingrediente() {
		return id_ingrediente;
	}
	public void setId_ingrediente(int id_ingrediente) {
		this.id_ingrediente = id_ingrediente;
	}
	public ItemPedidoFinalizado getItemPedidoFinalizado() {
		return itemPedidoFinalizado;
	}
	public void setItemPedidoFinalizado(ItemPedidoFinalizado itemPedidoFinalizado) {
		this.itemPedidoFinalizado = itemPedidoFinalizado;
	}
	public boolean isRemovido() {
		return removido;
	}
	public void setRemovido(boolean removido) {
		this.removido = removido;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getId_produto() {
		return id_produto;
	}
	public void setId_produto(int id_produto) {
		this.id_produto = id_produto;
	}
	public Ingrediente getIngrediente() {
		return ingrediente;
	}
	public void setIngrediente(Ingrediente ingrediente) {
		this.ingrediente = ingrediente;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + id_ingrediente;
		result = prime * result + id_produto;
		result = prime * result
				+ ((ingrediente == null) ? 0 : ingrediente.hashCode());
		result = prime
				* result
				+ ((itemPedidoFinalizado == null) ? 0 : itemPedidoFinalizado
						.hashCode());
		result = prime * result + (removido ? 1231 : 1237);
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
		PPizzaIngredientesFinalizado other = (PPizzaIngredientesFinalizado) obj;
		if (id != other.id)
			return false;
		if (id_ingrediente != other.id_ingrediente)
			return false;
		if (id_produto != other.id_produto)
			return false;
		if (ingrediente == null) {
			if (other.ingrediente != null)
				return false;
		} else if (!ingrediente.equals(other.ingrediente))
			return false;
		if (itemPedidoFinalizado == null) {
			if (other.itemPedidoFinalizado != null)
				return false;
		} else if (!itemPedidoFinalizado.equals(other.itemPedidoFinalizado))
			return false;
		if (removido != other.removido)
			return false;
		return true;
	}
}