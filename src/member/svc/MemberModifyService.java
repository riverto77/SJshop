package member.svc;

import member.dao.MemberDAO;
import member.vo.MemberBean;

import java.sql.Connection;
import static db.jdbcUtil1.*;

public class MemberModifyService {

	public boolean memberModify(MemberBean member) throws Exception {
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		int modifyCount = memberDAO.memberModify(member);
		
		if(modifyCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}

		close(con);
		return isModifySuccess;
	}
}
