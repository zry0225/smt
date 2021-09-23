package com.zyg.smt.util;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author:zhangruiyan
 * @Mail:15738484566@163.com
 * @CreateTime:2021-05-12
 */
public class exportUtil {
    /**
     * xlsx通用下载工具
     * @param list
     *            需要写入到表格中的数据
     * @param strings
     *            表格中第一行的所有单元格的值
     * @return
     */
    public static <E> XSSFWorkbook getBook(List<E> list, String... strings) {
        // 我们需要响应给用户的是一个xlsx类型的文件,所以我们需要先将文件创建出来
        XSSFWorkbook book = new XSSFWorkbook();
        // 通过文件 创建一个 sheet页
        XSSFSheet sheet = book.createSheet();
        //设置默认宽度
        sheet.setDefaultColumnWidth(500);
        // 通过页创建行
        XSSFRow row = sheet.createRow(0);
        // 通过行创建单元格
        for (int i = 0; i < strings.length; i++) {
            row.createCell(i).setCellValue(strings[i]);
        }
        // 通过反射实现下面功能
        for (int j=0;j<list.size();j++) {
            E e =list.get(j);
            Class c = e.getClass();
            //创建行
            XSSFRow rows = sheet.createRow(j+1);
            // 获得到了对象的属性集合
            Field[] fields = c.getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                fields[i].setAccessible(true);
                if (fields[i].getType().equals(String.class)) {
                    try {
                        rows.createCell(i).setCellValue((String)fields[i].get(e));
                    } catch (Exception e1) {
                        e1.printStackTrace();
                    }
                }
                if (fields[i].getType().equals(Integer.class)) {
                    try {
                        rows.createCell(i).setCellValue((Integer)fields[i].get(e));
                    } catch (Exception e1) {
                        e1.printStackTrace();
                    }
                }

                if (fields[i].getType().equals(Date.class)) {
                    try {
                        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                        String format1 = format.format(fields[i].get(e));
                        rows.createCell(i).setCellValue(format1);
                    } catch (Exception e1) {
                        e1.printStackTrace();
                    }
                }



            }

        }
        return book;
    }
}
