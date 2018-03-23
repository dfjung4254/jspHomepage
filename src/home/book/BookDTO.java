package home.book;

import java.util.Date;

public class BookDTO {
	
	//1.Table 필드값을 멤버변수화함.
	private String name;
	private String writer;
	private String publisher;
	private int price;
	private Date day;
	
	//Constructor
	public BookDTO() {
		
	}

	//Methods(getter, setter)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}
	
}
