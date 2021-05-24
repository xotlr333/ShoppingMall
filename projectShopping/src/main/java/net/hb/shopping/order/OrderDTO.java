package net.hb.shopping.order;

import java.util.Date;

public class OrderDTO {
	private String p_brand;
	private String p_title;
	private String p_color;
	private String p_psize;
	private String p_img_name;
	private String p_price;
	private String p_delivery;
	private int p_totalprice;
	
	private int u_code;
	private String u_name;
	private String u_phone;
	private String u_email;
	private String u_recipient;
	private String u_recipient_phone;
	private String u_postcode;
	private String u_roadAddress;
	private String u_detailAddress;
	private String u_memo;
	
	private String c_code;
	private String payMethod;
	private Date wdate;
	private int code;
	
	
	
	
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getP_delivery() {
		return p_delivery;
	}
	public void setP_delivery(String p_delivery) {
		this.p_delivery = p_delivery;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public String getP_brand() {
		return p_brand;
	}
	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_color() {
		return p_color;
	}
	public void setP_color(String p_color) {
		this.p_color = p_color;
	}
	public String getP_psize() {
		return p_psize;
	}
	public void setP_psize(String p_psize) {
		this.p_psize = p_psize;
	}
	public String getP_img_name() {
		return p_img_name;
	}
	public void setP_img_name(String p_img_name) {
		this.p_img_name = p_img_name;
	}
	public int getP_totalprice() {
		return p_totalprice;
	}
	public void setP_totalprice(int p_totalprice) {
		this.p_totalprice = p_totalprice;
	}
	public int getU_code() {
		return u_code;
	}
	public void setU_code(int u_code) {
		this.u_code = u_code;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_recipient() {
		return u_recipient;
	}
	public void setU_recipient(String u_recipient) {
		this.u_recipient = u_recipient;
	}
	public String getU_recipient_phone() {
		return u_recipient_phone;
	}
	public void setU_recipient_phone(String u_recipient_phone) {
		this.u_recipient_phone = u_recipient_phone;
	}
	public String getU_postcode() {
		return u_postcode;
	}
	public void setU_postcode(String u_postcode) {
		this.u_postcode = u_postcode;
	}
	public String getU_roadAddress() {
		return u_roadAddress;
	}
	public void setU_roadAddress(String u_roadAddress) {
		this.u_roadAddress = u_roadAddress;
	}
	public String getU_detailAddress() {
		return u_detailAddress;
	}
	public void setU_detailAddress(String u_detailAddress) {
		this.u_detailAddress = u_detailAddress;
	}
	public String getU_memo() {
		return u_memo;
	}
	public void setU_memo(String u_memo) {
		this.u_memo = u_memo;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	
	
	

}
