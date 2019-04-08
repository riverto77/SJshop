package item.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import item.svc.ItemListService;
import item.vo.Item;
import vo.ActionForward;

public class ItemModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String item_code = request.getParameter("item_code");
		System.out.println(item_code);
		Item item = new Item();
		ItemListService itemListService = new ItemListService();
		item = itemListService.getitem(item_code);
		
		request.setAttribute("item", item);
		
		ActionForward forward = new ActionForward();
		forward.setPath("../admin/itemModify.jsp");
		
		return forward;
	}
}
