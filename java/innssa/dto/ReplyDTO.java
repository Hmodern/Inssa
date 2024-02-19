package innssa.dto;

import java.util.ArrayList;

import innssa.dao.DBManager;
import innssa.vo.ReplyVO;

public class ReplyDTO extends DBManager
{
   //댓글을 등록한다.
   public boolean Insert(ReplyVO vo)
   {
      this.DBOpen();

      //댓글을 Insert 한다.
      String sql = "";
      sql += "insert into reply (no,id,rcontents) values ";
      sql += "('" + vo.getNo() + "','" + vo.getId() + "','" +_R(vo.getRcontents()) + "') ";
      this.RunCommand(sql);      
      
      //등록된 댓글의 번호를 얻는다.
      sql = "select last_insert_id() as no ";
      this.RunSelect(sql);
      this.GetNext();
      vo.setRno(this.GetValue("no"));      
      
      this.DBClose();
      return true;
   }
   
   //댓글을 삭제한다.
   public boolean Delete(String rno)
   {
      this.DBOpen();
      
      String sql = "";

      sql = "delete from reply where rno = " + rno;
      this.RunCommand(sql);
      
      this.DBClose();
      
      return true;      
   }
      
   //댓글의 목록을 조회한다.
   public ArrayList<ReplyVO> GetList(String no)
   {
      ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();
      
      this.DBOpen();
      
      String sql = "";
      sql  = "select rno,id,rcontents,date(rdate) as rdate,";
      sql += "(select nick_name from user where id = reply.id) as rnick ";
      sql += "from reply ";
      sql += "where no = " + no + " ";
      sql += "order by rno desc ";
      this.RunSelect(sql);
      while(this.GetNext() == true)
      {
         ReplyVO vo = new ReplyVO();
         vo.setRno(this.GetValue("rno"));
         vo.setNo(no);
         vo.setId(this.GetValue("id"));
         vo.setRcontents(this.GetValue("rcontents"));
         vo.setRdate(this.GetValue("rdate"));
         vo.setNick(this.GetValue("rnick"));
         
         list.add(vo);
      }
      
      this.DBClose();
      return list;
   }
   
   
}