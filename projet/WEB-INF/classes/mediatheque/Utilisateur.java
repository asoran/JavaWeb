package mediatheque;

public class Utilisateur {
	private int id;
	private String prenom;
	private String nom;
	private String type;
	
	public Utilisateur(int id, String nom, String prenom, String type){
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.type = type;
	}
	
	public String getNom(){
		return nom;
	}
	
	public int getId(){
		return id;
	}
	
	public String getType(){
		return type;
	}
	
	@Override
	public String toString() {
		return "Utilisateur [id=" + id + ", prenom=" + prenom + ", nom=" + nom + ", type=" + type + "]";
	}
}
