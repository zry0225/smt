package com.zyg.smt;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**ø
 * @author zhangruiyan
 */
@MapperScan(value = "com.zyg.smt.mapper")
@SpringBootApplication
public class SmtApplication {

    public static void main(String[] args) {
        SpringApplication.run(SmtApplication.class, args);
    }
}
