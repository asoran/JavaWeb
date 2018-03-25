package mdr;
import java.sql.ResultSet;
import java.sql.SQLException;

import mediatheque.Document;

public class FactoryDoc {

	public static Document creeDoc(ResultSet d, String t) throws SQLException{
		switch(t){
		case "livre":
			return new Livre(d.getInt("idDoc"), d.getString("titre"), d.getString("auteur"), d.getInt("taken"));
		case "cd":
			return new Cd(d.getInt("idDoc"), d.getString("titre"), d.getString("auteur"), d.getInt("taken"));
		case "pdf":
			return new Pdf(d.getInt("idDoc"), d.getString("titre"), d.getString("auteur"), d.getInt("taken"));
		default:
			return new Livre(-1, "null", "null", 0);
		}
	}
	
}
