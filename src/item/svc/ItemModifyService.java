package item.svc;

import java.sql.Connection;
import static db.jdbcUtil1.*;

import item.dao.ItemDAO;
import item.vo.Item;

public class ItemModifyService {

public boolean modifyitem(Item item) throws Exception {
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		int modifyCount = itemDAO.itemModify(item);
		
		if(modifyCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}

		close(con);
		return isModifySuccess;
	}
}
