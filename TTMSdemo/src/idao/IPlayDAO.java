/**
 * 
 */
package idao;
import domain.*;

import java.util.List;

import domain.Play;

/**
 * @author Administrator
 *
 */
public interface IPlayDAO {
	public int insert(Play stu);
	public int update(Play stu);
	public int delete(int ID);
	public List<Play> select(String condt); 
}