package my.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import my.db.ConnectionPoolBean;

public class MemberDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	private ConnectionPoolBean pool;
	
	
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}

	public MemberDAO() {

	}
	
	public MemberDTO loginMember(MemberDTO dto) throws SQLException{
		String sql = "select * from jsp_member where id = ? and password = ?";
		con = pool.getConnection();
		System.out.println(dto);
		try{
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPasswd());
			rs = ps.executeQuery();
			List<MemberDTO> list = makeList(rs);
			if(list != null && !list.isEmpty()){
				return list.get(0);
			}else{
				return null;
			}
		}finally{
			if(rs != null)rs.close();
			if(ps != null)ps.close();
			if(con != null)pool.returnConnection(con);
		}
	}

	public boolean checkMember(String name, String ssn1, String ssn2) throws SQLException {
		String sql = "select * from jsp_member where name = ? and ssn1 = ? and ssn2 = ?";
		con = pool.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);

		try {
			pstmt.setString(1, name);
			pstmt.setString(2, ssn1);
			pstmt.setString(3, ssn2);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("가입되어있음");
				return true;
			} else {
				System.out.println("가입안됨");
				return false;
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				pool.returnConnection(con);
		}
	}
	
	public MemberDTO findMemberId(MemberDTO find) throws SQLException{
		String sql = "select * from jsp_member where name = ? and ssn1 = ? and ssn2 = ?";
		con = pool.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);

		System.out.println(find);
		try {
			pstmt.setString(1, find.getName());
			pstmt.setString(2, find.getSsn1());
			pstmt.setString(3, find.getSsn2());
			rs = pstmt.executeQuery();
			
			List<MemberDTO> members =  makeList(rs);
			
			if(members == null || members.isEmpty()){
				return null;
			}else{
				return members.get(0);
			}
			
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				pool.returnConnection(con);
		}
	}
	
	public MemberDTO findMemberPw(MemberDTO find) throws SQLException{
		String sql = "select * from jsp_member where name = ? and ssn1 = ? and ssn2 = ? and id = ?";
		con = pool.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);

		System.out.println(find);
		try {
			pstmt.setString(1, find.getName());
			pstmt.setString(2, find.getSsn1());
			pstmt.setString(3, find.getSsn2());
			pstmt.setString(4, find.getId());
			rs = pstmt.executeQuery();
			
			List<MemberDTO> members =  makeList(rs);
			
			if(members == null || members.isEmpty()){
				return null;
			}else{
				return members.get(0);
			}
			
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				pool.returnConnection(con);
		}
	}

	public int insertMember(MemberDTO dto) throws SQLException {
		String sql = "insert into jsp_member values(jsp_member_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate)";
		con = pool.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		try {
			System.out.println(dto);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getSsn1());
			pstmt.setString(5, dto.getSsn2());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getHp1());
			pstmt.setString(8, dto.getHp2());
			pstmt.setString(9, dto.getHp3());
			int res = pstmt.executeUpdate();
			return res;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				pool.returnConnection(con);
		}
	}

	public List<MemberDTO> getMemberList() throws SQLException {
		String sql = "select * from jsp_member";
		con = pool.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		return makeList(rs);
	}

	public List<MemberDTO> makeList(ResultSet rs) throws SQLException {
		List<MemberDTO> members = new ArrayList<MemberDTO>();
		while (rs.next()) {
			MemberDTO member = new MemberDTO();
			member.setNo(rs.getInt("no"));
			member.setId(rs.getString("id"));
			member.setName(rs.getString("name"));
			member.setEmail(rs.getString("email"));
			member.setHp1(rs.getString("hp1"));
			member.setHp2(rs.getString("hp2"));
			member.setHp3(rs.getString("hp3"));
			member.setJoindate(rs.getString("joindate"));
			member.setPasswd(rs.getString("password"));

			members.add(member);
		}
		return members;
	}

	public boolean deleteMember(MemberDTO delete) throws SQLException {
		String sql = "delete from jsp_member where no = ?";
		con = pool.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		try {
			pstmt.setInt(1, delete.getNo());
			int res = pstmt.executeUpdate();
			if (res > 0) {
				return true;
			} else {
				return false;
			}
		} finally {
			if(pstmt != null)pstmt.close();
			if(con != null)pool.returnConnection(con);
		}
	}
	
	public MemberDTO getMember(int no) throws SQLException{
		String sql = "select * from jsp_member where no = ?";
		try{
			con = pool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			List<MemberDTO> list = makeList(rs);
			return list.get(0);
		}finally{
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) pool.returnConnection(con);
		}
	}
	
	public int updateMember(MemberDTO dto) throws SQLException{
		String sql = "update jsp_member set passwd=?,email=?,hp1=?,hp2=?,hp3=? where no =?";
		con = pool.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		try{
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getHp1());
			pstmt.setString(4, dto.getHp2());
			pstmt.setString(5, dto.getHp3());
			int res=  pstmt.executeUpdate();
			return res;
		}finally{
			if(pstmt != null) pstmt.close();
			if(con != null) pool.returnConnection(con);
		}
	}
	
	public List<MemberDTO> findMember(String search,String searchString) throws SQLException{
		System.out.println(search+","+searchString);
		if(search == null || searchString == null){
			return new ArrayList<MemberDTO>();
		}
		
		String sql = "select * from jsp_member where "+search+" like '%"+searchString+"%'";
		con = pool.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		try{
			rs = pstmt.executeQuery();
			return makeList(rs);
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) pool.returnConnection(con);
		}
	}
}
