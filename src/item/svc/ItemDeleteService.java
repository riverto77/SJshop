package item.svc;

import static db.jdbcUtil1.close;
import static db.jdbcUtil1.commit;
import static db.jdbcUtil1.getConnection;
import static db.jdbcUtil1.rollback;

import java.sql.Connection;

import item.dao.ItemDAO;

public class ItemDeleteService {

public boolean deleteItem(String item_code) throws Exception {
		
		boolean deleteSuccess = false;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		int deleteCount = itemDAO.deleteItem(item_code);

		if (deleteCount > 0) {
			commit(con);
			deleteSuccess = true;
		} else {
			rollback(con);
		}

		close(con);
		return deleteSuccess;
	}
	
}
