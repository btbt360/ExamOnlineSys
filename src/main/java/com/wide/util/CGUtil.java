package com.wide.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

public class CGUtil {
	
	/**
	 * @author cg
	 * 
	 * */
	public static String createUUid(){
		UUID uuid = UUID.randomUUID();
		return uuid+"";
	}

	public static void main(String[] args){
		//System.out.println(createUUid());
		List<String> list =new ArrayList<String>();
		list.add("1");
		list.add("2");
		list.add("3");
		list.add("4");
		list.add("5");
		list.add("6");
		list.add("7");
		list.add("8");
		list.add("9");
		list.add("10");
		list.add("11");
		list.add("12");
		list.add("13");
		list.add("14");
		list.add("15");
		list.add("16");
		list.add("17");
		list.add("18");
		list.add("19");
		list.add("20");
		list.add("21");
		for(int i=0;i<10;i++){
			Random rand = new Random();
			int icc = rand.nextInt(list.size()); //生成0-100以内的随机数
			//System.out.println(icc);
			System.out.println(list.get(icc));
			list.remove(icc);
		}
	}
	/**
	 * @author cg
	 * @param lastnum 上级num
	 * @param maxnum 本级别最大num
	 * @return sst当前最大的sort
	 * */
	public static Double createSort(Double lastnum ,Double maxnum ){
		String sst ="";
		String maxstr = maxnum+"";
		if(maxnum<1){
			if(lastnum>0){
				sst=lastnum+"1";
			}else{				
				sst="1";
			}
		}else{
			String[] maxs = maxstr.split("[.]");
			if(Integer.parseInt(maxs[1])>0){
				Double dwg=Math.pow(10,Double.parseDouble(maxs[1].length()+"")) * maxnum + 1;//现在最大的排序数
				dwg = dwg/Math.pow(10,Double.parseDouble(maxs[1].length()+""));
				sst = String.format("%.2f", dwg)+"";
			}else{
				sst = (maxnum+1)+"";
			}
		}
 		return Double.parseDouble(sst);
	}
	
	/**
	 * @author cg
	 * @param lastnum 上级num
	 * @return 当前级别数
	 **/
	public static int createLevelNum(Double lastnum){
		String zstr = (lastnum+"").split("[.]")[0];
		String xstr = (lastnum+"").split("[.]")[1];
		xstr = xstr.replace("0", "");
		if(xstr.length()==0){
			int levelnum = zstr.length()+1;
			return levelnum;
		}else {
			int levelnum = zstr.length()+1+xstr.length();
			return levelnum;
		}
			
		
	} 
	/**
	 * @author cg
	 * @param str 需要截取的字符串
	 * @param sprit 标识符
	 * @return List<String>
	 * */
	public static List<String> cutOffString(String str,String sprit){
		String[] strs = str.split("["+sprit+"]");
		List<String> list = new ArrayList<String>();
		for(int i = 0;i<strs.length;i++){
			if(strs[i]!=null&&!strs[i].equals("")){
				list.add(strs[i]);
			}
		}
		return list;
	}

	
}
