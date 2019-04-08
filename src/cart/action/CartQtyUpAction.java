package cart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import cart.svc.CartQtyUpService;
import vo.ActionForward;

public class CartQtyUpAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String item_name = request.getParameter("item_name");
		CartQtyUpService CartQtyUpService = new CartQtyUpService();
		CartQtyUpService.UpCartQty(item_name, request);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("cartList.item");
		
		return forward;
	}

}
