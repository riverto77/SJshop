package item.svc;

import item.dao.ItemDAO;
import item.vo.Item;

import static db.jdbcUtil1.*;

import java.sql.Connection;

public class ItemInsertService {

	public boolean insertItem(Item item) throws Exception {
		
		boolean insertItem = false;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		int insertCount = itemDAO.insertItem(item);
		
		if(insertCount > 0) {
			commit(con);
			insertItem = true;
		} else {
			rollback(con);
		}
		return insertItem;
	}
}
