package service;

import java.util.List;

import domain.Play;
import idao.*;

public class PlaySrv {
	private IPlayDAO stuDAO=DAOFactory.creatPlayDAO();
	//
	public int add(Play stu){
		return stuDAO.insert(stu); 		
	}
	
	public int modify(Play stu){
		return stuDAO.update(stu); 		
	}
	
	public int delete(int ID){
		return stuDAO.delete(ID); 		
	}
	
	public List<Play> Fetch(String condt){
		return stuDAO.select(condt);		
	}
	
	public List<Play> FetchAll(){
		return stuDAO.select("");		
	}
}
