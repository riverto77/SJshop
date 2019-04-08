package item.dao;

import static db.jdbcUtil1.close;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import item.vo.Item;
import item.vo.Stock;
import member.vo.MemberBean;

public class ItemDAO {

	Connection con;
	private static ItemDAO itemDAO;

	private ItemDAO() {
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public static ItemDAO getInstance() {

		if (itemDAO == null) {
			itemDAO = new ItemDAO();
		}
		return itemDAO;
	}

// 상품	
	// 목록 갯수 구하기
	public int selectListCount(String select, String search, String category) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from item where category=?";
		if (!select.equals("")) {
			sql += " && item_name like '" + select + "%" + search + "%'";
		}

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;
	}

	// 카테고리 목록 갯수 구하기
	public int selectcategoryListCount(String select, String search) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from item";
		if (!select.equals("")) {
			sql += " where category like '" + select + "'";
		}

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("categoryListCount 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;
	}

	// 셀렉트 목록구하기
	public ArrayList<Item> selectItemList(int page, int limit, String select, String search) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from item";
		if (!select.equals("")) {
			sql += " where category like '" + select + "'";
		}
		sql += " order by category asc limit ?,?";

		ArrayList<Item> itemList = new ArrayList<Item>();
		Item item = null;

		int startrow = (page - 1) * limit; // 읽기 시작할 row 번호

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				item = new Item();
				item.setItem_name(rs.getString("Item_name"));
				item.setItem_code(rs.getString("item_code"));
				item.setItem_price(rs.getInt("Item_price"));
				item.setItem_company(rs.getString("Item_company"));
				item.setCategory(rs.getString("category"));
				item.setItem_image(rs.getString("Item_image"));
				item.setComment1(rs.getString("comment1"));
				item.setComment2(rs.getString("comment2"));
				item.setComment3(rs.getString("comment3"));
				item.setItem_detail_image(rs.getString("item_detail_image"));
				itemList.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return itemList;
	}

	// 상품 목록구하기
	public ArrayList<Item> ItemList(int page, int limit, String select, String search, String category) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from item where category=?";
		if (!select.equals("")) {
			sql += " && item_name like '" + select + "%" + search + "%'";
		}

		sql += " order by item_code asc limit ?,?";

		ArrayList<Item> itemList = new ArrayList<Item>();
		Item item = null;

		int startrow = (page - 1) * limit; // 읽기 시작할 row 번호

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category); 
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, limit);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				item = new Item();
				item.setItem_name(rs.getString("Item_name"));
				item.setItem_code(rs.getString("item_code"));
				item.setItem_price(rs.getInt("Item_price"));
				item.setItem_company(rs.getString("Item_company"));
				item.setCategory(rs.getString("category"));
				item.setItem_image(rs.getString("Item_image"));
				item.setComment1(rs.getString("comment1"));
				item.setComment2(rs.getString("comment2"));
				item.setComment3(rs.getString("comment3"));
				item.setItem_detail_image(rs.getString("item_detail_image"));
				itemList.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return itemList;
	}

	// 아이템 이름 리스트
	public ArrayList<Item> ItemList(String item_code) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from item where item_code=?";

		ArrayList<Item> itemList = new ArrayList<Item>();
		Item item = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item_code);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				item = new Item();
				item.setItem_name(rs.getString("Item_name"));
				item.setItem_code(rs.getString("item_code"));
				item.setItem_price(rs.getInt("Item_price"));
				item.setItem_company(rs.getString("Item_company"));
				item.setCategory(rs.getString("category"));
				item.setItem_image(rs.getString("Item_image"));
				item.setComment1(rs.getString("comment1"));
				item.setComment2(rs.getString("comment2"));
				item.setComment3(rs.getString("comment3"));
				item.setItem_detail_image(rs.getString("item_detail_image"));
				itemList.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return itemList;
	}

	// 상품 상세
	public Item itemDetail(String item_code) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from stock left join item on stock.item_code=? && item.item_code=? where stock.item_code=?";

		Item item = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item_code);
			pstmt.setString(2, item_code);
			pstmt.setString(3, item_code);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				item = new Item();
				item.setItem_name(rs.getString("Item_name"));
				item.setItem_code(rs.getString("item_code"));
				item.setItem_price(rs.getInt("Item_price"));
				item.setItem_company(rs.getString("Item_company"));
				item.setCategory(rs.getString("category"));
				item.setItem_image(rs.getString("Item_image"));
				item.setComment1(rs.getString("comment1"));
				item.setComment2(rs.getString("comment2"));
				item.setComment3(rs.getString("comment3"));
				item.setItem_detail_image(rs.getString("item_detail_image"));
				item.setStock(Integer.parseInt(rs.getString("stock_amount")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return item;
	}

// 관리자 메뉴

	// 상품 등록
	public int insertItem(Item item) {

		PreparedStatement pstmt = null;
		int insertCount = 0;
		String sql = "";
		sql = "insert into item(item_name, item_code, item_price, item_company, category, comment1, comment2, comment3, item_image, item_detail_image)";
		sql += " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, item.getItem_name());
			pstmt.setString(2, item.getItem_code());
			pstmt.setInt(3, item.getItem_price());
			pstmt.setString(4, item.getItem_company());
			pstmt.setString(5, item.getCategory());
			pstmt.setString(6, item.getComment1());
			pstmt.setString(7, item.getComment2());
			pstmt.setString(8, item.getComment3());
			pstmt.setString(9, item.getItem_image());
			pstmt.setString(10, item.getItem_detail_image());

			insertCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("itemInsert 에러 : " + ex);
		} finally {
			close(pstmt);
		}

		return insertCount;
	}

	// 상품 상세정보
	public Item selectItem(String item_code) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Item itemDetail = null;
		String sql = "select * from item where item_code=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item_code);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				itemDetail = new Item();
				itemDetail.setItem_name(rs.getString("Item_name"));
				itemDetail.setItem_code(rs.getString("item_code"));
				itemDetail.setItem_price(rs.getInt("Item_price"));
				itemDetail.setItem_company(rs.getString("Item_company"));
				itemDetail.setCategory(rs.getString("category"));
				itemDetail.setItem_image(rs.getString("Item_image"));
				itemDetail.setComment1(rs.getString("comment1"));
				itemDetail.setComment2(rs.getString("comment2"));
				itemDetail.setComment3(rs.getString("comment3"));
				itemDetail.setItem_detail_image(rs.getString("item_detail_image"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return itemDetail;
	}

	// 상품 수정
	public int itemModify(Item item) {

		int modifyCount = 0;
		PreparedStatement pstmt = null;

		String sql = "";
		sql = "update item set item_code=?, item_price=?, item_company=?, category=?, comment1=?, comment2=?, comment3=?,"
				+ " item_image=?, item_detail_image=? where item_name=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item.getItem_code());
			pstmt.setInt(2, item.getItem_price());
			pstmt.setString(3, item.getItem_company());
			pstmt.setString(4, item.getCategory());
			pstmt.setString(5, item.getComment1());
			pstmt.setString(6, item.getComment2());
			pstmt.setString(7, item.getComment3());
			pstmt.setString(8, item.getItem_image());
			pstmt.setString(9, item.getItem_detail_image());
			pstmt.setString(10, item.getItem_name());

			modifyCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("itemModify 에러 : " + ex);
		} finally {
			close(pstmt);
		}
		return modifyCount;
	}

	// 아이템 삭제
	public int deleteItem(String item_code) {

		PreparedStatement pstmt = null;
		String sql = "delete from item where item_code=?";
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item_code);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Delete 에러 : " + ex);
		} finally {
			close(pstmt);
		}

		return deleteCount;
	}

	// 상품코드
	public String makeItemCode(String category) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String item_code = "";
		if (category.equals("cpu")) {
			item_code = "cpu";
		} else if (category.equals("mainboard")) {
			item_code = "mainboard";
		} else if (category.equals("vga")) {
			item_code = "vga";
		} else if (category.equals("memory")) {
			item_code = "memory";
		} else if (category.equals("ssd")) {
			item_code = "ssd";
		} else if (category.equals("power")) {
			item_code = "power";
		} else if (category.equals("case")) {
			item_code = "case";
		}

		try {
			pstmt = con.prepareStatement("SELECT item_code FROM item WHERE category = ? ORDER BY item_code ASC");
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			ArrayList<Integer> arry = new ArrayList<Integer>();
			boolean flag = false;
			while (rs.next()) {
				if(category.equals("mainboard")) {
					arry.add(Integer.parseInt(rs.getString("item_code").substring(9))); 
				} else if (category.equals("memory")) {
					 arry.add(Integer.parseInt(rs.getString("item_code").substring(6))); 
				} else if (category.equals("power")) {
					arry.add(Integer.parseInt(rs.getString("item_code").substring(5)));
				} else if (category.equals("case")) {
					arry.add(Integer.parseInt(rs.getString("item_code").substring(4)));
				} else {
				 arry.add(Integer.parseInt(rs.getString("item_code").substring(3)));
				}
			}
			if (arry.size() > 0) {
				for (int i = 1; i <= arry.get(arry.size() - 1); i++) {
					for (int j = i - 1; j < arry.size(); j++) {
						if (i == arry.get(j)) {
							break;
						} else if (i != arry.get(j)) {
							flag = true;
							break;
						}
					}
					if (i == arry.get(arry.size() - 1)) {
						item_code = item_code + String.format("%03d", i + 1);
					} else {
						if (flag) {
							item_code = item_code + String.format("%03d", i);
							break;
						}
					}
				}
			} else {
				item_code += "001";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return item_code;
	}

}
