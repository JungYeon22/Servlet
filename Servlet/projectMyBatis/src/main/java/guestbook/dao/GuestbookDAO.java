package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;
import guestbook.bean.GuestbookDTO;


public class GuestbookDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	
	
	private static GuestbookDAO guestbookDAO = new GuestbookDAO();
	
	public static GuestbookDAO getInstance() {
		return guestbookDAO;
	}
	
	public GuestbookDAO() {
		Context context;
		
		try {
			context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");	// Tomcat인 경우 앞에 java:comp/env/을 붙인다.
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public int insertGuestbook(GuestbookDTO guestbookDTO) {
		int su = 0;
		String sql = "insert into guestbook "
				+ "values (seq_guestbook.nextval,?,?,?,?,?,sysdate)";
		
		try {
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guestbookDTO.getName());
		pstmt.setString(2, guestbookDTO.getEmail());
		pstmt.setString(3, guestbookDTO.getHomepage());
		pstmt.setString(4, guestbookDTO.getSubject());
		pstmt.setString(5, guestbookDTO.getContent());
		
		su = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			}
		}
		return su;
	}
	
	public List<GuestbookDTO> getGuestbookList(int startNum, int endNum){
		List<GuestbookDTO> list = new ArrayList<GuestbookDTO>();
		
		String sql = "select * "
				+ "from (  select rownum rn, tt.*"
				+ "        from (select * from guestbook "
				+ "        order by seq desc)tt"
				+ "     )"
				+ "where  rn >=? and rn <=?";
	
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			rs = pstmt.executeQuery();// 실행 - ResultSet 리턴
			
			while(rs.next()) {
				GuestbookDTO guestbookDTO = new GuestbookDTO();
				guestbookDTO.setSeq(rs.getInt("seq"));
				guestbookDTO.setName(rs.getString("name"));
				guestbookDTO.setEmail(rs.getString("email"));
				guestbookDTO.setHomepage(rs.getString("homepage"));
				guestbookDTO.setSubject(rs.getString("subject"));
				guestbookDTO.setContent(rs.getString("content"));
				guestbookDTO.setLogtime(rs.getDate("logtime"));
				
				list.add(guestbookDTO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public int getTotalA() {
		String sql = "select count(*) from guestbook";
		int totalA = 0;
		
		try {
			conn =  ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();// 실행 - ResultSet 리턴
			
			while(rs.next()) {
				totalA = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return totalA;
	}

}
