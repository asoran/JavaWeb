package doc;

import mediatheque.Doc;

public class Pdf extends Doc {
	public Pdf(int id, String titre, String auteur, int taken, int taille) {
		super(id, titre, auteur, taken);
		this.taille = taille;
	}
	
	private int taille;
	
	@Override
	public Object[] affiche() {
		return  new Object[]{
				super.affiche()[0],
				super.affiche()[1],
				super.affiche()[2],
				super.affiche()[3],
				"taille",
				taille + " mo"
		};
	}
	
	@Override
	public String getType(){
		return "pdf";
	}
}
