package net.hb.crud;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO { //Data Transfer Object=VO=bean
	private String name;
	private String title;
	private String content;
	private String gender;
	private String hobby;

	private int hit;
	private String email;
	private java.util.Date  wdate;
	
	private int rn;
	private int hobby_idx;
	private String img_file_name;//hobby테이블에 있는 진짜필드
	private MultipartFile upload_f; //진짜접근없는필드 가짜로 먼저 접근
	//boardWrite.jsp문서 파일: <input type="file" name="upload_f">
	
	//페이징, 검색
	private int start, end;
	private String skey, sval;
	private int rcnt;
	
	public String getTitle() {return title;	}
	public void setTitle(String title) {this.title = title;	}
	public String getName() {return name;	}
	public void setName(String name) {	this.name = name;	}
	public String getContent() {return content;	}
	public void setContent(String content) {this.content = content;	}
	public String getGender() {	return gender;	}
	public void setGender(String gender) {this.gender = gender;	}
	public String getHobby() {	return hobby;	}
	public void setHobby(String hobby) {this.hobby = hobby;	}
	public int getHit() {	return hit;	}
	public void setHit(int hit) {	this.hit = hit;	}
	public String getEmail() {return email;	}
	public void setEmail(String email) {this.email = email;	}
	public java.util.Date getWdate() {return wdate;	}
	public void setWdate(java.util.Date wdate) {this.wdate = wdate;	}
	public int getRn() {return rn;	}
	public void setRn(int rn) {	this.rn = rn;	}
	public int getHobby_idx() {	return hobby_idx;	}
	public void setHobby_idx(int hobby_idx) {this.hobby_idx = hobby_idx;}
	public String getImg_file_name() {return img_file_name;	}
	public void setImg_file_name(String img_file_name) {this.img_file_name = img_file_name;	}
	public MultipartFile getUpload_f() {return upload_f;}
	public void setUpload_f(MultipartFile upload_f) {this.upload_f = upload_f;}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getSkey() {
		return skey;
	}
	public void setSkey(String skey) {
		this.skey = skey;
	}
	public String getSval() {
		return sval;
	}
	public void setSval(String sval) {
		this.sval = sval;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	
  
} //class END
