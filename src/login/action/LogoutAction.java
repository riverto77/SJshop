package login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import vo.ActionForward;

public class LogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		HttpSession session = request.getSession();
		session.invalidate();
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("main.jsp");
		
		return forward;
	}
}
