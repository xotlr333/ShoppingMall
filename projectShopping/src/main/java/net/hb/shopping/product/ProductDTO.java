package net.hb.shopping.product;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private String brand;
	private String title;
	private String content;
	private int delivery;
	private int price;
	private int category;
	private String color;
	private String psize; 
	private Date wdate;
	private String img;
	private int code;
	private int rn;
	
	private String categ;
	private String pcategory;
	private int start;
	private int end;
	private String keyword;
	
	private MultipartFile upload_f1;
	private MultipartFile upload_f2;
	
	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getPcategory() {
		return pcategory;
	}
	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getCateg() {
		return categ;
	}
	public void setCateg(String categ) {
		this.categ = categ;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getPsize() {
		return psize;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	public MultipartFile getUpload_f1() {
		return upload_f1;
	}
	public void setUpload_f1(MultipartFile upload_f1) {
		this.upload_f1 = upload_f1;
	}
	public MultipartFile getUpload_f2() {
		return upload_f2;
	}
	public void setUpload_f2(MultipartFile upload_f2) {
		this.upload_f2 = upload_f2;
	}
	
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
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	
	
	
	

}
