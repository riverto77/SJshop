package item.svc;

import static db.jdbcUtil1.*;
import java.sql.Connection;
import java.util.ArrayList;

import item.dao.ItemDAO;
import item.dao.StockDAO;
import item.vo.Item;
import item.vo.Stock;

public class ItemStockService {

	public boolean getStock(Stock stock) {
		StockDAO stockDAO = StockDAO.getInstance();
		Connection con = getConnection();
		stockDAO.setConnection(con);
		boolean insertStock = false;
		int stockCount = stockDAO.insertStock(stock);
		
		if(stockCount > 0) {
			commit(con);
			insertStock = true;
		} else {
			rollback(con);
		}
		close(con);
		return insertStock;
	}
	
	//재고현황 카운트
	public int stockListCount(String select, String search) throws Exception {
		int stockCount = 0;
		StockDAO stockDAO = StockDAO.getInstance();
		Connection con = getConnection();
		stockDAO.setConnection(con);
		stockCount = stockDAO.stockListCount(select, search);
		close(con);
		return stockCount;
	}
	
	public ArrayList<Stock> stockList(String item_code) {
		StockDAO stockDAO = StockDAO.getInstance();
		Connection con = getConnection();
		stockDAO.setConnection(con);
		ArrayList<Stock> stock = stockDAO.stockList(item_code);
		close(con);
		
		return stock;
	}
	
	public boolean stockState(Stock stock) {
		StockDAO stockDAO = StockDAO.getInstance();
		Connection con = getConnection();
		stockDAO.setConnection(con);
		boolean stockadd = false;
		int stockAddCount = stockDAO.stockState(stock);
		
		System.out.println(stockAddCount);
		
		if(stockAddCount > 0) {
			commit(con);
			stockadd = true;
		} else {
			rollback(con);
		}
		close(con);
		return stockadd;
	}
	
	public boolean stockreplace(Stock stock) {
		StockDAO stockDAO = StockDAO.getInstance();
		Connection con = getConnection();
		stockDAO.setConnection(con);
		boolean stockre = false;
		int stockreCount = stockDAO.stockreplace(stock);
			
		if(stockreCount > 0) {
			commit(con);
			stockre = true;
		} else {
			rollback(con);
		}
		close(con);
		return stockre;
	}
}
