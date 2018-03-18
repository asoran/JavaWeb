package mdr;
import java.util.Date;

import mediatheque.Document;
import mediatheque.EmpruntException;
import mediatheque.Utilisateur;

public class Livre extends Doc {

	public Livre(String titre, String auteur) {
		super(titre, auteur);
	}
	
	public String editeur = "Galimard";
	@SuppressWarnings("deprecation")
	public Date dateParution = new Date("01/15/2018");
	
	@Override
	public Object[] affiche() {
		return  new Object[]{
				titre,
				auteur,
				"editeur",
				editeur,
				"dateParution",
				dateParution
		};
	}

	@Override
	public String getType(){
		return "livre";
	}
	
	@mdr
	public @interface mdr {
		
	}
	
}