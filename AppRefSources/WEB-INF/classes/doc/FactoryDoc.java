package doc;
import java.sql.ResultSet;
import java.sql.SQLException;

import mediatheque.Document;

public class FactoryDoc {

	public static Document creeDoc(ResultSet d, String t) throws SQLException{
		switch(t){
		case "livre":
			return new Livre(d.getInt("idDoc"), d.getString("titre"), d.getString("auteur"), d.getInt("taken"), d.getString("dateParution"), d.getString("editeur"), d.getString("genre"));
		case "cd":
			return new Cd(d.getInt("idDoc"), d.getString("titre"), d.getString("auteur"), d.getInt("taken"), d.getInt("longueur"), d.getString("quality"));
		case "pdf":
			return new Pdf(d.getInt("idDoc"), d.getString("titre"), d.getString("auteur"), d.getInt("taken"),  d.getInt("taille"));
		default:
			throw new SQLException("TYPE INEXISTANT OU NON CONFORME");
		}
	}
	
}
