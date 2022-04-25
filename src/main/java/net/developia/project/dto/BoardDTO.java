package net.developia.project.dto;

import java.io.Serializable;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data 

public class BoardDTO implements Serializable{
	
	private long no;
	private String title;
	private String name;
	private String content;
	private Date regdate; 
	private int  readcount;
	private String password;
	
	/* 검색 */
	private String type; 
	private String keyword;
	
	
	
	private String filename;
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getFileName() {
		return filename;
	}
	public void setFileName(String filename) {
		this.filename = filename;
	}
}
