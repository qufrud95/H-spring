package net.developia.project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int rid;
	private int bid;
	
	
	private String content;
	private String reg_id;
	private Date reg_dt;
	private Date edit_dt;
	
	
}
