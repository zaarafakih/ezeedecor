package net.zf.edbackend.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

//tell spring it has to manage a bean
@Configuration

// tell hibernate where our entity class is
@ComponentScan(basePackages = { "net.zf.edbackend.dto" })

// manage queries for a transaction
@EnableTransactionManagement

public class HibernateConfig {
	private final static String DATABASE_URL = "jdbc:mysql://localhost:3306/ezeedecor";
	private final static String DATABASE_DRIVER = "com.mysql.jdbc.Driver";
	private final static String DATABASE_DIALECT = "org.hibernate.dialect.MySQLDialect";
	private final static String DATABASE_USERNAME = "root";
	private final static String DATABASE_PASSWORD = "system123";

	//
	@Bean
	 public DataSource getDataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(DATABASE_DRIVER);
		dataSource.setUrl(DATABASE_URL);
		dataSource.setUsername(DATABASE_USERNAME);
		dataSource.setPassword(DATABASE_PASSWORD);

		return dataSource;
	}

	@Bean
	 public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder builder=new LocalSessionFactoryBuilder(dataSource);
		builder.addProperties(getHibernateProperties());
		//to avoid manually writing code for each entity class i.e. providing entire dto package to scan
		builder.scanPackages("net.zf.edbackend.dto");
		return builder.buildSessionFactory();	
		
	}
	
	//Hibernate properties we want to define

	private Properties getHibernateProperties() {
				
		Properties properties=new Properties();
		properties.put("hibernate.dialect", DATABASE_DIALECT);
		properties.put("show_sql","true");
		properties.put("format_sql","true");
		properties.put("hibernate.hbm2ddl.auto", "update");
		return properties;
	}
	
	@Bean
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory){
		HibernateTransactionManager transactionManager=new HibernateTransactionManager(sessionFactory);
		return transactionManager;
	}
	
	
}


















