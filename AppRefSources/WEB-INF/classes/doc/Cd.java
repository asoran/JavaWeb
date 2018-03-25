package doc;

import mediatheque.Doc;

public class Cd extends Doc {

	public Cd(int id, String titre, String auteur, int taken, int longueur, String quality) {
		super(id, titre, auteur, taken);
		this.longueur = longueur;
		this.quality = quality;
	}
	
	private int longueur;
	private String quality;
	
	@Override
	public Object[] affiche() {
		return  new Object[]{
				super.affiche()[0],
				super.affiche()[1],
				super.affiche()[2],
				super.affiche()[3],
				"longueur",
				longueur + " secondes",
				"quality",
				quality + " 1080P"
		};
	}
	
	@Override
	public String getType(){
		return "cd";
	}
	
}
