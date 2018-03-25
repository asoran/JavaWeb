package mediatheque;

public class Utilisateur {
	private int id;
	private String login;
	private String type;
	
	public Utilisateur(int id, String login, String type){
		this.id = id;
		this.login = login;
		this.type = type;
	}
	
	public String getNom(){
		return login;
	}
	
	public int getId(){
		return id;
	}
	
	public String getType(){
		return type;
	}
	
	// Test
	@Override
	public String toString() {
		return "Utilisateur [id=" + id + ", login=" + login + " type=" + type + "]";
	}
}
