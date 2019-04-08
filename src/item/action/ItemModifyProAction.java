package item.action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import item.svc.ItemModifyService;
import item.vo.Item;
import vo.ActionForward;

public class ItemModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = null;
		HttpSession session = request.getSession();
		boolean isModifySuccess = false;
		
		Item item = new Item();
		ItemModifyService itemModifyService = new ItemModifyService();
		
		String realFolder="";
		String saveFolder="/image/item";
		int fileSize=10*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		System.out.println("============ saveFolder = " + saveFolder);
		System.out.println("============ realFolder = " + realFolder);
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8");
		
		String item_image = "";
		String item_detail_image = "";
		String origfilename1 = "";
		String origfilename2 = "";
		
		Enumeration files = multi.getFileNames();
		
		String file1 = (String)files.nextElement();
		item_image = multi.getFilesystemName(file1);
		origfilename1 = multi.getOriginalFileName(file1);
		
		String file2 = (String)files.nextElement();
		item_detail_image = multi.getFilesystemName(file2);
		origfilename2 = multi.getOriginalFileName(file2);

		String id = (String) session.getAttribute("id");

		if (session.getAttribute("id") == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("로그인이 필요합니다");
			out.println("location.href='loginForm.jsp'");
			out.println("</script>");
		}

		if (id.equals("admin")) {
			String item_name = multi.getParameter("item_name");
			item.setItem_name(item_name);
			item.setItem_code(multi.getParameter("item_code"));
			item.setItem_price(Integer.parseInt(multi.getParameter("item_price")));
			item.setItem_company(multi.getParameter("item_company"));
			/* item.setItem_stock(Integer.parseInt(multi.getParameter("item_stock"))); */
			item.setCategory(multi.getParameter("category"));
			item.setComment1(multi.getParameter("comment1"));
			item.setComment2(multi.getParameter("comment2"));
			item.setComment3(multi.getParameter("comment3"));
			item.setItem_image(item_image);
			item.setItem_detail_image(item_detail_image);
		
		isModifySuccess = itemModifyService.modifyitem(item);
		
		}
		
		if (!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품 수정실패');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품 수정성공');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}
}
