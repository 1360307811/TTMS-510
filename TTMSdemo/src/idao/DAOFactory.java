package idao;
import dao.*;
public class DAOFactory {
	
	public static IStudioDAO creatStudioDAO(){
		return new StudioDAO();
	}
	public static IPlayDAO creatPlayDAO(){
		return new PlayDAO();
	}
	public static TicketDAO creatTictetDAO(){
		return new TicketDAO();
	}
}
