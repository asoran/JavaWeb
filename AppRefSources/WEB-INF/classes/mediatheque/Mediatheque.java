package mediatheque;

import java.util.List;

/**
 cette classe repr�sente la mediatheque du point de vue du domaine
 cette classe est un singleton
 elle a un attribut qui fait le lien avec les donn�es persistentes
 
 LES SERVLETS DOIVENT S'ADRESSER A CETTE CLASSE EXCLUSIVEMENT
 POUR INTERROGER LES DONNEES

 beaucoup des m�thodes de Mediatheque sont d�l�gu�es � l'attribut de persistance
 qui devra r�percuter ces op�rations sur les donn�es persistantes

*/
public class Mediatheque {
// Jean-Fran�ois Brette 01/01/2018

// singleton standard ======================== 
	static {
		instance = new Mediatheque();
	}
	
	private static Mediatheque instance;
	public static Mediatheque getInstance() {
		return instance;
	}
	private Mediatheque () {}
// fin - singleton standard ==================

// lien avec les donn�es persistantes +++++++++++++++
	private PersistentMediatheque data;

	public PersistentMediatheque getData(){
		return data;
	}
	
	public void setData(PersistentMediatheque data) {
		if (this.data == null) this.data = data;
	}
// fin - lien avec les donn�es persistantes +++++++++

// ********** action sur le document ***********************

	// enregistre l'emprunt par l'abonné a du document d
	public void emprunt(Document d, Utilisateur a) throws EmpruntException {
		synchronized (d) {
			if(isTaken(d)){
				throw new EmpruntException();
			}else{
				d.emprunter(a); // Ne fait rien "activement", ça modifie l'objet mais pas la BDD
				data.emprunter(((Doc)d).getId(), a.getId());
			}
		}
	}

	// true si le document est déjà emprunté
	public boolean isTaken(Document d){
		synchronized (d) {
			return data.isTaken(((Doc)d).getId());
		}
	}
	
	//enregistre le retour du document d
	public void retour (Document d) {
		synchronized (d) {
			d.retour(); // Ne fait rien "activement", ça modifie l'objet mais pas la BDD
			data.retour(((Doc)d).getId());
		}
	}

// *********************** délégation **********************

	// renvoie la liste de tous les documents de la bibliothèque

	public List<Document> tousLesDocuments() {
		return data.tousLesDocuments();
	}

	// renvoie le user de login et passwd 
	// si pas trouvé, renvoie null
	
	public Utilisateur getUser (String login, String password) {
		return data.getUser(login, password);
	}

	// renvoie le document de num�ro numDocument
	// si pas trouv�, renvoie null

	public Document getDocument(int numDocument) {
		return data.getDocument(numDocument);
	}
	
	// ajoute un nouveau document

	public void nouveauDocument(int type, Object... args ) {
		data.nouveauDocument(type, args);
	};

}
