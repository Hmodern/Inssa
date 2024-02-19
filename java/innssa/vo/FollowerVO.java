package innssa.vo;

public class FollowerVO {
	
	private String id;
	private String fno;
	private String follower_id;
	private String fdate;
	private String fcount;
	
	public FollowerVO() {
		
		id 			= "";
		fno 		= "";
		follower_id = "";
		fdate 		= "";
		fcount 		= "";
	}

	public String getId() 		   { return id; 		 }
	public String getFno() 		   { return fno; 		 }
	public String getFollower_id() { return follower_id; }
	public String getFdate() 	   { return fdate; 		 }
	public String getFcount() 	   { return fcount; 	 }
	
	public void setId(String id) 				   { this.id = id; 					 }
	public void setFno(String fno) 				   { this.fno = fno; 				 }
	public void setFollower_id(String follower_id) { this.follower_id = follower_id; }
	public void setFdate(String fdate) 			   { this.fdate = fdate; 			 }
	public void setFcount(String fcount) 		   { this.fcount = fcount; 			 }
	
	

}
