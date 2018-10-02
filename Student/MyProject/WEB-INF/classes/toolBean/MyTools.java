package toolBean;
import java.io.UnsupportedEncodingException;

public class MyTools {
	
	public static String toChinese(String str,String charset){
		if(str==null) str="";
		try{
			str=new String(str.getBytes("ISO-8859-1"),charset);
		}
		catch(UnsupportedEncodingException e){
			str="";
			e.printStackTrace();
		}
		return str;
	}
	public static String toChinese(String str){
		return MyTools.toChinese(str, "UTF-8");
	}
	
	public static int strToint(String str){  //String תΪint
		if(str==null||str.equals(""))
			str="0";
		int i=0;
		try{
			i=Integer.parseInt(str);
		}catch(NumberFormatException e){
			i=0;
			e.printStackTrace();
		}
		return i;
	}
}
