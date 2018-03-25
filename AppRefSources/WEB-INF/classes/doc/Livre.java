package doc;

import mediatheque.Doc;

public class Livre extends Doc {

	public Livre(int id, String titre, String auteur, int taken, String dateParution, String editeur, String genre) {
		super(id, titre, auteur, taken);
		this.editeur = editeur;
		this.dateParution = dateParution;
		this.genre = genre;
	}
	
	private String editeur;
	private String dateParution;
	public String genre;
	
	@Override
	public Object[] affiche() {
		return  new Object[]{
				super.affiche()[0],
				super.affiche()[1],
				super.affiche()[2],
				super.affiche()[3],
				"editeur",
				editeur,
				"dateParution",
				dateParution,
				"genre",
				genre
		};
	}

	@Override
	public String getType(){
		return "livre";
	}
	
}