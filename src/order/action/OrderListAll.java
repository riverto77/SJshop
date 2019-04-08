package order.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import item.vo.Item;
import order.svc.OrderService;
import order.vo.OrderDetail;
import vo.ActionForward;
import vo.PageInfo;

public class OrderListAll implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		
		ArrayList<OrderDetail> orderList = new ArrayList<OrderDetail>();
		int page = 1;
		int limit = 20;
		int limitPage = 20;
		
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String select = "";
		String search = "";
		
		if(request.getParameter("select") != null) {
			select = request.getParameter("select");
		}
		if(request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		
		OrderService orderService = new OrderService();
		int orderListCount = orderService.getOrderListCount(select, search);
		
		orderList = orderService.getOrderListAll(page, limitPage, select, search);
		
		int maxPage = (int) ((double)orderListCount/limit+0.95);
		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage+10-1;
		
		if(endPage > maxPage) endPage = maxPage;
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(orderListCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("orderList", orderList);
		request.setAttribute("select", select);
		request.setAttribute("search", search);
		
		forward = new ActionForward();
		forward.setPath("../admin/orderListAll.jsp");
		return forward;
	}

}
