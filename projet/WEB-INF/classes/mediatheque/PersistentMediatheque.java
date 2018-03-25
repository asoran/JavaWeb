package mediatheque;

import java.util.List;

public interface PersistentMediatheque {
// Jean-Fran�ois Brette 01/01/2018
	List<Document> tousLesDocuments();

	Document getDocument(int numDocument);

	Utilisateur getUser(String login, String password);
	
	void nouveauDocument(int type, Object... args );

	void emprunter(int id, int id2);

	void retour(int id);

	boolean isTaken(int id);
}