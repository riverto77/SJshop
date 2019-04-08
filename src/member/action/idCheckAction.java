package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import member.svc.MemberInfoService;
import member.vo.MemberBean;
import vo.ActionForward;


public class idCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		String id = request.getParameter("id");
		MemberInfoService memberInfoService = new MemberInfoService();
		MemberBean member = memberInfoService.getMember(id); 
		request.setAttribute("member", member);
		
		forward.setPath("../member/idCheck.jsp");
		
		return forward;
	}
}
