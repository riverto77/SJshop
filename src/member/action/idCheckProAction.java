package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import member.svc.idCheckService;
import vo.ActionForward;

public class idCheckProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		String id = request.getParameter("id");
		
		idCheckService idcheckService = new idCheckService();
		request.setAttribute("id", id);
		
		boolean idcheck = idcheckService.idCheck(id);
		
		if(idcheck) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디가 중복되었습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			forward = new ActionForward();
			forward.setPath("idCheck.jsp");
		}
		
		return forward;
	}
}
