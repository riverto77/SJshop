package item.svc;

import item.dao.ItemDAO;
import static db.jdbcUtil1.*;

import java.sql.Connection;

public class ItemCodeCreateService {

	public String makeItemCode(String category) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection con = getConnection();
		itemDAO.setConnection(con);
		String item_code = itemDAO.makeItemCode(category);
		
		close(con);
		return item_code;
	}
}
