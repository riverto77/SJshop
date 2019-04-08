package item.svc;

import static db.jdbcUtil1.*;

import java.sql.Connection;

import item.dao.ItemDAO;
import item.vo.Item;

public class ItemDetailService {

	public Item getDetailService(String item_code) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection con = getConnection();
		itemDAO.setConnection(con);
		Item detail = itemDAO.itemDetail(item_code);
		close(con);
		
		return detail;
	}
}
