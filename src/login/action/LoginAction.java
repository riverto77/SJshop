package login.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import login.svc.LoginService;
import vo.ActionForward;
import member.vo.MemberBean;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		ActionForward forward = null;
		
		LoginService loginService = new LoginService();
		request.setAttribute("id", id);
		request.setAttribute("pw", pw);
		boolean PassCheck = loginService.PassCheck(id, pw);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(!PassCheck) {
			out.println("<script>");
			out.println("alert('아이디가 없거나 비밀번호가 일치하지 않습니다')");
			out.println("location.href='../main.jsp'");
			out.println("</script>");
		} else {
			session.setAttribute("id", id);
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("../main.jsp");
		}
		return forward;
	}
}
