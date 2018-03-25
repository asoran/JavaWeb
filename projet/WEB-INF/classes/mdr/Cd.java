package mdr;

public class Cd extends Doc {

	public Cd(int id, String titre, String auteur, int taken) {
		super(id, titre, auteur, taken);
	}

	

	@Override
	public String getType(){
		return "cd";
	}
	
}
