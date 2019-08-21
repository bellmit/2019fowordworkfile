package com.bjrun.test;

public class testMain {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		String strValue = "ABCDEFG";
		strValue.substring(3);
		strValue.concat("123");
		System.out.println("result"+strValue);
		String value = new String("ABCDEFG");
		System.out.println(strValue==value);
	}
	
	


}
