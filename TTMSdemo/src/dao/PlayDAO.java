package dao;

import java.util.LinkedList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.SQLException;

import domain.Play;
import idao.IPlayDAO;
import util.DBUtil;

public class PlayDAO implements IPlayDAO {
	@Override
	public int insert(Play stu) {
		try {
			String sql = "insert into play(play_id, play_type_id, play_lang_id, play_name, play_introduction, play_image, play_length, play_ticket_price, play_status )"
					+ " values("
					+stu.getId()
					+ " , "+stu.getTypeId()
					+ ", " + stu.getLangId()
					+ ", '" + stu.getName()
					+"' , '"+stu.getIntroduction()
					+"' , "+stu.getImage()
					+" , "+stu.getLength()
					+" , "+stu.getTicketPrice()
					+" , "+stu.getStatus()
					+ "' )";
			DBUtil db = new DBUtil();
			ResultSet rst = db.getInsertObjectIDs(sql);
			if (rst!=null && rst.first()) {
				stu.setId(rst.getInt(1));
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int update(Play stu) {

		String sql = "update Play set " 
		+" play_id = " + stu.getId() +","
		+" play_type_id = " + stu.getTypeId()+","
		+" play_lang_id = " + stu.getLangId()+","
		+" play_name = '" + stu.getName()+"',"
		+" play_introduction = '"+stu.getIntroduction()+"',"
		+" play_image = "+stu.getImage()+","
		+" play_length =  "+stu.getLength()+","
		+" play_ticket_price = "+stu.getTicketPrice()+","
		+" play_status = "+stu.getStatus();

		sql += " where play_id = " + stu.getId();

		DBUtil db = new DBUtil();

		return db.execCommand(sql);

	}

	@Override
	public int delete(int ID) {
		String sql = "delete from  play ";
		sql += " where play_id = " + ID;
		DBUtil db = new DBUtil();
		return db.execCommand(sql);
	}

	@Override
	public List<Play> select(String condt) {
		List<Play> stuList = null;
		stuList=new LinkedList<Play>();
		try {
			String sql = "select play_id, play_type_id, play_lang_id, play_name, play_introduction, play_image, play_length, play_ticket_price, play_status from play ";
			//删除两端的空格
			condt.trim();
			if(!condt.isEmpty())
				sql+= " where " + condt;
			DBUtil db = new DBUtil();
			ResultSet rst = db.execQuery(sql);
			//System.out.print("sql:"+sql);
			if (rst!=null) {
				while(rst.next()){
					Play stu=new Play();
					
					stu.setId(rst.getInt("play_id"));
					stu.setTypeId(rst.getInt("play_type_id"));
					stu.setLangId(rst.getInt("play_lang_id"));
					//************************************************
					stu.setName(rst.getString("play_name"));
					stu.setIntroduction(rst.getString("play_introduction"));
					stu.setImage((int[]) rst.getObject("play_image"));
					stu.setLength(rst.getInt("play_length"));
					stu.setTicketPrice(rst.getFloat("play_ticket_price"));
					stu.setStatus(rst.getInt("play_status"));
					stuList.add(stu);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return stuList;
	}
}
