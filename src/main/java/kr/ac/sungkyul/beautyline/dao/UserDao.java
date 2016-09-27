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
		return sqlSession.selectOne("user.getByNo", userNo);
	}

	public UserVo get(String id) { // 이메일 체크 다오
		
		//List<UserVo> list = sqlSession.selectList("user.getByid", id);
		return sqlSession.selectOne("user.getByid", id);
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
		
		return sqlSession.selectOne("user.getByIdAndPassword", userVo);
	
	
	}

	public void insert(UserVo vo) {// 회원가입
		sqlSession.insert("user.insert",vo);

	}
	
	
	public UserVo checkId(String id){//아이디 중복확인
		return sqlSession.selectOne("user.checkId",id);
	}
	
	public UserVo getId(UserVo userVo) {// 찾기 id 
		return	sqlSession.selectOne("user.getId",userVo);
	
	}
	
	public UserVo getPw(UserVo userVo) {// 찾기 id ;
		return	sqlSession.selectOne("user.getPw",userVo);
	
	}
	
	public void updateTemPw(String tempPw, Long no) {// 회원정보수정
		UserVo userVo = new UserVo();
		userVo.setPassword(tempPw);
		userVo.setNo(no);
		sqlSession.update("user.updateTemPw", userVo);
	}
	
	
	

	public boolean delete(UserVo vo) {
		return sqlSession.delete("user.delete",vo) !=0;
}
}