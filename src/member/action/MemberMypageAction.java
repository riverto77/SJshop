package member.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.MemberInfoService;
import member.svc.MemberListService;
import member.vo.MemberBean;
import vo.ActionForward;

public class MemberMypageAction implements Action {

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
		} else {
			forward = new ActionForward();
			MemberInfoService memberInfoService = new MemberInfoService();
			MemberBean member = memberInfoService.getMember(id);
			request.setAttribute("member", member);
			forward.setPath("../member/myPage.jsp");
		}
		
		return forward;
	}

}
