package innssa.dto;

import innssa.dao.DBManager;
import innssa.vo.BoardVO;
import innssa.vo.FollowerVO;
import innssa.vo.UserVO;

public class UserDTO extends DBManager{
	
	public boolean CheckID(String id) {
		
		this.DBOpen();
		
		String sql = "";
		sql = "select * from user where id = '" + this._R(id) + "' ";
		this.RunSelect(sql);
		if( this.GetNext() == true ) {
			
			//아이디가 있음
			this.DBClose();
			return true;
		}
		
		//아이디가 없음
		this.DBClose();
		return false;
	}
	
	public boolean Join(UserVO vo) {
		
		if(CheckID(vo.getId()) == true) {
			return false;
		}
		
		this.DBOpen();
		
		String sql = "";
		
		sql = "insert into user (id,pw,name,nick_name,gender,mbti,profile_pic,profile_phy,one_line) ";
		sql += "values (";
		sql += "'"+ _R(vo.getId()) +"', ";
		sql += "md5('"+ _R(vo.getPw()) +"'), ";
		sql += "'"+ _R(vo.getName()) +"', ";
		sql += "'"+ _R(vo.getNick_name()) +"', ";
		sql += "'"+ _R(vo.getGender()) +"', ";
		sql += "'"+ _R(vo.getMbti()) +"', ";
		
		if( vo.getProfile_pic() != null  && !vo.getProfile_pic().equals("") ) {
			
			//프로필 사진이 있을 경우
			sql += "'"+ _R(vo.getProfile_pic()) +"', ";
			sql += "'"+ _R(vo.getProfile_phy()) +"', ";
		}else {
			
			sql += "null, ";
			sql += "null, ";
		}
		
		sql += "'"+ _R(vo.getOne_line()) +"'";
		sql += ") ";
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}
	
	public UserVO Login(String id, String pw) {
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select id, name, nick_name, gender, mbti, profile_pic, profile_phy, one_line, ";
		sql += "(select count(*) from follower where id = user.id) as follower, ";
		sql += "(select count(*) from board where id = user.id) as bcount ";
		sql += "from user ";
		sql += "where id = '" + _R(id) + "' and md5('" + _R(pw) + "') ";
		//탈퇴 회원은 제외
		sql += "and status = 'N' ";
		this.RunSelect(sql);
		
		if( this.GetNext() == false ) {
			
			this.DBClose();
			return null;
		}
		
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setName(this.GetValue("name"));
		vo.setNick_name(this.GetValue("nick_name"));
		vo.setGender(this.GetValue("gender"));
		vo.setMbti(this.GetValue("mbti"));
		vo.setOne_line(this.GetValue("one_line"));
		vo.setProfile_pic(this.GetValue("profile_pic"));
		vo.setProfile_phy(this.GetValue("profile_phy"));
		vo.setFollower(this.GetValue("follower"));
		vo.setBcount(this.GetValue("bcount"));
		this.DBClose();
		return vo;
		
	}
	
	public UserVO GetUser(String id) {
		
		this.DBOpen();
		
		String sql = "";
		
		sql = "select id, name, nick_name, gender, mbti, profile_pic, profile_phy, one_line, ";
		sql += "(select count(*) from plikey where id = user.id) as likey, ";
		sql += "(select count(*) from follower where id = user.id) as follower ";
		sql += "from user ";
		sql += "where id = '" + id + "' ";
		//탈퇴 회원은 제외
		sql += "and status = 'N' ";
		this.RunSelect(sql);
		
		if( this.GetNext() == false ) {
			
			this.DBClose();
			return null;
		}
		
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setName(this.GetValue("name"));
		vo.setNick_name(this.GetValue("nick_name"));
		vo.setGender(this.GetValue("gender"));
		vo.setMbti(this.GetValue("mbti"));
		vo.setOne_line(this.GetValue("one_line"));
		vo.setLikey(this.GetValue("likey"));
		vo.setFollower(this.GetValue("follower"));
		vo.setProfile_pic(this.GetValue("profile_pic"));
		vo.setProfile_phy(this.GetValue("profile_phy"));
		this.DBClose();
		return vo;
		
	}	
	
	public boolean Update(UserVO vo) {
		
		this.DBOpen();
		
		String sql = "";
		
		sql = "update user set ";
		sql += "name = '" + _R(vo.getName()) + "', ";
		sql += "nick_name = '" + _R(vo.getNick_name()) + "', ";
		sql += "gender = '" + _R(vo.getGender()) + "', ";
		sql += "mbti = '" + _R(vo.getMbti()) + "', ";
		
		if( vo.getProfile_pic() != null && !vo.getProfile_pic().equals("") ) {
			
			//첨부파일 있을 경우
			sql += "one_line = '" + _R(vo.getOne_line()) + "', ";
			sql += "profile_pic = '" + _R(vo.getProfile_pic()) + "', ";
			sql += "profile_phy = '" + _R(vo.getProfile_phy()) + "' ";
		}else {
			
			sql += "one_line = '" + _R(vo.getOne_line()) + "' ";
		}
		
		sql += "where id = '" + vo.getId() + "' ";
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}
	
	

}
