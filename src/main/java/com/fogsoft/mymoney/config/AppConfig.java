package com.fogsoft.mymoney.config;


import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.orm.jpa.support.OpenEntityManagerInViewInterceptor;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.fogsoft.mymoney.interceptor.AuthenticationInterceptor;

//import com.fogsoft.mymoney.interceptor.AuthenticationInterceptor;
//import com.fogsoft.mymoney.model.Categoria;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.fogsoft.mymoney" })
@EnableTransactionManagement
public class AppConfig extends WebMvcConfigurerAdapter {
	@Bean
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();

		messageSource.setBasename("/WEB-INF/texts/messages");
		messageSource.setCacheSeconds(1);
		messageSource.setDefaultEncoding("UTF-8");

		return messageSource;
	}

	@Bean
	public ViewResolver getViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();

		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");

		viewResolver.setExposeContextBeansAsAttributes(true);

		return viewResolver;
	}

	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Bean
	public OpenEntityManagerInViewInterceptor getOpenEntityManagerInViewInterceptor() {
		return new OpenEntityManagerInViewInterceptor();
	}

	@Bean
	public AuthenticationInterceptor getAuthenticationInterceptor() {
	    return new AuthenticationInterceptor();
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(getAuthenticationInterceptor());
		super.addInterceptors(registry);
	}

//	@Override
//	public void addFormatters(FormatterRegistry registry) {
//		registry.addConverter(new Converter<String, Categoria>() {
//
//			@Override
//			public Categoria convert(String categoriaId) {
//				Categoria categoria = new Categoria();
//				categoria.setId(Integer.valueOf(categoriaId));
//
//				return categoria;
//			}
//
//		});
//	}
}
