//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package modelo.entidade;

import java.io.Serializable;
import java.util.List;

public class ItemPedidoPizza implements Serializable {
	
	private static final long serialVersionUID = 1L;
	ProdutoPizza produtoPizza;
	Tamanho tamanho;
	List<Ingrediente> ingredientesRemovidos;
	Double preco;
	int quantidade;
	int codigoProtecao;
	
	public ItemPedidoPizza() {
	}
	
	public ItemPedidoPizza(ProdutoPizza produtoPizza, Tamanho tamanho,
			List<Ingrediente> ingredientesRemovidos, Double preco,
			int quantidade) {
		super();
		this.produtoPizza = produtoPizza;
		this.tamanho = tamanho;
		this.ingredientesRemovidos = ingredientesRemovidos;
		this.preco = preco;
		this.quantidade = quantidade;
	}

	public int getCodigoProtecao() {
		return codigoProtecao;
	}

	public void setCodigoProtecao(int codigoProtecao) {
		this.codigoProtecao = codigoProtecao;
	}

	public Double getPreco() {
		return preco;
	}
	
	public void setPreco(Double preco) {
		this.preco = preco;
	}
	
	public ProdutoPizza getProdutoPizza() {
		return produtoPizza;
	}
	
	public void setProdutoPizza(ProdutoPizza produtoPizza) {
		this.produtoPizza = produtoPizza;
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
	
	public int getQuantidade() {
		return quantidade;
	}
	
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((ingredientesRemovidos == null) ? 0 : ingredientesRemovidos
						.hashCode());
		result = prime * result
				+ ((produtoPizza == null) ? 0 : produtoPizza.hashCode());
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
		ItemPedidoPizza other = (ItemPedidoPizza) obj;
		if (ingredientesRemovidos == null) {
			if (other.ingredientesRemovidos != null)
				return false;
		} else if (!ingredientesRemovidos.equals(other.ingredientesRemovidos))
			return false;
		if (produtoPizza == null) {
			if (other.produtoPizza != null)
				return false;
		} else if (!produtoPizza.equals(other.produtoPizza))
			return false;
		if (tamanho == null) {
			if (other.tamanho != null)
				return false;
		} else if (!tamanho.equals(other.tamanho))
			return false;
		return true;
	}
}