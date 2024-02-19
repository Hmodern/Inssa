package innssa.vo;

public class HomePicVO {
	
	private String pno;
	private String id;
	private String hpic_logname;
	private String hpic_phyname;
	
	public HomePicVO() {
		
		pno			 = "";
		id 			 = "";
		hpic_logname = "";
		hpic_phyname = "";
	}

	public String getPno() 			{ return pno; 		   }
	public String getId() 			{ return id; 		   }
	public String getHpic_logname() { return hpic_logname; }
	public String getHpic_phyname() { return hpic_phyname; }
	
	public void setPno(String pno) 					 { this.pno = pno; 					 }
	public void setId(String id) 					 { this.id = id; 					 }
	public void setHpic_logname(String hpic_logname) { this.hpic_logname = hpic_logname; }
	public void setHpic_phyname(String hpic_phyname) { this.hpic_phyname = hpic_phyname; }
	
	

}
