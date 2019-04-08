package cart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import cart.svc.CartAddService;
import item.vo.Item;
import vo.ActionForward;

public class CartAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		CartAddService cartAddService = new CartAddService();
		String item_code = request.getParameter("item_code");
		Item cartItem = cartAddService.getCartItem(item_code);
		
		cartAddService.addCart(request, cartItem);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("../item/cartList.item");
		
		return forward;
	}
}
