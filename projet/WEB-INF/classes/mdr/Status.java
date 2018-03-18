package mdr;

public class Status {

	static boolean status = false;
	
	public static boolean isOpen(){
		return status;
	}
	
	public static void setStatus(boolean s){
		status = s;
		
		try {
			Class.forName("persistantdata.MediathequeData");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
}
