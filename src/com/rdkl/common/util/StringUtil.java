package com.rdkl.common.util;

public class StringUtil {

	public static String format(String str,int length){
		while(str.length() > length)
			length ++;
		while(str.length() < length){
			str = "0" + str;
		}
		return str;
	}
	
	public static String format(int num,int length){
		String str = Integer.toHexString(num);
		return format(str, length);
	}
	public static String escape(String html) {
		String exp1 = "<\\/?[^>]*>";      // HTML标记
		String exp2 = "([\\r\\n])[\\s]+";    // 换行、空格
		String exp3 = "<!--.*-->";    // HTML注释
		String exp4 = "\\p{Punct}";    // 非法字符
		html = html.replaceAll(exp1, "");
		html = html.replaceAll(exp2, "");
		html = html.replaceAll(exp3, "");
		html = html.replaceAll(exp4, "");
		return html;
	}
}
