package com.vti.entity;

import java.util.Arrays;

public class News implements INews {
	private int id;
	private String title;
	private String publishDate;
	private String author;
	private String content;
	private Float averageRate;
	private int[] rate;
	public static int COUNT = 0;
	public News(String title, String publishDate, String author, String
	content, int[] rate) {
	COUNT++;
	this.id = COUNT;
	this.title = title;
	this.publishDate = publishDate;
	this.author = author;
	this.content = content;
	this.averageRate = averageRate;
	this.rate = rate;
	}
	public News() {
		// TODO Auto-generated constructor stub
	
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the publishDate
	 */
	public String getPublishDate() {
		return publishDate;
	}
	/**
	 * @param publishDate the publishDate to set
	 */
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	/**
	 * @return the author
	 */
	public String getAuthor() {
		return author;
	}
	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) {
		this.author = author;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the averageRate
	 */
	public Float getAverageRate() {
		return averageRate;
	}
	/**
	 * @param averageRate the averageRate to set
	 */
	public void setAverageRate(Float averageRate) {
		this.averageRate = averageRate;
	}
	/**
	 * @return the rate
	 */
	public int[] getRate() {
		return rate;
	}
	/**
	 * @param rate the rate to set
	 */
	public void setRate(int[] rate) {
		this.rate = rate;
	}
	/**
	 * @return the cOUNT
	 */
	public static int getCOUNT() {
		return COUNT;
	}
	/**
	 * @param cOUNT the cOUNT to set
	 */
	public static void setCOUNT(int cOUNT) {
		COUNT = cOUNT;
	
	
	}
	@Override
	public void display() {
	System.out.println("News [title=" + title + ", publishDate=" + publishDate + ", author=" + author + "]");
		}	
	
	@Override
	public float calculate() {
	averageRate = (float) ((rate[0] + rate[1] + rate[2]) / 3);
	return averageRate;
	}
	
	@Override
	public String toString() {
		return "News [id=" + id + ", " + (title != null ? "title=" + title + ", " : "")
				+ (publishDate != null ? "publishDate=" + publishDate + ", " : "")
				+ (author != null ? "author=" + author + ", " : "")
				+ (content != null ? "content=" + content + ", " : "")
				+ (averageRate != null ? "averageRate=" + averageRate + ", " : "")
				+ (rate != null ? "rate=" + Arrays.toString(rate) : "") + "]";
	}
	}

	