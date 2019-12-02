//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package modelo.entidade;

import java.io.Serializable;
import java.util.List;

public class ItemPedido implements Serializable {

	private static final long serialVersionUID = 1L;
	String descricaoPedido;
	String tipo;

	List<ItemPedidoPizza> itemPedidoPizza;
	ItemPedidoPizza itemPedidoPizzaSingle;
	
	ProdutoVariedade produtoVariedade;
	int quantidade;
	double valor;

	public ItemPedido() {
	}

	public String getDescricaoPedido() {
		return descricaoPedido;
	}

	public void setDescricaoPedido(String descricaoPedido) {
		this.descricaoPedido = descricaoPedido;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public List<ItemPedidoPizza> getItemPedidoPizza() {
		return itemPedidoPizza;
	}

	public void setItemPedidoPizza(List<ItemPedidoPizza> itemPedidoPizza) {
		this.itemPedidoPizza = itemPedidoPizza;
	}

	public ItemPedidoPizza getItemPedidoPizzaSingle() {
		return itemPedidoPizzaSingle;
	}

	public void setItemPedidoPizzaSingle(ItemPedidoPizza itemPedidoPizzaSingle) {
		this.itemPedidoPizzaSingle = itemPedidoPizzaSingle;
	}

	public ProdutoVariedade getProdutoVariedade() {
		return produtoVariedade;
	}

	public void setProdutoVariedade(ProdutoVariedade produtoVariedade) {
		this.produtoVariedade = produtoVariedade;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((descricaoPedido == null) ? 0 : descricaoPedido.hashCode());
		result = prime * result
				+ ((itemPedidoPizza == null) ? 0 : itemPedidoPizza.hashCode());
		result = prime
				* result
				+ ((itemPedidoPizzaSingle == null) ? 0 : itemPedidoPizzaSingle
						.hashCode());
		result = prime
				* result
				+ ((produtoVariedade == null) ? 0 : produtoVariedade.hashCode());
		result = prime * result + quantidade;
		result = prime * result + ((tipo == null) ? 0 : tipo.hashCode());
		long temp;
		temp = Double.doubleToLongBits(valor);
		result = prime * result + (int) (temp ^ (temp >>> 32));
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
		ItemPedido other = (ItemPedido) obj;
		if (descricaoPedido == null) {
			if (other.descricaoPedido != null)
				return false;
		} else if (!descricaoPedido.equals(other.descricaoPedido))
			return false;
		if (itemPedidoPizza == null) {
			if (other.itemPedidoPizza != null)
				return false;
		} else if (!itemPedidoPizza.equals(other.itemPedidoPizza))
			return false;
		if (itemPedidoPizzaSingle == null) {
			if (other.itemPedidoPizzaSingle != null)
				return false;
		} else if (!itemPedidoPizzaSingle.equals(other.itemPedidoPizzaSingle))
			return false;
		if (produtoVariedade == null) {
			if (other.produtoVariedade != null)
				return false;
		} else if (!produtoVariedade.equals(other.produtoVariedade))
			return false;
		if (quantidade != other.quantidade)
			return false;
		if (tipo == null) {
			if (other.tipo != null)
				return false;
		} else if (!tipo.equals(other.tipo))
			return false;
		if (Double.doubleToLongBits(valor) != Double
				.doubleToLongBits(other.valor))
			return false;
		return true;
	}
}