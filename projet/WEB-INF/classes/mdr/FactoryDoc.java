package mdr;
import java.sql.ResultSet;
import java.sql.SQLException;

import mediatheque.Document;

public class FactoryDoc {

	public static Document creeDoc(ResultSet d, String t) throws SQLException{
		switch(t){
		case "livre":
			return new Livre(d.getString("titre"), d.getString("auteur"));
		case "cd":
			return new Cd(d.getString("titre"), d.getString("auteur"));
		case "pdf":
			return new Pdf(d.getString("titre"), d.getString("auteur"));
		default:
			return new Livre("null", "null");
		}
	}
	
}
