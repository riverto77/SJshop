package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.MemberDeleteService;
import vo.ActionForward;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String adminid = (String)session.getAttribute("id");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDeleteService memberDeleteService = new MemberDeleteService();
		boolean idCheck = memberDeleteService.authority(id, pw);
		
		if(!idCheck) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			boolean deleteSuccess = memberDeleteService.deleteMember(id);
			
			if(!deleteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제가 실패하였습니다. 다시 시도해 주세요');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제가 완료 되었습니다');");
				out.println("location.href='memberList.mem';");
				out.println("</script>");
				out.close();
				/*forward = new ActionForward();
				forward.setPath("main.jsp");*/
			}
		}
		return forward;
	}
}
