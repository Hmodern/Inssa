package innssa.dto;

import java.util.ArrayList;

import innssa.dao.DBManager;
import innssa.vo.GbookIllchonVO;
import innssa.vo.ReplyVO;

public class GbookIllchonDTO extends DBManager{
		//댓글을 등록한다.
	   public boolean Insert(GbookIllchonVO vo)
	   {
	      this.DBOpen();

	      //댓글을 Insert 한다.
	      String sql = "";
	      sql += "insert into gbook_illchon (id, writer_id, gicontents, gitype) values ";
	      sql += "('" + vo.getId() + "','" + _R(vo.getGiwriter_id()) + "','" + _R(vo.getGicontents()) + "','" + vo.getGitype() + "') ";
	      this.RunCommand(sql);      
	      
	      //등록된 댓글의 번호를 얻는다.
	      sql = "select last_insert_id() as no ";
	      this.RunSelect(sql);
	      this.GetNext();
	      vo.setGino(this.GetValue("no"));      
	      
	      this.DBClose();
	      return true;
	   }
	   
	   //댓글을 삭제한다.
	   public boolean Delete(String gino)
	   {
	      this.DBOpen();
	      
	      String sql = "";

	      sql = "delete from gbook_illchon where gino = " + gino;
	      this.RunCommand(sql);
	      
	      this.DBClose();
	      
	      return true;      
	   }
	      
	   //댓글의 목록을 조회한다.
	   public ArrayList<GbookIllchonVO> GetList(String gitype,String id)
	   {
	      ArrayList<GbookIllchonVO> list = new ArrayList<GbookIllchonVO>();
	      
	      this.DBOpen();
	      
	      String sql = "";
	      sql  = "select gino,writer_id,gicontents,date(gidate) as gidate, ";
	      sql += "(select nick_name from user where id = gbook_illchon.writer_id) as ginick ";
	      sql += "from gbook_illchon ";
	      sql += "where gitype = '" + gitype + "' and id = '" + id + "' ";
	      sql += "order by gino desc ";
	      this.RunSelect(sql);
	      while(this.GetNext() == true)
	      {
	    	 GbookIllchonVO vo = new GbookIllchonVO();
	         vo.setGino(this.GetValue("gino"));
	         vo.setGiwriter_id(this.GetValue("writer_id"));
	         vo.setGicontents(this.GetValue("gicontents"));
	         vo.setGidate(this.GetValue("gidate"));
	         vo.setGinick(this.GetValue("ginick"));
	         
	         list.add(vo);
	      }
	      
	      this.DBClose();
	      return list;
	   }
}
