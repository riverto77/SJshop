package member.svc;

import static db.jdbcUtil1.*;

import java.sql.Connection;

import member.dao.MemberDAO;
import member.vo.MemberBean;

public class MemberInfoService {

	public MemberBean getMember(String Infoid) {
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		MemberBean member = memberDAO.MemberInfo(Infoid);
		close(con);
		
		return member;
	}
}
