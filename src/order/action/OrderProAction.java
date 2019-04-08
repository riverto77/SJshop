package order.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import item.svc.ItemStockService;
import item.vo.Stock;
import member.svc.MemberInfoService;
import order.svc.OrderService;
import order.vo.Order;
import order.vo.OrderDetail;
import vo.ActionForward;

public class OrderProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		String cb[] = request.getParameterValues("checkbox");
		
		System.out.println(cb);

		if (id == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='../member/login.log';");
			out.println("</script>");
		} else {
			if (cb == null) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('주문품목을 선택해 주세요');");
				out.println("history.back();");
				out.println("</script>");
			} else {

				ArrayList<OrderDetail> orderList = new ArrayList<OrderDetail>();

				String item_code = request.getParameter("item_code");
				String item_name = request.getParameter("item_name");
				int item_price = Integer.parseInt(request.getParameter("item_price"));
				int amount = Integer.parseInt(request.getParameter("item_qty"));
				String item_image = request.getParameter("item_image");	
				int stock = Integer.parseInt(request.getParameter("stock"));

				System.out.println(stock);
				System.out.println(amount);
				
				int stock_amount = stock - amount;
				System.out.println(stock_amount);
				OrderService orderService = new OrderService();

				int order_num = orderService.selectOrderNum();

				Calendar cal = Calendar.getInstance();
				Date date = cal.getTime();
				
				OrderDetail orderdetail = new OrderDetail();
				orderdetail.setItem_code(item_code);
				orderdetail.setItem_name(item_name);
				orderdetail.setItem_image(item_image);
				orderdetail.setPrice(item_price);
				orderdetail.setStock(stock_amount);
				orderdetail.setAmount(amount);
				orderdetail.setQty(amount);
				orderdetail.setId(id);
				
				orderList.add(orderdetail);
				
				Stock stocka = new Stock();
				
				ArrayList<Stock> stockList = new ArrayList<Stock>();
				
				stocka.setItem_code(item_code);
				stocka.setItem_name(item_name);
				stocka.setStock_amount(stock_amount);
				stocka.setStock_state(amount);
				
				stockList.add(stocka);
				
				/*
				 * Stock stock1 = new Stock();
				 * 
				 * stock1.setItem_code(item_code); stock1.setStock_amount(amount);
				 */

				
				Order order = new Order(id);
				MemberInfoService memberInfoService = new MemberInfoService();

				boolean orderstock = orderService.orderBuy(stocka);
				
				boolean isRegistSuccess = orderService.orderitem(orderList);

				if (!isRegistSuccess) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('주문실패');");
					out.println("history.back();");
					out.println("</script>");
				} else {
					
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('주문성공적으로 완료 되었습니다');");
					out.println("location.href='../main.jsp'");
					out.println("</script>");
				}
			}

		}
		return forward;
	}
}
