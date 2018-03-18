package mdr;

public class Cd extends Doc {

	public Cd(String titre, String auteur) {
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
		return "cd";
	}
	
}
