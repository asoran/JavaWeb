package mdr;

public class Pdf extends Doc {
	public Pdf(int id, String titre, String auteur, int taken) {
		super(id, titre, auteur, taken);
	}

	
	@Override
	public String getType(){
		return "pdf";
	}
}
