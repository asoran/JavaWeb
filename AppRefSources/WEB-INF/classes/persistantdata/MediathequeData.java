package persistantdata;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import mediatheque.*;

// classe mono-instance  dont l'unique instance n'est connue que de la bibliotheque
// via une auto-déclaration dans son bloc static

public class MediathequeData implements PersistentMediatheque {
	
// Jean-Franéois Brette 01/01/2018
	private static Connection conn;
	
	static {
		Mediatheque.getInstance().setData(new MediathequeData());
		ResourceBundle b = ResourceBundle.getBundle("properties.mySql");
		
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
	
	// renvoie la liste de tous les documents de la bibliothéque
	@Override
	public List<Document> tousLesDocuments() {
		List<Document> a = new ArrayList<Document>();
		try {
			// Création de la requete
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
					a.add(doc.FactoryDoc.creeDoc(res2, type));
				}
				
				res2.close();
				st2.close();
			}
			
			res.close();
			st.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return a;
	}

	// va récupérer le User dans la BD et le renvoie
	// si pas trouvé, renvoie null;
	@Override
	public Utilisateur getUser(String login, String password) {
		Utilisateur u = null;
		try{
			// Création de la requete
			String req = "SELECT * FROM users WHERE login = ? AND mdp = ?";
			PreparedStatement st = conn.prepareStatement(req);
			
			// On prépare les paramétres
			st.setString(1, login);
			st.setString(2, password);
			
			// Envoie de la requete au serveur
			ResultSet res = st.executeQuery();

			if(res.next()){
				u = new Utilisateur(res.getInt("idUser"), res.getString("login"), res.getString("typeUser"));
			}
			
			res.close();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return u;
	}

	// va récupérer le document de numéro numDocument dans la BD
	// et le renvoie
	// si pas trouvé, renvoie null
	@Override
	public Document getDocument(int numDocument) {
		Document a = null;
		
		try {
			// Création de la requete
			String req = "SELECT * FROM docs WHERE idDoc = ?";
			PreparedStatement st = conn.prepareStatement(req);
			st.setInt(1, numDocument);
			// Envoie de la requete au serveur
			ResultSet res = st.executeQuery();
			
			if(res.next()){
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
				
				String req2 = "SELECT * FROM " + type + " x, docs d "
						+ "WHERE x.IDDOCC = ? "
						+ "AND d.idRef = ? "
						+ "AND d.typeDoc = ?";
				PreparedStatement st2 = conn.prepareStatement(req2);
				
				st2.setInt(1, res.getInt("idRef"));
				st2.setInt(2, res.getInt("idRef"));
				st2.setInt(3, res.getInt("typeDoc"));
				
				ResultSet res2 = st2.executeQuery();
				if(res2.next()){
					a = doc.FactoryDoc.creeDoc(res2, type);
				}
				
				res2.close();
				st2.close();
			}
			
			res.close();
			st.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return a;
	}

	@Override
	public void nouveauDocument(int type, Object... args) {
		// args[0] -> le titre
		// args [1] --> l'auteur
		// etc...
		try {
			String req, req2;
			PreparedStatement st;
			ResultSet rs;
			int idDocc;
			
			switch(type){
			case 1:
				req = "INSERT INTO livre(dateParution, editeur, genre) VALUES (?, ?, ?);";
				st = conn.prepareStatement(req, Statement.RETURN_GENERATED_KEYS);
				st.setString(1, (String) args[2]);
				st.setString(2, (String) args[3]);
				st.setString(3, (String) args[4]);
				st.executeUpdate();
				
				rs = st.getGeneratedKeys();
				
				if(rs.next()) {
					System.out.println("mdr");
					idDocc = rs.getInt(1);
					req2 = "INSERT INTO docs(typeDoc, titre, auteur, taken, idRef) VALUES (?, ?, ?, ?, ?);";
					PreparedStatement st2 = conn.prepareStatement(req2);
					st2.setInt(1, 1);
					st2.setString(2, (String) args[0]);
					st2.setString(3, (String) args[1]);
					st2.setNull(4, java.sql.Types.INTEGER);
					st2.setInt(5, idDocc);
					st2.executeUpdate();
					
					st2.close();
				}
				rs.close();
				st.close();
				break;
			case 2:
				req = "INSERT INTO cd(longueur, quality) VALUES (?, ?);";
				st = conn.prepareStatement(req, Statement.RETURN_GENERATED_KEYS);
				st.setInt(1, (Integer) args[2]);
				st.setString(2, (String) args[3]);
				st.executeUpdate();
				
				rs = st.getGeneratedKeys();
				
				if(rs.next()) {
					idDocc = rs.getInt(1);
					req2 = "INSERT INTO docs(typeDoc, titre, auteur, taken, idRef) VALUES (?, ?, ?, ?, ?);";
					PreparedStatement st2 = conn.prepareStatement(req2);
					st2.setInt(1, 2);
					st2.setString(2, (String) args[0]);
					st2.setString(3, (String) args[1]);
					st2.setNull(4, java.sql.Types.INTEGER);
					st2.setInt(5, idDocc);
					st2.executeUpdate();
					
					st2.close();
				}
				st.close();
				rs.close();
				break;
			case 3:
				req = "INSERT INTO pdf(taille) VALUES (?);";
				st = conn.prepareStatement(req);
				st.setInt(1, (Integer) args[2]);
				st.executeUpdate();
				
				rs = st.getGeneratedKeys();
				
				if(rs.next()) {
					idDocc = rs.getInt(1);
					req2 = "INSERT INTO docs(typeDoc, titre, auteur, taken, idRef) VALUES (?, ?, ?, ?, ?);";
					PreparedStatement st2 = conn.prepareStatement(req2);
					st2.setInt(1, 3);
					st2.setString(2, (String) args[0]);
					st2.setString(3, (String) args[1]);
					st2.setNull(4, java.sql.Types.INTEGER);
					st2.setInt(5, idDocc);
					st2.executeUpdate();
					
					st2.close();
				}
				st.close();
				rs.close();
				break;
			default:
				throw new SQLException("Erreur nouveauDoc");
			}

				
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}

	// NOUVEAU :
	
	@Override
	public void emprunter(int idDoc, int idUser) {
		try{
			String req = "UPDATE docs SET taken = ? WHERE idDoc = ?;";
			PreparedStatement st = conn.prepareStatement(req);
			st.setInt(1, idUser);
			st.setInt(2, idDoc);
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	@Override
	public void retour(int idDoc) {
		try{
			String req = "UPDATE docs SET taken = NULL WHERE idDoc = ?;";
			PreparedStatement st = conn.prepareStatement(req);
			st.setInt(1, idDoc);
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	// isTaken = true <=> Le livre est emprunté
	// Par défaut renvoie true, comme ça le doc ne peut pas être emprunté
	@Override
	public boolean isTaken(int idDoc){
		boolean b = true;
		try{
			String req = "SELECT taken FROM docs WHERE idDoc = ?;";
			PreparedStatement st = conn.prepareStatement(req);
			st.setInt(1, idDoc);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()){
				int t = rs.getInt(1);
				System.out.println(t);
				b = rs.wasNull() ? false : true;
				System.out.println(rs.wasNull());
			}
			
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return b;
	}
	
}