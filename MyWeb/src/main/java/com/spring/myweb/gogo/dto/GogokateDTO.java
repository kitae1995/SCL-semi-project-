package com.spring.myweb.gogo.dto;

import com.spring.myweb.gogo.entity.Gogo;

public class GogokateDTO {
	
	private String kate;
	private String num;
	private String xCoord;
	private String yCoord;
	
	public GogokateDTO(Gogo g) {
		this.kate = g.getKate();
		this.num = g.getNum();
		this.xCoord = g.getXCoord();
		this.yCoord = g.getYCoord();
	}
}
