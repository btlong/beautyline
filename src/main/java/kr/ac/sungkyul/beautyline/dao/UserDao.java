package kr.ac.sungkyul.beautyline.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.UserVo;

@Repository
public class UserDao {
	@Autowired
	private SqlSession sqlSession;

	
	/* 회원가입 */
	public int insert(UserVo vo) {// 회원가입
		int a = sqlSession.insert("user.insert",vo);
		System.out.println(a);
		return a; //요거 아직 확인안함 service에도 써야함 

	}
	
	/* 이름과 전화번호로 회원가입 */
	public UserVo insertUserNamePhone(UserVo uservo){
		sqlSession.insert("user.insertUserNamePhone",uservo);
		return uservo;
	}
	
	/* id 중복확인 */
	public UserVo checkId(String id){
		return sqlSession.selectOne("user.checkId",id);
	}
	
	/* ID 찾기  */
	public UserVo getId(UserVo userVo) {
		return	sqlSession.selectOne("user.getId",userVo);
	
	}
	/* PW 찾기  */	
	public UserVo getPw(UserVo userVo) {
		return	sqlSession.selectOne("user.getPw",userVo);
	
	}
	
	/* 임시 비밀번호 발급(비밀번호 찾기시) */
	public void updateTemPw(String tempPw, Long no) {// 회원정보수정
		UserVo userVo = new UserVo();
		userVo.setPassword(tempPw);
		userVo.setNo(no);
		sqlSession.update("user.updateTemPw", userVo);
	}
	
	
	
	public int update(UserVo vo) {// 회원정보수정
		return sqlSession.update("user.update", vo);
	}

	
	
	/* 회원정보 수정 - 세션넘버를 받아서 정보를 다가져올때	*/
	public UserVo getUserInfo(Long userNo) { //세션넘버를 받아서 정보를 다가져올때
		return sqlSession.selectOne("user.getByNo", userNo);
	}
	/* 로그인	*/
	public UserVo get(String id, String password) {//
		UserVo userVo = new UserVo();
		userVo.setId(id);
		userVo.setPassword(password);
		return sqlSession.selectOne("user.getByIdAndPassword", userVo);
	}
	public UserVo get(String id) { // 이메일 체크 다오
		return sqlSession.selectOne("user.getByid", id);
	}
	public boolean delete(UserVo vo) {
		return sqlSession.delete("user.delete",vo) !=0;
}
}