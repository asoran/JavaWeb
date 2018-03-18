package mdr;
import mediatheque.Document;
import mediatheque.EmpruntException;
import mediatheque.Utilisateur;

public abstract class Doc implements Document {

	String titre, auteur;
	
	public Doc(String titre, String auteur){
		this.titre = titre;
		this.auteur = auteur;
	}
	
	@Override
	public void emprunter(Utilisateur a) throws EmpruntException {
	}

	@Override
	public void retour() {
	}

	@Override
	public Object[] affiche() {
		return  new Object[]{
				titre,
				auteur
		};
	}

	public String getType(){
		return "Doc";
	}

	@Override
	public String toString() {
		return "Doc [titre=" + titre + ", auteur=" + auteur + "]";
	}
	
	
}
