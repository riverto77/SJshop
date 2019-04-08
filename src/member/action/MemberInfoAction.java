package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.MemberInfoService;
import member.vo.MemberBean;
import vo.ActionForward;


public class MemberInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = null;
		
		if(id==null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("../member/LoginForm.jsp");
		} else if(!id.equals("admin")) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자가 아닙니다')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			String InfoId = request.getParameter("id");
			MemberInfoService memberInfoService = new MemberInfoService();
			MemberBean member = memberInfoService.getMember(InfoId);
			request.setAttribute("member", member);
			forward.setPath("/admin/memberInfo.jsp");
		}
		
		return forward;
	}
}
