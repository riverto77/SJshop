package item.action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import item.svc.ItemStockService;
import item.vo.Stock;
import vo.ActionForward;

public class StockAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		boolean stockadd = false;
		String item_code = request.getParameter("item_code");
		int item_state = Integer.parseInt(!(request.getParameter("item_state").equals("") || request.getParameter("item_state")==null)?request.getParameter("item_state"):"0");
		int stock_amount = Integer.parseInt(request.getParameter("stock_amount"));
		
		if (session.getAttribute("id") == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("관리자계정이 필요합니다");
			out.println("location.href='loginForm.jsp'");
			out.println("</script>");
		}

		if (id.equals("admin")) {

			stock_amount = stock_amount + item_state;

			Stock stock = new Stock();
			stock.setItem_code(item_code);
			stock.setStock_amount(stock_amount);
			stock.setStock_date(new Date(System.currentTimeMillis()));

			ItemStockService StockService = new ItemStockService();

			stockadd = StockService.stockState(stock);

			if (!stockadd) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('재고 입고실패');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('재고 입고성공');");
				out.println("history.back();");
				out.println("</script>");
			}
		}

		return forward;
	}

}
