package member.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import item.vo.Item;
import member.svc.MemberListService;
import member.vo.MemberBean;
import vo.ActionForward;
import vo.PageInfo;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		HttpSession session = request.getSession();
		ArrayList<MemberBean> MemberList = new ArrayList<MemberBean>();
		
		int page = 1;
		int limit = 10;
		int limitPage = 10;
		
		
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
		
		
		if((session.getAttribute("id") == null) && (!(session.getAttribute("id")).equals("admin"))) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자계정이 필요합니다')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			
			MemberListService memberListService = new MemberListService();
			int memberCount = memberListService.getListCount(select, search);
			MemberList = memberListService.MemberList(page, limit, select, search);
			
			int maxPage = (int) ((double)memberCount/limit+0.95);
			//0.95를 더해서 올림처리
			//현재 페이지에 보여줄 시작 페이지 수 (1,11,21 등..)
			int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
			//현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30등..)
			int endPage = startPage+10-1;
			
			if(endPage > maxPage) endPage = maxPage;
			
			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(memberCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("MemberList", MemberList);
		}
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("../admin/memberList.jsp");
		
		return forward;
	}

}
