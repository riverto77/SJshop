package order.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import item.svc.ItemStockService;
import item.vo.Stock;
import order.svc.OrderService;
import vo.ActionForward;

public class OrderCancleAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		String item_code = request.getParameter("item_code");
		int detail_num = Integer.parseInt(request.getParameter("detail_num"));
		int order_amount = Integer.parseInt(request.getParameter("order_amount"));
		int stock = Integer.parseInt(request.getParameter("stock"));

		System.out.println(detail_num);
		System.out.println(order_amount);
		System.out.println(stock);

		stock = stock + order_amount;

		OrderService order = new OrderService();

		boolean deleteSuccess = order.deleteOrder(detail_num);

		if (!deleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('주문취소가 실패하였습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			Stock restock = new Stock();
			restock.setItem_code(item_code);
			restock.setStock_amount(stock);
			ItemStockService stockService = new ItemStockService();
			boolean replaceStock = stockService.stockreplace(restock);

			if (!replaceStock) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('재고반환에 실패하엿습니다');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} else {

				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('주문취소가 완료 되었습니다');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
		}
		return forward;
	}
}
