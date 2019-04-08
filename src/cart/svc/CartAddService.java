package cart.svc;

import static db.jdbcUtil1.*;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import item.dao.ItemDAO;
import item.vo.Item;
import cart.vo.Cart;

public class CartAddService {

	public Item getCartItem(String item_name) {
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		Item item = itemDAO.itemDetail(item_name);
		close(con);
		return item;
	}
	
	public void addCart(HttpServletRequest request, Item cartItem) {
		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
		if(cartList == null) {
			cartList = new ArrayList<Cart>();
			session.setAttribute("cartList", cartList);
		}
		
		boolean isNewCart = true;
		//지금 장바구니에 담는 항목이 새로 추가되는 항목인지를 저장할 변수
		for(int i = 0; i < cartList.size(); i++) {
			if(cartItem.getItem_code().equals(cartList.get(i).getItem_code())) {
				isNewCart = false;
				cartList.get(i).setQty(cartList.get(i).getQty()+1);
				break;
			}
		}
		
		if(isNewCart) {
			Cart cart = new Cart();
			cart.setItem_code(cartItem.getItem_code());
			cart.setItem_image(cartItem.getItem_image());
			cart.setItem_name(cartItem.getItem_name());
			cart.setItem_price(cartItem.getItem_price());
			cart.setQty(1);
			cart.setStock(cartItem.getStock());
			cartList.add(cart);
		}	
	}
}
