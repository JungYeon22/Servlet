package member.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	private SqlSessionFactory sqlSessionFactory = null;
	private static MemberDAO memberDAO = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	public MemberDAO() {
		try {
			String resource = "mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public boolean isExistId(String id) {
		boolean exist = false;
		SqlSession sqlSession = sqlSessionFactory.openSession();	//생성
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistId", id);
		if(memberDTO != null) exist = true;
		sqlSession.commit();
		sqlSession.close();
		return exist;
	}
	public int write(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();	//생성
		int su = sqlSession.insert("memberSQL.write", memberDTO);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}
	
	public boolean login(String id, String pwd) {
		boolean exist = false;
		SqlSession sqlSession = sqlSessionFactory.openSession();	//생성
		Map<String,String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.login", map);
		if(memberDTO != null) exist = true;
		sqlSession.commit();
		sqlSession.close();
		
		return exist;
	}
	
	public MemberDTO memberById(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();	//생성
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberById", id);
		sqlSession.commit();
		sqlSession.close();
		return memberDTO;
	}
	
	public int updateMember(MemberDTO memberDTO) {
		int su = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();	//생성
		su = sqlSession.update("memberSQL.updateMember", memberDTO);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}
	

}