package mdr;
import mediatheque.Document;
import mediatheque.EmpruntException;
import mediatheque.Utilisateur;

public abstract class Doc implements Document {

	private int id;
	protected String titre;
	protected String auteur;
	protected int taken;
	
	public Doc(int id, String titre, String auteur, int taken){
		this.id = id;
		this.titre = titre;
		this.auteur = auteur;
		this.taken = taken;
	}
	
	@Override
	public void emprunter(Utilisateur a) throws EmpruntException {
	}

	@Override
	public void retour() {
	}

	public int getId(){
		return id;
	}
	
	public int getTaken(){
		return taken;
	}
	
	@Override
	public Object[] affiche() {
		return  new Object[]{
				titre,
				auteur,
				"taken",
				taken
		};
	}

	public String getType(){
		return "doc";
	}

	@Override
	public String toString() {
		return "Doc [titre=" + titre + ", auteur=" + auteur + "]";
	}
	
	
}
