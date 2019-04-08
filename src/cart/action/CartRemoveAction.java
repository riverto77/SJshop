package cart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import cart.svc.CartRemoveService;
import vo.ActionForward;

public class CartRemoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String[] kindArray = request.getParameterValues("checkbox");
		CartRemoveService CartRemoveService = new CartRemoveService();
		CartRemoveService.cartRemove(request, kindArray);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("cartList.item");
		
		return forward;
	}

}
