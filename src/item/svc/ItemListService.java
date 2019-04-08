package item.svc;

import java.sql.Connection;
import java.util.ArrayList;

import static db.jdbcUtil1.*;
import item.dao.ItemDAO;
import item.vo.Item;

public class ItemListService {

	//목록 갯수
	public int getListCount(String select, String search, String category) throws Exception {
		int listCount = 0;
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection con = getConnection();
		itemDAO.setConnection(con);
		listCount = itemDAO.selectListCount(select, search, category);
		close(con);
		return listCount;
	}
	
	//카테고리로 목록 갯수 찾기
	public int getcategoryCount(String select, String search) throws Exception {
		int listCount = 0;
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection con = getConnection();
		itemDAO.setConnection(con);
		listCount = itemDAO.selectcategoryListCount(select, search);
		close(con);
		return listCount;
	}
	
	//아이템 이름 목록
	public ArrayList<Item> ItemList(String item_code) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection con = getConnection();
		itemDAO.setConnection(con);
		ArrayList<Item> itemList = itemDAO.ItemList(item_code);
		close(con);

		return itemList;
	}

	// 셀렉트 박스로 목록 띄우는것
	public ArrayList<Item> getItemList(int page, int limit, String select, String search) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection con = getConnection();
		itemDAO.setConnection(con);
		ArrayList<Item> itemList = itemDAO.selectItemList(page, limit, select, search);
		close(con);

		return itemList;
	}
	
	// 상품 목록
	public ArrayList<Item> getCategoryItemList(int page, int limit, String select, String search, String category) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection con = getConnection();
		itemDAO.setConnection(con);
		ArrayList<Item> ItemList = itemDAO.ItemList(page, limit, select, search, category);
		close(con);

		return ItemList;
	}

	//상품 상세
	public Item getitem(String item_code) {
		ItemDAO itemDAO = ItemDAO.getInstance();
		Connection con = getConnection();
		itemDAO.setConnection(con);
		Item itemDetail = itemDAO.selectItem(item_code);
		close(con);

		return itemDetail;
	}

}
