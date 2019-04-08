package order.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import order.svc.OrderService;
import vo.ActionForward;
import order.vo.*;

public class OrderdetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;

		int page = 1;
		int limit = 5;
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int detail_num = Integer.parseInt(request.getParameter("detail_num"));
		System.out.println(detail_num);
		
		ArrayList<OrderDetail> orderList = new ArrayList<OrderDetail>();
		OrderDetail order = new OrderDetail();
		
		OrderService orderService = new OrderService();
		orderList = orderService.myOrder(id,page, limit);
		order = orderService.orderList(detail_num);
		
		request.setAttribute("order", order);
		request.setAttribute("orderList", orderList);
		forward = new ActionForward();
		forward.setPath("../order/order.jsp");
		
		return forward;
	}

}
