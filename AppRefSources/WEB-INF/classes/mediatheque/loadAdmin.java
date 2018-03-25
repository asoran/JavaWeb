package mediatheque;

public class loadAdmin{

	// Class intermédiare servant à faire le lien client <-> mediatheque <-> persistantdata
	
	public static void main(String[] args) {
		load();
	}
	
	public static void load(){
		try {
			Class.forName("mediatheque.Mediatheque");
			// Ce class.forName() peut ne servir à rien
			// Car dans le code de MediathequeData on apelle Mediatheuqe
			// donc il éxécute le code du static{} à ce moment.
			// Mais on le laisse au cas ou
			Class.forName("persistantdata.MediathequeData");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static void unload(){
		// Dé-charger la classe ???
	}
}
