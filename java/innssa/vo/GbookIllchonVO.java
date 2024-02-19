package innssa.vo;

public class GbookIllchonVO {
	
	private String gino;
	private String id;
	private String gicontents;
	private String gidate;
	private String giwriter_id;
	private String gitype;
	private String ginick;
	
	public GbookIllchonVO() {
		
		gino 		= "";
		id 			= "";
		gicontents 	= "";
		gidate 		= "";
		giwriter_id = "";
		gitype 		= "";
		ginick		= "";
	}

	public String getGino() 	   { return gino; 		 }
	public String getId() 		   { return id; 		 }
	public String getGicontents()  { return gicontents;  }
	public String getGidate() 	   { return gidate; 	 }
	public String getGiwriter_id() { return giwriter_id; }
	public String getGitype() 	   { return gitype; 	 }
	public String getGinick() 	   { return ginick; 	 }
	
	public void setGino(String gino) 			   { this.gino = gino; 				 }
	public void setId(String id) 				   { this.id = id; 					 }
	public void setGicontents(String gicontents)   { this.gicontents = gicontents; 	 }
	public void setGidate(String gidate) 		   { this.gidate = gidate; 			 }
	public void setGiwriter_id(String giwriter_id) { this.giwriter_id = giwriter_id; }
	public void setGitype(String gitype) 		   { this.gitype = gitype; 			 }
	public void setGinick(String ginick) 		   { this.ginick = ginick; 			 }
	
	

}
