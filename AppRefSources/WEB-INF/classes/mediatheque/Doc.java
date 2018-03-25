package mediatheque;

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
		if(taken == 0){ // un int peut pas être null :/
			taken = a.getId();
		}else{
			throw new EmpruntException();
		}
	}

	@Override
	public void retour() {
		taken = 0;
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
				"titre",
				titre,
				"auteur",
				auteur,
		};
	}

	public String getType(){
		return "doc";
	}

	// Pour des test
	@Override
	public String toString() {
		return "Doc [titre=" + titre + ", auteur=" + auteur + "]";
	}
	
	
}
