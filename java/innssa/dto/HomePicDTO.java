package innssa.dto;

import innssa.dao.DBManager;
import innssa.vo.HomePicVO;

public class HomePicDTO extends DBManager{
	
	public boolean picInsert(HomePicVO vo) {
		
		this.DBOpen();
		
		String sql = "";
		
		sql = "insert into home_pic (id, hpic_logname, hpic_phyname) ";
		sql += "values ( ";
		sql += "'" + vo.getId() + "', ";
		
		if ( vo.getHpic_phyname() != null ) {
			sql += "'" + vo.getHpic_logname() + "', ";
			sql += "'" + vo.getHpic_phyname() + "' ";
			sql += ") ";
		} else {
			
			sql += "null, ";
			sql += "null ";
			sql += ") ";
		}
		this.RunCommand(sql);
		
		//등록된 사진의 번호를 얻는다.
       sql = "select last_insert_id() as no ";
       this.RunSelect(sql);
       this.GetNext();
       vo.setPno(this.GetValue("no")); 
		

       this.DBClose();
       return true;
	}
	
	public boolean picUpdate(HomePicVO vo) {
		
		this.DBOpen();
		
		String sql = "";
		sql = "update home_pic set ";
		sql += "hpic_logname = '" + vo.getHpic_logname() + "', ";
		sql += "hpic_phyname = '" + vo.getHpic_phyname() + "' ";
		sql += "where pno = " + vo.getPno();
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}
	
	public boolean picDelete(String pno) {
		this.DBOpen();
		
		String sql = "";
		sql = "delete from home_pic ";
		sql += "where pno = " + pno;
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}
	
	public HomePicVO picRead(String id) {
		this.DBOpen();
		
		String sql = "";
		sql = "select pic_logname, pic_phyname ";
		sql += "from home_pic ";
		sql += "where id = '" + id + "' ";
		this.RunSelect(sql);
		if( this.GetNext() == false ) {
			
			this.DBClose();
			return null;
		}
		
		HomePicVO vo = new HomePicVO();
		vo.setHpic_logname(this.GetValue("pic_logname"));
		vo.setHpic_phyname(this.GetValue("pic_phyname"));
		
		this.DBClose();
		return vo;
	}

}
