package cart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import cart.svc.CartQtyDownService;
import vo.ActionForward;

public class CartQtyDownAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String item_name = request.getParameter("item_name");
		CartQtyDownService CartQtyDownService = new CartQtyDownService();
		CartQtyDownService.downCartQty(item_name, request);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("cartList.item");
		
		return forward;
	}
}
