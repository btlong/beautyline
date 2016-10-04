package kr.ac.sungkyul.beautyline.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.beautyline.dao.UserDao;
import kr.ac.sungkyul.beautyline.email.EmailSender;
import kr.ac.sungkyul.beautyline.exception.UserInfoUpdateException;
import kr.ac.sungkyul.beautyline.vo.Email;
import kr.ac.sungkyul.beautyline.vo.UserVo;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;

	@Autowired
	private EmailSender emailSender;

	public void join(UserVo vo) {
		vo.setEmail(vo.getEmail1() + "@" + vo.getEmail2());
		vo.setAddress("[" + vo.getZipCode() + "]" + vo.getAddress1() + vo.getAddress2());
		System.out.println(vo.toString());
		userDao.insert(vo);
	}

	/* 이름과 전화번호로 회원가입 */
	public UserVo insertUserNamePhone(UserVo uservo){
		userDao.insertUserNamePhone(uservo);
		return uservo;
	}
	
	
	public UserVo login(String id, String password) { 
		return userDao.get(id, password);
	}

	public void updateInfo(UserVo vo) {
		try {
			userDao.update(vo);
		} catch (UserInfoUpdateException e) {

		}
	}

	public UserVo getUserInfo(Long no) {
		return userDao.get(no); 
	}

	public String getId(UserVo userVo) throws Exception {//아이디 찾기
		UserVo authUser = userDao.getId(userVo);
		if(authUser !=null){
	
		Email mail = new Email();
			String reciver = authUser.getEmail(); // 받을사람의 이메일입니다.
			String subject = "[뷰티라인] 아이디 찾기 안내 메일";
			String content = authUser.getName() + "님의 아이디는 " + authUser.getId() + "입니다.\n";

			mail.setReciver(reciver);
			mail.setSubject(subject);
			mail.setContent(content);
			emailSender.SendEmail(mail);
			return "found";
		}
		else {
			return "notFound";
		}
	}

	
	public String getPw(UserVo vo) throws Exception {//임시 패스워드 만드는 동시에 update해야함 
		UserVo authUser = userDao.getPw(vo);
		if(authUser !=null){
	
			StringBuffer buffer = new StringBuffer();
			Random random = new Random();
					
			String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9".split(",");
					
			for (int i = 0; i < 9; i++) {
			buffer.append(chars[random.nextInt(chars.length)]);
			}
			Email mail = new Email();
				
		
			String reciver = authUser.getEmail(); // 받을사람의 이메일입니다.
			String subject = "[뷰티라인] 비밀번호 찾기 안내 메일";
			String content = authUser.getName() + "님의 임시 비밀번호는 " + buffer.toString() + "입니다.\n"
							+ "로그인 후 비밀번호를 변경해 주세요^^.";

			mail.setReciver(reciver);
			mail.setSubject(subject);
			mail.setContent(content);
			emailSender.SendEmail(mail);
			
			/* 임시비밀번호 update*/
			userDao.updateTemPw(buffer.toString(),authUser.getNo());
			return "found";
		}
		else {
			return "notFound";
		}
	}
	
	public String checkId(String id) {
		UserVo vo = userDao.checkId(id);

		if (vo != null) {
			return "exists";
		} else {
			return "ok";
		}
	}
}
