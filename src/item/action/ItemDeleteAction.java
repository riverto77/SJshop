package item.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import action.Action;
import item.svc.ItemDeleteService;
import item.vo.Item;
import vo.ActionForward;

public class ItemDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		HttpSession session = request.getSession();
		boolean isModifySuccess = false;

		Item item = new Item();
		ItemDeleteService itemDeleteService = new ItemDeleteService();

		String realFolder = "";
		String saveFolder = "/image";
		int fileSize = 10 * 1024 * 1024;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);

		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8");

		String id = (String) session.getAttribute("id");

		if((session.getAttribute("id") == null) && (!(session.getAttribute("id")).equals("admin"))) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자계정이 필요합니다')");
			out.println("history.back();");
			out.println("</script>");
		}

		String item_code = multi.getParameter("item_code");
		boolean deleteSuccess = itemDeleteService.deleteItem(item_code);
		
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
			out.println("location.href='../admin/itemList.item';");
			out.println("</script>");
			out.close();
		}
		
		return forward;
	}
}
