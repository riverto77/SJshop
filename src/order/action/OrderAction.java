package order.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import cart.svc.CartListService;
import cart.vo.Cart;
import item.svc.ItemListService;
import item.vo.Item;
import member.svc.MemberInfoService;
import member.vo.MemberBean;
import order.svc.OrderService;
import order.vo.OrderDetail;
import vo.ActionForward;

public class OrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		if (id == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='../member/login.log';");
			out.println("</script>");
		} else {
			
			/*
			 * OrderDetail orderList = new OrderDetail();
			 * orderList.setItem_code(request.getParameter("item_code"));
			 * orderList.setItem_name(request.getParameter("item_name"));
			 * orderList.setPrice(Integer.parseInt(request.getParameter("item_price")));
			 * orderList.setAmount(Integer.parseInt(request.getParameter("item_qty")));
			 * orderList.setItem_image(request.getParameter("item_image"));
			 */
			 
			OrderService orderService = new OrderService();
			Item item = new Item();
			ItemListService itemListService = new ItemListService();
			ArrayList<OrderDetail> orderList = new ArrayList<OrderDetail>();
			
			String buyid = request.getParameter("id");
			String item_name = request.getParameter("item_name");
			String item_code = request.getParameter("item_code");
			int price = Integer.parseInt(request.getParameter("item_price"));
			int amount = Integer.parseInt(request.getParameter("item_qty"));
			String item_image = request.getParameter("item_image");
			int stock = Integer.parseInt(request.getParameter("stock"));
				
			orderList = orderService.de_order(item_code, item_name, amount, price, item_image, id, stock);
		
				MemberBean member = new MemberBean();
				MemberInfoService memberService = new MemberInfoService();
					
				member = memberService.getMember(id);
				
				request.setAttribute("orderList", orderList);
				request.setAttribute("member", member);
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("../order/order.jsp");
			}
		return forward;
	}
}
