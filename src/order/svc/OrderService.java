package order.svc;

import static db.jdbcUtil1.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cart.vo.Cart;
import item.dao.ItemDAO;
import item.vo.Item;
import item.vo.Stock;
import member.dao.MemberDAO;
import order.dao.OrderDAO;
import order.vo.OrderDetail;

public class OrderService {

	public int getOrderListCount(String select, String search) throws Exception {
		int orderlistCount = 0;
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection con = getConnection();
		orderDAO.setConnection(con);
		orderlistCount = orderDAO.orderListCount(select, search);
		close(con);
		return orderlistCount;
	}
	
	public ArrayList<OrderDetail> getOrderListAll(int page, int limit, String select, String search) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection con = getConnection();
		orderDAO.setConnection(con);
		ArrayList<OrderDetail> orderList = orderDAO.orderList(page, limit, select, search);
		close(con);

		return orderList;
	}
	
	public Item Order(String item_code) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection con = getConnection();
		orderDAO.setConnection(con);
		Item order = orderDAO.orderDetail(item_code);
		close(con);
		
		return order;
	}
	
	public boolean orderitem(ArrayList<OrderDetail> orderList) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection con = getConnection();
		orderDAO.setConnection(con);
		boolean isRegistSuccess = false;
		int insertCount = orderDAO.OrderItem(orderList);
		
		if(insertCount>0) {
			commit(con);
			isRegistSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		return isRegistSuccess;
	}
	
	public int selectOrderNum() {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection con = getConnection();
		orderDAO.setConnection(con);
		int order_num = orderDAO.selectOrderNum();
		close(con);
		
		return order_num;
	}
	
	//내 주문 목록 보기
	
	public ArrayList<OrderDetail> myOrder(String id, int page, int limit) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection con = getConnection();
		orderDAO.setConnection(con);
		ArrayList<OrderDetail> myOrder = orderDAO.myOrderList(id, page, limit);
		close(con);
		
		return myOrder;
	}
	
	// 내 주문 목록 숫자
	
	public int getMyOrderCount(String id) throws Exception {
		int MyOrderCount = 0;
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection con = getConnection();
		orderDAO.setConnection(con);
		MyOrderCount = orderDAO.myOrderListCount(id);
		close(con);
		return MyOrderCount;
	}
	
	public OrderDetail orderList(int detail_num) {
		OrderDetail orderList = new OrderDetail();
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection con = getConnection();
		orderDAO.setConnection(con);
		orderList = orderDAO.OrderList(detail_num);
		close(con);
		
		return orderList;
	}
	
	//상품상세에서 오더페이지로
	public ArrayList<OrderDetail> de_order(String item_code, String item_name, int amount, int price, String item_image, String id, int stock) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection con = getConnection();
		orderDAO.setConnection(con);
		ArrayList<OrderDetail> orderList = new ArrayList<OrderDetail>();
		orderList = orderDAO.de_order(item_code, item_name, amount, price, item_image, id, stock);
		close(con);
		
		return orderList;	
	}
	
	//상품구매 재고-1
	public boolean orderBuy(Stock stock) {
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection con = getConnection();
		orderDAO.setConnection(con);
		boolean orderstock = false;
		int stockCount = orderDAO.orderBuy(stock);
		
		if(stockCount>0) {
			commit(con);
			orderstock = true;
		}else {
			rollback(con);
		}
		
		return orderstock;
	}

	//주문취소
public boolean deleteOrder(int detail_num) throws Exception {
		
		boolean deleteSuccess = false;
		OrderDAO orderDAO = OrderDAO.getInstance();
		Connection con = getConnection();
		orderDAO.setConnection(con);
		int deleteCount = orderDAO.deleteOrder(detail_num);

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
