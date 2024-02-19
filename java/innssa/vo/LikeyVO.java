package innssa.vo;

public class LikeyVO {
	
	private String id;
	private String no;
	private String lno;
	private String liker_id;
	
	public LikeyVO() {
		
		id 		  = "";
		no		  = "";
		lno 	  = "";
		liker_id  = "";
	}

	public String getId() 		{ return id; 	   }
	public String getNo() 		{ return no; 	   }
	public String getLno() 	 	{ return lno; 	   }
	public String getLiker_id() { return liker_id; }
	
	public void setId(String id) 			   { this.id = id; 				 }
	public void setNo(String no) 			   { this.no = no; 				 }
	public void setLno(String lno) 		  	   { this.lno = lno; 			 }
	public void setLiker_id(String liker_id)   { this.liker_id = liker_id;   }
	
	
	

	
	

}
