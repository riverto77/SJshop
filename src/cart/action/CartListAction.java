package cart.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import cart.svc.CartListService;
import vo.ActionForward;
import cart.vo.Cart;

public class CartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		CartListService cartListService = new CartListService();
		ArrayList<Cart> cartList = cartListService.getCartList(request);
		
		//총 금액 계산
		int totalMoney = 0;
		int money = 0;
		
		if(cartList == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니에 상품이 없습니다');");
			out.println("history.back();");
			out.println("</script>");
		} else {
		
		for(int i = 0; i < cartList.size(); i ++) {
			
			money = cartList.get(i).getItem_price()*cartList.get(i).getQty();
			totalMoney += money;
		}
		
		request.setAttribute("totalMoney", totalMoney);
		request.setAttribute("cartList", cartList);
		forward = new ActionForward();
		forward.setPath("../order/cartList.jsp");

		}
		return forward;
	}
}
