package my.book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import my.db.ConnectionPoolBean;
import my.student.StudentDTO;

public class BookDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	private ConnectionPoolBean pool;
	
	

	public BookDAO() {

	}
	
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public int insertBook(String title,String writer,String publisher,int price) throws SQLException{
		String sql = "insert into book values(?,?,?,?,sysdate)";
		try{
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, writer);
			ps.setString(3, publisher);
			ps.setInt(4, price);
			int res = ps.executeUpdate();
			return res;
		}finally{
			if(ps != null)ps.close();
			if(con != null) pool.returnConnection(con);
		}
	}
	
	public int deleteBook(String title) throws SQLException{
		String sql = "delete from book where title = ?";
		try{
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			int res = ps.executeUpdate();
			return res;
		}finally{
			if(ps != null) ps.close();
			if(con != null) pool.returnConnection(con);
		}

	}
	
	public List<BookDTO> getBookList() throws SQLException {
		String sql = "select * from book";
		try{
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			return makeList(rs);
		}finally{
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) pool.returnConnection(con);
		}
	}
	
	public List<BookDTO> findBook(String title,String writer,String publisher) throws SQLException {
		String sql = "select * from book where title like '%"+title+"%' and writer like '%"+writer+"%' and publisher like '%"+publisher+"%'";
		try{
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			return makeList(rs);
		}finally{
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) pool.returnConnection(con);
		}
	}
	
	public List<BookDTO> makeList(ResultSet rs) throws SQLException{
		List<BookDTO> list = new ArrayList<BookDTO>();
		while (rs.next()) {
			BookDTO dto = new BookDTO();
			dto.setTitle(rs.getString("title"));
			dto.setWriter(rs.getString("writer"));
			dto.setPublisher(rs.getString("publisher"));
			dto.setPrice(rs.getInt("price"));
			dto.setIndate(rs.getString("indate"));
			list.add(dto);
		}
		return list;
	}
	
}
