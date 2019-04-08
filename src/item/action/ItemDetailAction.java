package item.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import item.svc.ItemDetailService;
import item.vo.Item;
import vo.ActionForward;

public class ItemDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		String item_code = request.getParameter("item_code");
		Item detail = new Item();
		ItemDetailService itemDetailService = new ItemDetailService();
		detail = itemDetailService.getDetailService(item_code);
		request.setAttribute("detail", detail);
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("../item/itemDetail.jsp");
		return forward;
	}

}
