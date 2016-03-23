package com.manager.util;

import java.util.UUID;

public class UuidCreat {
	public static String  getUuid(String str){
		
		String uuid = UUID.randomUUID().toString();
		return str+uuid;
	}
	
}
