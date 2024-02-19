package innssa.dto;

import innssa.dao.DBManager;
import innssa.vo.FollowerVO;
import innssa.vo.LikeyVO;

public class LikeyDTO extends DBManager{
	
	public boolean Blikey(LikeyVO vo, boolean ishit) {
		this.DBOpen();
		
		String sql = "";
		
		sql = "select *from blikey ";
		sql += "where no = " + vo.getNo() + " and id = '" + vo.getId() + "' ";
		sql += "and bliker_id = '" + vo.getLiker_id() + "' ";
		this.RunSelect(sql);
		
		if( this.GetNext() == false ) {
			
			//좋아요가 안눌려 있을때
			sql = "insert into blikey (id, no, bliker_id) ";
			sql += "values ( ";
			sql += "'" + vo.getId() + "', ";
			sql += "" + vo.getNo()  + ", ";
			sql += "'" + vo.getLiker_id() + "') ";
			this.RunCommand(sql);
			this.DBClose();
			return true;
		}
			
		//좋아요가 눌려있을때
		sql = "delete from blikey where ";
		sql	+= "id = '" + vo.getId() + "' ";
		sql	+= "and no = " + vo.getNo() + " ";
		sql += "and bliker_id = '" + vo.getLiker_id() + "' " ;
		this.RunCommand(sql);
		
		//조회수 감소 처리
	      if(ishit == true)
	      {
	         sql = "update board set hit = hit - 1 where no = " + vo.getNo();
	         this.RunCommand(sql);         
	      }
		
		
		this.DBClose();
		return true;
		
		
	}
	
	public boolean Plikey(LikeyVO vo) {
		this.DBOpen();
		
		String sql = "";
		
		sql = "select *from plikey ";
		sql += "where id = '" + vo.getId() + "' ";
		sql += "and pliker_id = '" + vo.getLiker_id() + "' ";
		this.RunSelect(sql);
		
		if( this.GetNext() == false ) {
			
			//좋아요가 안눌려 있을때
			sql = "insert into plikey (id, pliker_id) ";
			sql += "values ( ";
			sql += "'" + vo.getId() + "', ";
			sql += "'" + vo.getLiker_id() + "') ";
			this.RunCommand(sql);
			this.DBClose();
			return true;
		}
		
		//좋아요가 눌려있을때
		sql = "delete from plikey where ";
		sql	+= "id = '" + vo.getId() + "' ";
		sql += "and pliker_id = '" + vo.getLiker_id() + "' " ;
		this.RunCommand(sql);
		
		
		
		this.DBClose();
		return true;
		
		
	}
	
	public LikeyVO PLRead(String id,String lid) {
		this.DBOpen();
		
		String sql = "";
		
		sql = "select *from plikey ";
		sql += "where id = '" + id + "' ";
		sql += "and pliker_id = '" + lid + "' ";
		this.RunSelect(sql);
		
		if( this.GetNext() == false ) {
			
			this.DBClose();
			return null;
		}
		LikeyVO vo = new LikeyVO();
		vo.setLiker_id(this.GetValue("pliker_id"));
		this.DBClose();
		return vo;
		
	}
	
	public LikeyVO BLRead(String id,String lid) {
		this.DBOpen();
		
		String sql = "";
		
		sql = "select *from blikey ";
		sql += "where id = '" + id + "' ";
		sql += "and bliker_id = '" + lid + "' ";
		this.RunSelect(sql);
		
		if( this.GetNext() == false ) {
			
			this.DBClose();
			return null;
		}
		LikeyVO vo = new LikeyVO();
		vo.setLiker_id(this.GetValue("bliker_id"));
		this.DBClose();
		return vo;
		
	}
}
