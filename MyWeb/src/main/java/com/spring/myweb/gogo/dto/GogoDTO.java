package com.spring.myweb.gogo.dto;

import com.spring.myweb.gogo.entity.Gogo;

public class GogoDTO {
	
	private String subJCode;
    private String facDesc;
    private String openHour;
    private String busStop;
    private String entrFree;
    private String closeDay;
    private String addr;
    private String homePage;
    private String xCoord;
    private String yCoord;
    private String num;
    private String facName;
    private String etcDesc;
    private String subWay;
    private String phne;
    private String mainImg;
    private String entrFee;
    private String openDay;
    public GogoDTO(Gogo gogo) {
    	
    	this.subJCode=gogo.getSubJCode();
    	this.facDesc =gogo.getFacDesc();
    	this.openHour=gogo.getOpenHour();
    	this.busStop=gogo.getBusStop();
    	this.entrFree=gogo.getEntrFree();
    	this.closeDay=gogo.getCloseDay();
    	this.addr=gogo.getAddr();
    	this.homePage=gogo.getHomePage();
    	this.num=gogo.getNum();
    	this.facName = gogo.getFacDesc();
    	this.etcDesc =gogo.getEtcDesc();
        this.subWay = gogo.getSubWay();
        this.phne = gogo.getPhne();
        this.mainImg=gogo.getMainImg();
        this.entrFee=gogo.getEntrFee();
        this.openDay=gogo.getOpenDay();
        this.xCoord = gogo.getXCoord();
        this.yCoord = gogo.getYCoord();
    }
}
