//Desenvolvido por Leandro Rocha Musser Carneiro
//leandro.musser@gmail.com
//SENAC Campo Grande - 2017.1

package modelo.entidade;

import java.io.Serializable;

public class Tamanho implements Serializable {
	
	private static final long serialVersionUID = 1L;
	int id;
	String nomeTamanho;
	int cmTamanho;

	public Tamanho() {
	}
	
	public Tamanho(int id, String nomeTamanho, int cmTamanho) {
		super();
		this.id = id;
		this.nomeTamanho = nomeTamanho;
		this.cmTamanho = cmTamanho;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNomeTamanho() {
		return nomeTamanho;
	}

	public void setNomeTamanho(String nomeTamanho) {
		this.nomeTamanho = nomeTamanho;
	}

	public int getCmTamanho() {
		return cmTamanho;
	}

	public void setCmTamanho(int cmTamanho) {
		this.cmTamanho = cmTamanho;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cmTamanho;
		result = prime * result + id;
		result = prime * result
				+ ((nomeTamanho == null) ? 0 : nomeTamanho.hashCode());
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
		Tamanho other = (Tamanho) obj;
		if (cmTamanho != other.cmTamanho)
			return false;
		if (id != other.id)
			return false;
		if (nomeTamanho == null) {
			if (other.nomeTamanho != null)
				return false;
		} else if (!nomeTamanho.equals(other.nomeTamanho))
			return false;
		return true;
	}
}