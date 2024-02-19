package innssa.dto;

import innssa.dao.DBManager;
import innssa.vo.BoardVO;
import innssa.vo.LikeyVO;

public class BoardDTO extends DBManager{
	
	public boolean Insert(BoardVO vo) {
		
		this.DBOpen();
		
		String sql = "";
		
		sql += "insert into board (id,title,type,contents,phyname,logname,pic_phyname,pic_logname) ";
		sql += "values (";
		sql += "'" + vo.getId() + "',";
		sql += "'" + vo.getTitle() + "',";
		sql += "'" + vo.getType() + "',";
		sql += "'" + vo.getContents() + "',";
		if ( !vo.getPhyname().equals("")) {
			sql += "'" + vo.getPhyname() + "',";
			sql += "'" + vo.getLogname() + "',";
		}else
		{
			sql += "null,";
			sql += "null,";
		}
		if ( !vo.getPic_phyname().equals("")) {
			sql += "'" + vo.getPic_phyname() + "',";
			sql += "'" + vo.getPic_logname() + "'";
		}else
		{
			sql += "null,";
			sql += "null";
		}		
		sql += ")";
		
		this.RunCommand(sql);
		
		//등록된 게시물의 번호를 얻는다
		sql = "select last_insert_id() as no ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setNo(this.GetValue("no"));

		this.DBClose();
		return true;
	}
	
	public boolean Update(BoardVO vo) {
		
		this.DBOpen();
		
		String sql = "";
		
		sql = "update board set ";
		sql += "title = '" + _R(vo.getTitle()) + "', ";
		
		
		if( !vo.getPhyname().equals("")) {
			
			//첨부파일 있을 경우
			sql += "type = '" + _R(vo.getType()) + "', ";
			sql += "phyname = '" + _R(vo.getPhyname()) + "',";
			sql += "logname = '" + _R(vo.getLogname()) + "',";
		}else {
			
			sql += "type = '" + _R(vo.getType()) + "', ";
		}
		
		if( !vo.getPic_phyname().equals("")) {
			
			//사진 있을 경우
			sql += "contents = '" + _R(vo.getContents()) + "', ";
			sql += "pic_phyname = '" + _R(vo.getPic_phyname()) + "', ";
			sql += "pic_logname = '" + _R(vo.getPic_logname()) + "' ";
		}else {
			
			sql += "contents = '" + _R(vo.getContents()) + "' ";
		}
		
		sql += "where no = " + vo.getNo();
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}
	
	public boolean Delete(String no) {
		
		this.DBOpen();
		
		String sql = "";
		
		sql = "delete from reply where no = " + no;
		this.RunCommand(sql);
		
		sql = "delete from board where no = " + no;
		this.RunCommand(sql);
		
		
		this.DBClose();
		return true;
	}
	
	public BoardVO Read(String no,boolean ishit) {
		this.DBOpen();
		
		String sql = "";
		
		sql = "select id, title, contents, type, phyname, logname, pic_phyname, pic_logname, date(wdate) as wdate, hit, ";
		sql += "(select name from user where id = board.id) as name, ";
		sql += "(select nick_name from user where id = board.id) as nick_name, ";
		sql += "(select count(*) from blikey where no = board.no) as likey ";
		sql += "from board where no = " + no;
		this.RunSelect(sql);
		if(this.GetNext() == false) {
			
			//해당 게시물 없음
			this.DBClose();
			return null;
		}
		BoardVO vo = new BoardVO();
		vo.setNo(no);
		vo.setId(this.GetValue("id"));
		vo.setTitle(this.GetValue("title"));
		vo.setName(this.GetValue("name"));
		vo.setNick_name(this.GetValue("nick_name"));
		vo.setContents(this.GetValue("contents"));
		vo.setType(this.GetValue("type"));
		vo.setPhyname(this.GetValue("phyname"));
		vo.setLogname(this.GetValue("logname"));
		vo.setPic_phyname(this.GetValue("pic_phyname"));
		vo.setPic_logname(this.GetValue("pic_logname"));
		vo.setWdate(this.GetValue("wdate"));
		vo.setHit(this.GetValue("hit"));
		vo.setLikey(this.GetValue("likey"));
		
		//조회수 증가 처리
	      if(ishit == true)
	      {
	         sql = "update board set hit = hit + 1 where no = " + no;
	         this.RunCommand(sql);         
	      }
		
		
		this.DBClose();
		return vo;
	}
	
	
		
		

	

	
}
