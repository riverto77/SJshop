package cart.svc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cart.vo.Cart;

public class CartQtyUpService {

	public void UpCartQty(String item_name, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
		
		for(int i = 0; i < cartList.size(); i++) {
			if(cartList.get(i).getItem_name().equals(item_name)) {
				cartList.get(i).setQty(cartList.get(i).getQty() +1);
			}
		}
	}
}
