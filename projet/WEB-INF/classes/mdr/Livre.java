package mdr;
import java.util.Date;

import mediatheque.Document;
import mediatheque.EmpruntException;
import mediatheque.Utilisateur;

public class Livre extends Doc {

	public Livre(int id, String titre, String auteur, int taken) {
		super(id, titre, auteur, taken);
	}
	
	public String editeur = "Galimard";
	@SuppressWarnings("deprecation")
	public Date dateParution = new Date("01/15/2018");
	
	@Override
	public Object[] affiche() {
		return  new Object[]{
				titre,
				auteur,
				"taken",
				taken,
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