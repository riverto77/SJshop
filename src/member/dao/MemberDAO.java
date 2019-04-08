package member.dao;

import static db.jdbcUtil1.*;
import java.sql.*;
import java.sql.Date;
import javax.sql.*;
import java.util.*;

import member.vo.MemberBean;


public class MemberDAO {

	DataSource ds;
	Connection con;
	
	private static MemberDAO memberDAO;
	
	private MemberDAO() {
	}
	
	public static MemberDAO getInstance() {
		if(memberDAO == null) {
			memberDAO = new MemberDAO();
		}
		return memberDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	//회원가입
	public boolean joinMember(MemberBean member) {
		
		boolean joinMember = false;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			pstmt = con.prepareStatement("select * from member");
			rs = pstmt.executeQuery();
			
			sql = "insert into member(id, pw, name, birth, tel, gender, email, addr1, addr2, addr3, joindate, email1) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getBirth());
			pstmt.setString(5, member.getTel());
			pstmt.setString(6, member.getGender());
			pstmt.setString(7, member.getEmail());
			pstmt.setString(8, member.getAddr1());
			pstmt.setString(9, member.getAddr2());
			pstmt.setString(10, member.getAddr3());
			pstmt.setDate(11, new Date(System.currentTimeMillis()));
			pstmt.setString(12, member.getEmail1());
			
			pstmt.executeUpdate();
			
			if(rs.next()) {
				if ((member.getId() != null) && (member.getId() != rs.getString("id"))) {
					joinMember = true;
				} else {
					joinMember = false;
				}
			}
			
		} catch (Exception ex) {
			System.out.println("memberJoin 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return joinMember;
	}
	
	//회원 목록 카운트
	public int memberListCount(String select, String search) {
		int memberCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from member";
		if (!select.equals("")) {
			sql += " where "+select+" like '%"+search+"%' ";
		}
			sql += " order by id asc";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				memberCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("memberListCount 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return memberCount;
	}
	
	//관리자 모드 회원 리스트 보기
	public ArrayList<MemberBean> MemberList(int page, int limit, String select, String search) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member";
		if (!select.equals("")) {
			sql += " where "+select+" like '%"+search+"%' ";
		}
			sql += " order by id asc limit ?,?";

		ArrayList<MemberBean> MemberList = new ArrayList<MemberBean>();
		MemberBean memberbean = null;
		
		int startrow = (page - 1) * limit; // 읽기 시작할 row 번호
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memberbean = new MemberBean();
				
				memberbean.setId(rs.getString("id"));
				memberbean.setPw(rs.getString("pw"));
				memberbean.setName(rs.getString("name"));
				memberbean.setBirth(rs.getInt("birth"));
				memberbean.setTel(rs.getString("tel"));
				memberbean.setGender(rs.getString("gender"));
				memberbean.setEmail(rs.getString("email"));
				memberbean.setEmail1(rs.getString("email1"));
				memberbean.setAddr1(rs.getString("addr1"));
				memberbean.setAddr2(rs.getString("addr2"));
				memberbean.setAddr3(rs.getString("addr3"));
				memberbean.setJoindate(rs.getDate("joindate"));
				
				MemberList.add(memberbean);
			}
		} catch (Exception ex) {
			System.out.println("MemberList 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return MemberList;
	}
	
	//회원정보 보기
	public MemberBean MemberInfo(String id) {
		
		String sql = "select * from member where id=?";
		MemberBean member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					member = new MemberBean();
					member.setId(rs.getString("id"));
					member.setPw(rs.getString("pw"));
					member.setName(rs.getString("name"));
					member.setBirth(rs.getInt("birth"));
					member.setTel(rs.getString("tel"));
					member.setGender(rs.getString("gender"));
					member.setEmail(rs.getString("email"));
					member.setEmail1(rs.getString("email1"));
					member.setAddr1(rs.getString("addr1"));
					member.setAddr2(rs.getString("addr2"));
					member.setAddr3(rs.getString("addr3"));
					member.setJoindate(rs.getDate("joindate"));
					
				} while(rs.next());
			}
		}  catch (Exception ex) {
			System.out.println("MemberInfo 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return member;
	}
	
	// 회원 수정
	public int memberModify(MemberBean member) {

		int modifyCount = 0;
		PreparedStatement pstmt = null;

		String sql = "update member set pw=?, name=?, email=?, email1=?, gender=?, birth=?, tel=?, addr1=?, addr2=?, addr3=? where id=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getEmail1());
			pstmt.setString(5, member.getGender());
			pstmt.setInt(6, member.getBirth());
			pstmt.setString(7, member.getTel());
			pstmt.setString(8, member.getAddr1());
			pstmt.setString(9, member.getAddr2());
			pstmt.setString(10, member.getAddr3());
			pstmt.setString(11, member.getId());

			modifyCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("MemberModify 에러 : " + ex);
		} finally {
			close(pstmt);
		}
		return modifyCount;
	}
	
	// 회원정보 삭제
		public int deleteMember(String id) {

			PreparedStatement pstmt = null;
			String sql = "delete from member where id=?";
			int deleteCount = 0;

			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				deleteCount = pstmt.executeUpdate();
			} catch (Exception ex) {
				System.out.println("Delete 에러 : " + ex);
			} finally {
				close(pstmt);
			}

			return deleteCount;
		}
		
		// 권한 확인
		public boolean authority(String id, String pw) {

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			MemberBean member = null;

			boolean idCheck = false;

			try {
				pstmt = con.prepareStatement("select * from member where id=?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					if (pw.equals(rs.getString("pw")) || id.equals("admin"))
						idCheck = true;
				}
			} catch (SQLException ex) {
				System.out.println("Check 에러 : " + ex);
			} finally {
				close(pstmt);
			}
			return idCheck;
		}
		
		// 아이디 중복 확인
		public boolean idCheck(String id) {

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String overlap_sql = "select * from member where id=?";

			boolean idcheck = false;

			try {

				pstmt = con.prepareStatement(overlap_sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					if (!(id == null || id.equals(""))) {
						if (!(id == rs.getString("id"))) {
							idcheck = true;
						} else {
							idcheck = false;
						}
					}
				}
			} catch (Exception ex) {
				System.out.println("중복 에러 : " + ex);
			} finally {
				close(rs);
				close(pstmt);
			}
			return idcheck;
		}
}
