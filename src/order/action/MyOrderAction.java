package order.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import order.svc.OrderService;
import order.vo.OrderDetail;
import vo.ActionForward;
import vo.PageInfo;

public class MyOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ArrayList<OrderDetail> myOrder = new ArrayList<OrderDetail>();
		
		int page = 1;
		int limit = 5;
		int limitPage = 5;
		
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		if (id == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='../member/login.log';");
			out.println("</script>");
		} else {
			
			OrderService orderService = new OrderService();
			
			myOrder = orderService.myOrder(id,page, limit);
			int myOrderCount = orderService.getMyOrderCount(id);
			
			if(myOrder == null) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('주문리스트가 없습니다');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				
				int maxPage = (int) ((double)myOrderCount/limit+0.95);
				//0.95를 더해서 올림처리
				//현재 페이지에 보여줄 시작 페이지 수 (1,11,21 등..)
				int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
				//현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30등..)
				int endPage = startPage+10-1;
				
				if(endPage > maxPage) endPage = maxPage;
				
				PageInfo pageInfo = new PageInfo();
				pageInfo.setEndPage(endPage);
				pageInfo.setListCount(myOrderCount);
				pageInfo.setMaxPage(maxPage);
				pageInfo.setPage(page);
				pageInfo.setStartPage(startPage);
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("myOrder", myOrder);
				forward= new ActionForward();
				forward.setPath("../order/myOrder.jsp");
			}
		}
		return forward;
	}

	
}
