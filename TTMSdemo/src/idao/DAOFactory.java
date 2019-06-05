package idao;
import dao.*;
public class DAOFactory {
	
	public static IStudioDAO creatStudioDAO(){
		return new StudioDAO();
	}
	public static IUserDAO creatUserDAO(){
		return new UserDAO();
	}
}
