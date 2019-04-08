package item.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import item.svc.ItemStockService;
import item.vo.Item;
import item.vo.Stock;
import vo.ActionForward;
import vo.PageInfo;

public class ItemStockViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		
		String item_code = request.getParameter("item_code");
		System.out.println(item_code);
		
		int page = 1;
		int limit = 10;
		int limitPage = 10;
		
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String select = "";
		String search = "";
		
		if(request.getParameter("select") != null) {
			select = request.getParameter("select");
		}
		if(request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		
		/* Stock stock = new Stock(); */
		ArrayList<Stock> stockList = new ArrayList<Stock>();
		ItemStockService stockService = new ItemStockService();
		
		int stockCount = stockService.stockListCount(select, search);
		stockList = stockService.stockList(item_code);
		
		int maxPage = (int) ((double)stockCount/limit+0.95);
		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage+10-1;
		if(endPage > maxPage) endPage = maxPage;
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(stockCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("stockList", stockList);
		request.setAttribute("select", select);
		request.setAttribute("search", search);
		forward = new ActionForward();
		forward.setPath("../admin/itemStock.jsp");
		
		return forward;
	}

}
