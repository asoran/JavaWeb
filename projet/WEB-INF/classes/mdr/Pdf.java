package mdr;

public class Pdf extends Doc {
	public Pdf(String titre, String auteur) {
		super(titre, auteur);
	}

	@Override
	public Object[] affiche() {
		return  new Object[]{
				titre,
				auteur,
		};
	}

	@Override
	public String getType(){
		return "pdf";
	}
}
