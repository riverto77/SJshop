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

public class StockDAO {

	Connection con;
	private static StockDAO stockDAO;

	private StockDAO() {
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public static StockDAO getInstance() {

		if (stockDAO == null) {
			stockDAO = new StockDAO();
		}
		return stockDAO;
	}

	//재고 등록
	public int insertStock(Stock stock) {
		PreparedStatement pstmt = null;
		int stockCount = 0;
		int stock_num = 0;
		String sql = "";
		sql =  "insert into stock(item_code, item_name, stock_amount, stock_date) values(?,?,?,?)";

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, stock.getItem_code());
			pstmt.setString(2, stock.getItem_name());
			pstmt.setInt(3, stock.getStock_amount());
			pstmt.setDate(4, stock.getStock_date());
			
			stockCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("stockInsert 에러 : " + ex);
		} finally {
			close(pstmt);
		}

		return stockCount;
	}
	
	//재고현황 카운트
	
	public int stockListCount(String select, String search) {
		int stockCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from order_detail left join stock on order_detail.item_code = stock.item_code";
		if (!select.equals("")) {
			sql += " where order_detail."+select+" like '%"+search+"%' ";
		}
		
		System.out.println(sql);

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				stockCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("stockListCount 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return stockCount;
	}
	
	// 상품재고 리스트

	public ArrayList<Stock> stockList(String item_code) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Stock stock = null;
		ArrayList<Stock> stockList = new ArrayList<Stock>();
		String sql = "select * from order_detail left join stock on order_detail.item_code = stock.item_code";
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					stock = new Stock();
					stock.setItem_code(rs.getString("item_code"));
					stock.setStock_num(rs.getInt("stock_num"));
					stock.setItem_name(rs.getString("item_name"));
					stock.setStock_amount(rs.getInt("stock_amount"));
					stock.setStock_date(rs.getDate("date"));
					stock.setStock_state(rs.getInt("item_amount"));
					stock.setId(rs.getString("id"));
					
					stockList.add(stock);
					
				} while (rs.next());
			}
		} catch (Exception ex) {
			System.out.println("stockList 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return stockList;
	}
	
	//상품 입고, 출고
	
	public int stockState(Stock stock) {
		
		int stockAddCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update stock set stock_amount=?, stock_date=? where item_code=?";
	
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stock.getStock_amount());
			pstmt.setDate(2, stock.getStock_date());
			pstmt.setString(3, stock.getItem_code());
			
			stockAddCount = pstmt.executeUpdate();
			
		} catch (Exception ex) {
			System.out.println("StockAdd 에러 : " + ex);
		} finally {
			close(pstmt);
		}
		return stockAddCount;
	}
	
	//주문취소 재고량 반환
	public int stockreplace(Stock stock) {
		
		int stockreCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update stock set stock_amount=? where item_code=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stock.getStock_amount());
			pstmt.setString(2, stock.getItem_code());
			
			stockreCount = pstmt.executeUpdate();
			
		} catch (Exception ex) {
			System.out.println("Stockreplace 에러 : " + ex);
		} finally {
			close(pstmt);
		}
		return stockreCount;
	}
	
}
