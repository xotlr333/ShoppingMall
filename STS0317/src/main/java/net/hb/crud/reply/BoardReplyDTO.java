package net.hb.crud.reply;

public class BoardReplyDTO {
	private int rrn;
	private int rhobby_idx;
	private int hobby_idx;
	private String rmemo;
	private String rwriter;
	
	public int getRrn() {
		return rrn;
	}
	public void setRrn(int rrn) {
		this.rrn = rrn;
	}
	public int getRhobby_idx() {
		return rhobby_idx;
	}
	public void setRhobby_idx(int rhobby_idx) {
		this.rhobby_idx = rhobby_idx;
	}
	public int getHobby_idx() {
		return hobby_idx;
	}
	public void setHobby_idx(int hobby_idx) {
		this.hobby_idx = hobby_idx;
	}
	public String getRmemo() {
		return rmemo;
	}
	public void setRmemo(String rmemo) {
		this.rmemo = rmemo;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	
	
}//calss end
