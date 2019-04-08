package order.dao;

import static db.jdbcUtil1.close;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import item.vo.Item;
import item.vo.Stock;
import order.vo.Order;
import order.vo.OrderDetail;

public class OrderDAO {

	Connection con;
	private static OrderDAO orderDAO;

	private OrderDAO() {
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public static OrderDAO getInstance() {

		if (orderDAO == null) {
			orderDAO = new OrderDAO();
		}
		return orderDAO;
	}

	public int selectOrderNum() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int order_num = 1;
		String sql = "SELECT MAX(order_num) FROM orders";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				order_num = rs.getInt(1) + 1;
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			if (rs != null)
				close(rs);
			if (pstmt != null)
				close(pstmt);
		}
		return order_num;
	}
	
	// 오더 카운트
	
	public int orderListCount(String select, String search) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from item";
		if (!select.equals("")) {
			sql += " where item_name like '" + select + "%" + search + "%'";
		} 
		try {
			pstmt = con.prepareStatement(sql);
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
	
	// 주문 목록 가져오기
	
	public ArrayList<OrderDetail> orderList(int page, int limit, String select, String search) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from order_stock";
		if (!select.equals("")) {
			sql += " where "+select+" like '%"+search+"%' ";
		}
		
		sql += " order by date desc limit ?,?";
		
		System.out.println(sql);
		
		ArrayList<OrderDetail> orderList = new ArrayList<OrderDetail>();
		OrderDetail orderDetail = null;

		int startrow = (page - 1) * limit; // 읽기 시작할 row 번호

		try {
			pstmt = con.prepareStatement(sql);
			/* pstmt.setString(1, category); */
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				orderDetail = new OrderDetail();
				orderDetail.setItem_code(rs.getString("item_code"));
				orderDetail.setItem_name(rs.getString("item_name"));
				orderDetail.setId(rs.getString("id"));
				orderDetail.setdate(rs.getDate("date"));
				orderDetail.setAmount(rs.getInt("item_amount"));
				orderDetail.setOrder_num(rs.getInt("detail_num"));
				orderDetail.setPrice(rs.getInt("item_price"));
				orderDetail.setStock(Integer.parseInt(rs.getString("stock_amount")));
				
				orderList.add(orderDetail);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return orderList;
	}
	
	
	// 주문리스트에 담기
	
	public ArrayList<OrderDetail> de_order(String item_code, String item_name, int amount, int price, String item_image, String id, int stock) {
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		ArrayList<OrderDetail> orderList = new ArrayList<OrderDetail>();
		OrderDetail order = new OrderDetail();
		
		try {
			pstmt = con.prepareStatement("select * from order_detail");
			rs = pstmt.executeQuery();
			
			order.setItem_code(item_code);
			order.setItem_name(item_name);
			order.setAmount(amount);
			order.setPrice(price);
			order.setItem_image(item_image);
			order.setId(id);
			order.setStock(stock);
			
			orderList.add(order);
			
		} catch (Exception ex) {
			System.out.println("orderde 에러 : " + ex);
		} finally {
			close(pstmt);
		}
		return orderList;
	}
	
	// 내 주문 숫자
	
	public int myOrderListCount(String id) {
		int myOrderCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from order_stock where id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				myOrderCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("myOrderCount 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return myOrderCount;
	}

	// 내 주문 현황
	
	public ArrayList<OrderDetail> myOrderList(String id, int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	  
		ArrayList<OrderDetail> myOrderList = new ArrayList<OrderDetail>();
		OrderDetail myOrder = null;
		
		String sql = "select * from order_stock where id=? order by date desc limit ?,?";
		
		int startrow = (page - 1) * limit; // 읽기 시작할 row 번호
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, limit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				myOrder = new OrderDetail();
				
				myOrder.setId(rs.getString("id"));
				myOrder.setItem_code(rs.getString("item_code"));
				myOrder.setItem_name(rs.getString("item_name"));
				myOrder.setOrder_num(rs.getInt("detail_num"));
				myOrder.setPrice(rs.getInt("item_price"));
				myOrder.setItem_image(rs.getString("item_image"));
				myOrder.setAmount(rs.getInt("item_amount"));
				myOrder.setdate(rs.getDate("date"));
				myOrder.setStock(rs.getInt("stock_amount"));
				
				myOrderList.add(myOrder);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return myOrderList;
	}
	
	// 관리자 주문 현황 상세
	
		public OrderDetail OrderList(int detail_num) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		  
			OrderDetail OrderList = null;
			
			
			String sql = "select * from order_stock where detail_num=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, detail_num);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					OrderList = new OrderDetail();
					
					OrderList.setId(rs.getString("id"));
					OrderList.setItem_code(rs.getString("item_code"));
					OrderList.setItem_name(rs.getString("item_name"));
					OrderList.setOrder_num(rs.getInt("detail_num"));
					OrderList.setPrice(rs.getInt("item_price"));
					OrderList.setItem_image(rs.getString("item_image"));
					OrderList.setAmount(rs.getInt("item_amount"));
					OrderList.setdate(rs.getDate("date"));
					OrderList.setStock(rs.getInt("stock_amount"));
					
					;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return OrderList;
		}
	 

	public int OrderItem(ArrayList<OrderDetail> orderList) {
		int insertCount = 0;
		OrderDetail orderDetail = new OrderDetail();
		Item item = new Item();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "INSERT INTO order_detail(item_code, item_amount, item_name, item_price, item_image, id, date) VALUES(?,?,?,?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < orderList.size(); i++) {
				pstmt.setString(1, orderList.get(i).getItem_code());
				pstmt.setInt(2, orderList.get(i).getAmount());
				pstmt.setString(3, orderList.get(i).getItem_name());
				pstmt.setInt(4, orderList.get(i).getPrice());
				pstmt.setString(5, orderList.get(i).getItem_image());
				pstmt.setString(6, orderList.get(i).getId());
				pstmt.setDate(7, new Date(System.currentTimeMillis()));
				
				insertCount = pstmt.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				close(pstmt);
		}

		return insertCount;
	}

	// 주문 상세
	public Item orderDetail(String item_code) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from item where item_code=?";

		Item item = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item_code);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				item = new Item();
				item.setItem_code(rs.getString("item_code"));
				item.setItem_name(rs.getString("Item_name"));
				item.setItem_price(rs.getInt("Item_price"));
				item.setItem_company(rs.getString("Item_company"));
				item.setItem_stock(rs.getInt("Item_stock"));
				item.setCategory(rs.getString("category"));
				item.setItem_image(rs.getString("Item_image"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return item;
	}
	
	// 주문 삭제
	public int deleteOrder(int detail_num) {

		PreparedStatement pstmt = null;
		String sql = "delete from order_detail where detail_num=?";
		int deleteCount = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, detail_num);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("orderDelete 에러 : " + ex);
		} finally {
			close(pstmt);
		}

		return deleteCount;
	}

	// 상품 구매 출고
	
	public int orderBuy(Stock stock) {
		
		PreparedStatement pstmt = null;
		int stockCount = 0;
		
		String sql = "update stock set stock_amount=?, stock_date=? where item_code=?";
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stock.getStock_amount());
			pstmt.setDate(2, new Date(System.currentTimeMillis()));
			pstmt.setString(3, stock.getItem_code());
			
			stockCount = pstmt.executeUpdate();
			
			
		}  catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return stockCount;
	}
}
