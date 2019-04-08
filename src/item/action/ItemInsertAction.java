package item.action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import item.svc.ItemInsertService;
import item.vo.Item;
import vo.ActionForward;

public class ItemInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		Item item = null;
		String realFolder="";
		String saveFolder="/image/item";
		int fileSize=10*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
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
		
		item = new Item();
		item.setItem_name(multi.getParameter("item_name"));
		item.setItem_code(multi.getParameter("item_code"));
		item.setItem_price(Integer.parseInt(multi.getParameter("item_price")));
		item.setItem_company(multi.getParameter("item_company"));
		item.setCategory(multi.getParameter("category"));
		item.setComment1(multi.getParameter("comment1"));
		item.setComment2(multi.getParameter("comment2"));
		item.setComment3(multi.getParameter("comment3"));
		item.setItem_image(item_image);
		item.setItem_detail_image(item_detail_image);
		
		ItemInsertService itemInfoService = new ItemInsertService();
		boolean insertItem = itemInfoService.insertItem(item);
		
		if(!insertItem) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품등록실패')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			/*
			 * forward = new ActionForward(); forward.setRedirect(true);
			 * forward.setPath("../main.jsp");
			 */
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품등록성공')");
			out.println("location.href='../admin/itemInsert.jsp'");
			out.println("</script>");
		}
		
		return forward;
	}
}
