package com.spring.myweb.rest;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface IWeatherMapper {

	Map<String, String> getCoord(@Param("area1") String area1,@Param("area2") String area2); // 변수 2개 받으려면 @param으로 이렇게 해야함

}
