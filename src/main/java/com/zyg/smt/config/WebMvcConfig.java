package com.zyg.smt.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @Author:zhangruiyan
 * @Mail:15738484566@163.com
 * @CreateTime:2021-04-09
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/img/**").addResourceLocations("file:/Users/zhangruiyan/Desktop/IdeaProjects/smt/src/main/webapp/img/");
    }
}
