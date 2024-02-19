
package innssa.dto;

import java.util.ArrayList;

import innssa.dao.DBManager;
import innssa.vo.BoardVO;
import innssa.vo.HomePicVO;
import innssa.vo.UserVO;

public class ListDTO extends DBManager
{
   
   public int GetTotal(String type,String keyword)
   {
      this.DBOpen();
      
      String sql = "";
      
      sql  = "select count(*) as total  ";
      sql += "from board ";

      sql += "where type = '" + type + "' ";

      if( !keyword.equals("") )
      {
         sql += "and title like '%" + _R(keyword) + "%' ";
      }

      this.RunSelect(sql);
      this.GetNext();            
      int total = Integer.parseInt(this.GetValue("total")); 
      
      this.DBClose();
      return total;
   }
   
  
   public ArrayList<BoardVO> GetList(int pageNo,String type,String keyword)
   {
      ArrayList<BoardVO> list = new ArrayList<BoardVO>();
      
      this.DBOpen();
      
      String sql = "";
      
      sql  = "select no,title,date(wdate) as wdate,hit,likey, ";
      sql += "(select name from user where id = board.id) as name, ";
      sql += "(select count(*) from reply where no = board.no) as rcount ";
      sql += "from board ";

      sql += "where type = '" + type + "' ";

      if( !keyword.equals("") )
      {
         sql += "and title like '%" + _R(keyword) + "%' ";
      }   

      sql += "order by no desc ";
      int startno = 10 * (pageNo - 1);
      sql += "limit " + startno + ",10 ";      
      this.RunSelect(sql);
      while( this.GetNext() == true)
      {
         BoardVO vo = new BoardVO();
         vo.setNo(this.GetValue("no"));
         vo.setTitle(this.GetValue("title"));
         vo.setWdate(this.GetValue("wdate"));
         vo.setHit(this.GetValue("hit"));
         vo.setName(this.GetValue("name"));
         vo.setRcount(this.GetValue("rcount"));
         vo.setLikey(this.GetValue("likey"));
         
         list.add(vo);
      }      
      this.DBClose();
      
      return list;      
   }
   
   public ArrayList<BoardVO> GetMainList(String type)
   {
	   ArrayList<BoardVO> list = new ArrayList<BoardVO>();
	   
	   this.DBOpen();
	   
	   String sql = "";
	   
	   sql  = "select no,id,title,date(wdate) as wdate,hit,likey, ";
	   sql += "(select nick_name from user where id = board.id) as nick_name, ";
	   sql += "(select count(*) from reply where no = board.no) as count ";
	   
	   if( type.equals("A") ) {
		   
		   sql += "from board ";
	   }else {
		   sql += "from board ";
		   sql += "where type = '" + type + "' ";
	   }
  
	   sql += "order by no desc "; 
	   sql += "limit 0,4 ";
	   this.RunSelect(sql);
	   while( this.GetNext() == true)
	   {
		   BoardVO vo = new BoardVO();
		   vo.setNo(this.GetValue("no"));
		   vo.setId(this.GetValue("id"));
		   vo.setTitle(this.GetValue("title"));
		   vo.setWdate(this.GetValue("wdate"));
		   vo.setHit(this.GetValue("hit"));
		   vo.setNick_name(this.GetValue("nick_name"));
		   vo.setRcount(this.GetValue("count"));
		   vo.setLikey(this.GetValue("likey"));
		   
		   list.add(vo);
	   }      
	   this.DBClose();
	   
	   return list;      
   }
   
   
   public ArrayList<BoardVO> GetMyList(String id,String type)
   {
	   ArrayList<BoardVO> list = new ArrayList<BoardVO>();
	   
	   this.DBOpen();
	   
	   String sql = "";
	   
	   sql  = "select no,title,date(wdate) as wdate,hit,likey, ";
	   sql += "(select name from user where id = board.id) as name, ";
	   sql += "(select count(*) from reply where no = board.no) as count ";
	   sql += "from board ";
	   if( type.equals("A") ) {
		   
		   sql += "where id = '" + id + "' ";
	   }else {
		   sql += "where id = '" + id + "' ";
		   sql += "and type = '" + type + "' ";
	   }
	   
	   sql += "order by no desc "; 
	   this.RunSelect(sql);
	   while( this.GetNext() == true)
	   {
		   BoardVO vo = new BoardVO();
		   vo.setNo(this.GetValue("no"));
		   vo.setTitle(this.GetValue("title"));
		   vo.setWdate(this.GetValue("wdate"));
		   vo.setHit(this.GetValue("hit"));
		   vo.setName(this.GetValue("name"));
		   vo.setRcount(this.GetValue("count"));
		   vo.setLikey(this.GetValue("likey"));
		   
		   list.add(vo);
	   }      
	   this.DBClose();
	   
	   return list;      
   }
   
   public ArrayList<HomePicVO> GetHomePic(String id) {
	   
	   ArrayList<HomePicVO> list = new ArrayList<HomePicVO>();
	   
	   this.DBOpen();
	   
	   String sql = "";
	   sql = "select *from home_pic ";
	   sql += "where id = '" + id + "' ";
	   sql += "order by pno desc ";
	   sql += "limit 0,4 ";
	   this.RunSelect(sql);
	   while( this.GetNext() == true ) {
		   
		   HomePicVO vo = new HomePicVO();
		   vo.setId(id);
		   vo.setPno(this.GetValue("pno"));
		   vo.setHpic_logname(this.GetValue("hpic_logname"));
		   vo.setHpic_phyname(this.GetValue("hpic_phyname"));
		   
		   list.add(vo);
	   }
	   
	   this.DBClose();
	   return list;
   }
   
   public ArrayList<UserVO> GetRanking() {
	   
	   ArrayList<UserVO> list = new ArrayList<UserVO>();
	   
	   this.DBOpen();
	   
	   String sql = "";
	   sql = "select id, nick_name, ";
	   sql += "(select count(*) from follower where id = user.id) as follower ";
	   sql += "order by follower desc ";
	   this.RunSelect(sql);
	   while( this.GetNext() == true ) {
		   UserVO vo = new UserVO();
		   vo.setId(this.GetValue("id"));
		   vo.setNick_name(this.GetValue("nick_name"));
		   vo.setFollower(this.GetValue("follower"));
		   list.add(vo);
		   
		   this.DBClose();
		   return list;
	   }
	   
	   this.DBClose();
	   return null;
   }
}