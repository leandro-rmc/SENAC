//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package modelo.entidade;

import java.io.Serializable;

public class ProdutoVariedade implements Serializable, Produto {

	private static final long serialVersionUID = 1L;
	private int id;
	private Double preco;
	private int estoque;
	
	private int idProduto;
	private String tipo;
	private String img;
	private String descricao;
	private String titulo;
	private int numeroComentarios;
	private double mediaNotas;
	private boolean isComprador;
	Avaliacao avaliacao;
	
	public Avaliacao getAvaliacao() {
		return avaliacao;
	}

	public void setAvaliacao(Avaliacao avaliacao) {
		this.avaliacao = avaliacao;
	}
	
	public boolean isComprador() {
		return isComprador;
	}

	public void setComprador(boolean isComprador) {
		this.isComprador = isComprador;
	}
	
	public int getNumeroComentarios() {
		return numeroComentarios;
	}

	public void setNumeroComentarios(int numeroComentarios) {
		this.numeroComentarios = numeroComentarios;
	}

	public double getMediaNotas() {
		return mediaNotas;
	}

	public void setMediaNotas(double mediaNotas) {
		this.mediaNotas = mediaNotas;
	}
	
	public int getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public ProdutoVariedade() {
	}

	public ProdutoVariedade(int id, Double preco, int estoque, int idProduto,
			String tipo, String img, String descricao, String titulo) {
		super();
		this.id = id;
		this.preco = preco;
		this.estoque = estoque;
		this.idProduto = idProduto;
		this.tipo = tipo;
		this.img = img;
		this.descricao = descricao;
		this.titulo = titulo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public int getEstoque() {
		return estoque;
	}

	public void setEstoque(int estoque) {
		this.estoque = estoque;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((descricao == null) ? 0 : descricao.hashCode());
		result = prime * result + estoque;
		result = prime * result + id;
		result = prime * result + idProduto;
		result = prime * result + ((img == null) ? 0 : img.hashCode());
		result = prime * result + ((preco == null) ? 0 : preco.hashCode());
		result = prime * result + ((tipo == null) ? 0 : tipo.hashCode());
		result = prime * result + ((titulo == null) ? 0 : titulo.hashCode());
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
		ProdutoVariedade other = (ProdutoVariedade) obj;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (estoque != other.estoque)
			return false;
		if (id != other.id)
			return false;
		if (idProduto != other.idProduto)
			return false;
		if (img == null) {
			if (other.img != null)
				return false;
		} else if (!img.equals(other.img))
			return false;
		if (preco == null) {
			if (other.preco != null)
				return false;
		} else if (!preco.equals(other.preco))
			return false;
		if (tipo == null) {
			if (other.tipo != null)
				return false;
		} else if (!tipo.equals(other.tipo))
			return false;
		if (titulo == null) {
			if (other.titulo != null)
				return false;
		} else if (!titulo.equals(other.titulo))
			return false;
		return true;
	}	
}