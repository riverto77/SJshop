package cart.svc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cart.vo.Cart;

public class CartRemoveService {

public void cartRemove(HttpServletRequest request, String[] kindArray) {
		
		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
		
		for(int i = 0; i < kindArray.length; i++) {
			for(int j = 0; j < cartList.size(); j++) {
				if(cartList.get(j).getItem_name().equals(kindArray[i])) {
					cartList.remove(cartList.get(j));
				}
			}
		}
	}
}
