package order.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import item.svc.ItemListService;
import item.vo.Item;
import member.svc.MemberInfoService;
import member.vo.MemberBean;
import order.svc.OrderService;
import order.vo.OrderDetail;
import vo.ActionForward;

public class adOrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;

		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String item_code = request.getParameter("item_code");
		int detail_num = Integer.parseInt(request.getParameter("detail_num"));
		System.out.println(detail_num);
		
		Item item = new Item();
		OrderDetail orderList = new OrderDetail();
		MemberBean member = new MemberBean();
		
		ItemListService itemListService = new ItemListService();
		MemberInfoService memberInfoService = new MemberInfoService();
		OrderService orderService = new OrderService();
		
		orderList = orderService.orderList(detail_num);
		member = memberInfoService.getMember(id);
		
		request.setAttribute("item", item);
		request.setAttribute("member", member);
		request.setAttribute("orderList", orderList);
		forward = new ActionForward();
		forward.setPath("../admin/orderDetail.jsp");
		
		return forward;
		
	}

}
