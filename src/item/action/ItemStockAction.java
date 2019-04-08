package item.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import item.svc.ItemListService;
import item.svc.ItemStockService;
import item.vo.Item;
import item.vo.Stock;
import vo.ActionForward;

public class ItemStockAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String item_code = request.getParameter("item_code");
		ArrayList<Stock> stock = new ArrayList<Stock>();
		Item item = new Item();
		
		ItemStockService stockService = new ItemStockService();
		/* stock = stockService.getStock(item_code); */
		ItemListService itemList = new ItemListService();
		item = itemList.getitem(item_code);
		stock = stockService.stockList(item_code);
		
		/* request.setAttribute("stock", stock); */
		request.setAttribute("item", item);
		request.setAttribute("stock", stock);
		ActionForward forward = new ActionForward();
		forward.setPath("../admin/itemStockInsert.jsp");
		
		return forward;
	}
}
