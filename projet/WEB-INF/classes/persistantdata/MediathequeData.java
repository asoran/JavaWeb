package persistantdata;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import mdr.Livre;
import mediatheque.*;

// classe mono-instance  dont l'unique instance n'est connue que de la bibliotheque
// via une auto-d�claration dans son bloc static

public class MediathequeData implements PersistentMediatheque {
	
// Jean-Fran�ois Brette 01/01/2018
	private static Connection conn;
	
	static {
		Mediatheque.getInstance().setData(new MediathequeData());
		ResourceBundle b = ResourceBundle.getBundle("properties.sql");
		
		String driver = b.getString("driver");
		
		try {
			Class.forName(driver);
			
			String URL = b.getString("url");
			String user = b.getString("user");;
			String psw = b.getString("psw");;
			System.out.println(URL + user + psw);
			
			conn = DriverManager.getConnection(URL, user, "");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	
	
	private MediathequeData() {
		
	}

	public static void main(String[] args) {
		MediathequeData a = new MediathequeData();
		
		List<Document> b = a.tousLesDocuments();
		System.out.println(b);
		for(Document c : b){
			System.out.println(c.toString());
		}
		
	}
	
	// renvoie la liste de tous les documents de la biblioth�que
	@Override
	public List<Document> tousLesDocuments() {
		List<Document> a = new ArrayList<Document>();
		try {
			// Cr�ation de la requete
			String req = "SELECT * FROM docs";
			PreparedStatement st = conn.prepareStatement(req);
			
			// Envoie de la requete au serveur
			ResultSet res = st.executeQuery();
			
			while(res.next()){
				String type;
				
				switch(res.getInt("typeDoc")){
				case 1:
					type = "livre";
					break;
				case 2:
					type = "cd";
					break;
				case 3:
					type = "pdf";
					break;
				default:
					type = "";
					break;
				}
				int idRef = res.getInt("idRef");
				
				String req2 = "SELECT * FROM " + type + " x, docs d "
						+ "WHERE x.IDDOCC = ? "
						+ "AND d.idRef = ? "
						+ "AND d.typeDoc = ?";
				PreparedStatement st2 = conn.prepareStatement(req2);
				
				st2.setInt(1, res.getInt("idRef"));
				st2.setInt(2, res.getInt("idRef"));
				st2.setInt(3, res.getInt("typeDoc"));
				
				ResultSet res2 = st2.executeQuery();
				while(res2.next()){
						a.add(mdr.FactoryDoc.creeDoc(res2, type));
				}
				
				res2.close();
				st2.close();
			}
			
			res.close();
			st.close();
			
			return a;
		}catch (SQLException e) {
			e.printStackTrace();
			a.add(new Livre("Failed : ", e.getLocalizedMessage()));
			
			return a;
		}
	}

	// va r�cup�rer le User dans la BD et le renvoie<<
	// si pas trouv�, renvoie null
	@Override
	public Utilisateur getUser(String login, String password) {
		Utilisateur u = new Utilisateur(1, "b", "c", "d");
		try{
			// Cr�ation de la requete
			String req = "SELECT * FROM users WHERE login = ? AND mdp = ?";
			PreparedStatement st = conn.prepareStatement(req);
			
			// On pr�pare les param�tres
			st.setString(1, login);
			st.setString(2, password);
			
			// Envoie de la requete au serveur
			ResultSet res = st.executeQuery();

			while(res.next()){
				u = new Utilisateur(res.getInt("idUser"), "Altan", res.getString("login"), res.getString("typeUser"));
			}
			
			res.close();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return u;
	}

	// va r�cup�rer le document de num�ro numDocument dans la BD
	// et le renvoie
	// si pas trouv�, renvoie null
	@Override
	public Document getDocument(int numDocument) {
		return null;
	}

	@Override
	public void nouveauDocument(int type, Object... args) {
		// args[0] -> le titre
		// args [1] --> l'auteur
		// etc...
	}

}
