package innssa.vo;

public class ReplyVO {
	
	private String rno;
	private String no;
	private String id;
	private String rcontents;
	private String rdate;
	private String nick;
	
	public ReplyVO() {
		
		rno 	   = "";
		no 		   = "";
		id 		   = "";
		rcontents  = "";
		rdate 	   = "";
		nick 	   = "";
	}

	public String getRno() 		  { return rno; 	   }
	public String getNo() 		  { return no; 		   }
	public String getId() 		  { return id; 		   }
	public String getRcontents()  { return rcontents;  }
	public String getRdate() 	  { return rdate; 	   }
	public String getNick() 	  { return nick; 	   }
	
	public void setRno(String rno) 				 { this.rno = rno; 				 }
	public void setNo(String no) 				 { this.no = no; 				 }
	public void setId(String id) 				 { this.id = id; 				 }
	public void setRcontents(String rcontents) 	 { this.rcontents = rcontents; 	 }
	public void setRdate(String rdate) 			 { this.rdate = rdate; 			 }
	public void setNick(String nick) 			 { this.nick = nick; 			 }
	
	

}
