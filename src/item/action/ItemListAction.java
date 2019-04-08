package item.action;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import item.svc.ItemListService;
import item.vo.Item;
import vo.ActionForward;
import vo.PageInfo;

public class ItemListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ArrayList<Item> itemList = new ArrayList<Item>();
		int page = 1;
		int limit = 12;
		int limitPage = 12;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		String select = "";
		String search = "";

		if (request.getParameter("select") != null) {
			select = request.getParameter("select");
		}
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}

		ItemListService itemListService = new ItemListService();
		int listCount = itemListService.getcategoryCount(select, search);
		// 총 리스트 수를 받아옴
		itemList = itemListService.getItemList(page, limitPage, select, search);
		// 리스트를 받아옴
		// 총 페이지 수
		int maxPage = (int) ((double) listCount / limit + 0.95);
		// 0.95를 더해서 올림처리
		// 현재 페이지에 보여줄 시작 페이지 수 (1,11,21 등..)
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30등..)
		int endPage = startPage + 10 - 1;

		if (endPage > maxPage)
			endPage = maxPage;

		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("itemList", itemList);
		request.setAttribute("select", select);
		request.setAttribute("search", search);
		ActionForward forward = new ActionForward();
		forward.setPath("../admin/itemList.jsp");
		
		return forward;
	}

}
