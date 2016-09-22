package kr.ac.sungkyul.beautyline.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.UserVo;

@Repository
public class UserDao {
	@Autowired
	private SqlSession sqlSession;

	public void update(UserVo vo) {// 회원정보수정

		sqlSession.update("user.update", vo);
		/*
		 * catch (SQLException e) { //e.printStackTrace(); throw new
		 * RuntimeException(); }
		 */
	}

	public UserVo get(Long userNo) { //세션넘버를 받아서 정보를 다가져올때
		UserVo vo = sqlSession.selectOne("user.getByNo", userNo);
		return vo;
	}

	public UserVo get(String id) { // 이메일 체크 다오
		UserVo vo = sqlSession.selectOne("user.getByid", id);
		//List<UserVo> list = sqlSession.selectList("user.getByid", id);
		return vo;
	}

	public UserVo get(String id, String password) {// 로그인 확인

		UserVo userVo = new UserVo();
		userVo.setId(id);
		userVo.setPassword(password);

		//만약에 파라미터로 넘겨야 할 매핑 클래스가 없는경우
		/*Map<String, Object>map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("password", password);
		UserVo vo = sqlSession.selectOne("user.getByidAndPassword", map); q받아올때는 map.get();
		*/
		
		UserVo vo = sqlSession.selectOne("user.getByIdAndPassword", userVo);
		System.out.println(vo);
		return vo;

	}

	public void insert(UserVo vo) {// 회원가입
		sqlSession.insert("user.insert",vo);

	}
	
	
	public UserVo checkId(String id){//아이디 중복확인
		UserVo vo = sqlSession.selectOne("user.checkId",id);
		return vo;
	}
	
	public UserVo getId(String name, String email) {// 찾기 id 
		UserVo userVo = new UserVo();
		userVo.setName(name);
		userVo.setEmail(email);
		
		
		UserVo vo = sqlSession.selectOne("user.getId",userVo);
		return vo;
	
	}
	
	

	public boolean delete(UserVo vo) {
		return sqlSession.delete("user.delete",vo) !=0;
}
}