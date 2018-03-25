package mediatheque;

public class Status {
	// Class permettant de savoir si le serveur est allumé, ou non
	
	static boolean status = false;
	
	public static boolean isOpen(){
		return status;
	}
	
	public static void setStatus(boolean s){
		status = s;
		if(s){
			loadAdmin.load();
		}else{
			loadAdmin.unload();
		}
	}
}
