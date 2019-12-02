//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package modelo.entidade;

public interface Produto{

	public int getIdProduto();
	public void setIdProduto(int idProduto);
	public String getTipo();
	public void setTipo(String tipo);
	public String getImg();
	public void setImg(String img);
	public String getDescricao();
	public void setDescricao(String descricao);
	public String getTitulo();
	public void setTitulo(String titulo);
	
	public int getNumeroComentarios();
	public void setNumeroComentarios(int numeroComentarios);
	
	public double getMediaNotas();
	public void setMediaNotas(double mediaNota);
}