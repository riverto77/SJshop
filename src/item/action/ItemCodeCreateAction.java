package item.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import item.svc.ItemCodeCreateService;
import vo.ActionForward;

public class ItemCodeCreateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		
		String category = request.getParameter("category");
		System.out.println(category);
		ItemCodeCreateService itemService = new ItemCodeCreateService();
		String item_code = itemService.makeItemCode(category);
		request.setAttribute("item_code", item_code);
		
		forward= new ActionForward();
		forward.setRedirect(false);
		forward.setPath("../admin/item_code.jsp");
		
		return forward;
	}
}
