package innssa.vo;

public class UserVO {
	
	private String id;
	private String pw;
	private String name;
	private String nick_name;
	private String join_date;
	private String gender;
	private String mbti;
	private String status;
	private String profile_pic;
	private String profile_phy;
	private String one_line;
	private String follower;
	private String likey;
	private String bcount;
	
	public UserVO() {
		
		id 			= "";
		pw 			= "";
		name 		= "";
		nick_name 	= "";
		join_date 	= "";
		gender 		= "";
		mbti 		= "";
		status 		= "N";
		profile_pic = "";
		profile_phy = "";
		one_line 	= "";
		follower	= "";
		likey		= "";
		bcount		= "";
	}

	public String getId() 			{ return id; 		  }
	public String getPw() 			{ return pw; 		  }
	public String getName() 		{ return name; 		  }
	public String getNick_name() 	{ return nick_name;   }
	public String getJoin_date() 	{ return join_date;   }
	public String getGender() 		{ return gender; 	  }
	public String getMbti() 		{ return mbti; 		  }
	public String getStatus() 		{ return status; 	  }
	public String getProfile_pic() 	{ return profile_pic; }
	public String getProfile_phy() 	{ return profile_phy; }
	public String getOne_line() 	{ return one_line; 	  }
	public String getFollower() 	{ return follower; 	  }
	public String getLikey() 		{ return likey; 	  }
	public String getBcount() 		{ return bcount; 	  }

	public void setId(String id) 					{ this.id = id; 					}
	public void setPw(String pw) 					{ this.pw = pw; 					}
	public void setName(String name) 				{ this.name = name; 				}
	public void setNick_name(String nick_name) 		{ this.nick_name = nick_name; 		}
	public void setJoin_date(String join_date) 		{ this.join_date = join_date; 		}
	public void setGender(String gender) 			{ this.gender = gender; 			}
	public void setMbti(String mbti) 				{ this.mbti = mbti; 				}
	public void setStatus(String status) 			{ this.status = status; 			}
	public void setProfile_pic(String profile_pic) 	{ this.profile_pic = profile_pic; 	}
	public void setProfile_phy(String profile_phy) 	{ this.profile_phy = profile_phy; 	}
	public void setOne_line(String one_line) 		{ this.one_line = one_line; 		}
	public void setFollower(String follower) 		{ this.follower = follower; 		}
	public void setLikey(String likey) 				{ this.likey = likey; 				}
	public void setBcount(String bcount) 				{ this.bcount = bcount; 				}

	
	


}
