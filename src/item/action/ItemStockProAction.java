package item.action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import item.svc.ItemStockService;
import item.vo.Stock;
import vo.ActionForward;

public class ItemStockProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		String item_code = request.getParameter("item_code");
		String item_name = request.getParameter("item_name");
		int item_stock = Integer.parseInt(request.getParameter("item_stock"));
		
		Stock stock = new Stock();
		stock.setItem_code(item_code);
		stock.setItem_name(item_name);
		stock.setStock_amount(item_stock); 
		stock.setStock_date(new Date(System.currentTimeMillis()));
		
		ItemStockService stockService = new ItemStockService();
		boolean stockInsert = stockService.getStock(stock);
		
		if(!stockInsert) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('재고 저장실패');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('재고 저장성공');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}

}
