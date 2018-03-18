package admain;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/loadAdmin")
public class loadAdmin extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		try {
			Class.forName("mediatheque.Mediatheque");
			Class.forName("pesistantdata.MediathequeData");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		try {
			Class.forName("mediatheque.Mediatheque");
			Class.forName("pesistantdata.MediathequeData");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
