package innssa.dto;

import java.util.ArrayList;

import innssa.dao.DBManager;
import innssa.vo.FollowerVO;
import innssa.vo.UserVO;

public class FollowerDTO extends DBManager{
	
	public boolean Follower(FollowerVO vo) {
		this.DBOpen();
		
		String sql = "";
		
		sql = "select *from follower ";
		sql += "where id = '" + vo.getId() + "' ";
		sql += "and follower_id = '" + vo.getFollower_id() + "' ";
		this.RunSelect(sql);
		
		if( this.GetNext() == false ) {
			
			//팔로우가 안눌려 있을때
			sql = "insert into follower (id, follower_id) ";
			sql += "values ( ";
			sql += "'" + vo.getId() + "', ";
			sql += "'" + vo.getFollower_id()  + "') ";
			this.RunCommand(sql);
			this.DBClose();
			return true;
		}
			
		//팔로우가 눌려있을때
		sql = "delete from follower where ";
		sql	+= "id = '" + vo.getId() + "' ";
		sql += "and follower_id = '" + vo.getFollower_id() + "' " ;
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
		
		
	}
	
	public FollowerVO FRead(String id,String fid) {
		this.DBOpen();
		
		String sql = "";
		
		sql = "select *from follower ";
		sql += "where id = '" + id + "' ";
		sql += "and follower_id = '" + fid + "' ";
		this.RunSelect(sql);
		
		if( this.GetNext() == false ) {
			
			this.DBClose();
			return null;
		}
		FollowerVO vo = new FollowerVO();
		vo.setFollower_id(this.GetValue("follower_id"));
		this.DBClose();
		return vo;
		
	}
	

}
	
