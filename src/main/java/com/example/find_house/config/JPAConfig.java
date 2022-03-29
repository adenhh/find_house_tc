package com.example.find_house.config;

//
//import org.springframework.boot.context.properties.ConfigurationProperties;
//import org.springframework.boot.jdbc.DataSourceBuilder;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
//import org.springframework.orm.jpa.JpaTransactionManager;
//import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
//import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
//import org.springframework.transaction.PlatformTransactionManager;
//import org.springframework.transaction.annotation.EnableTransactionManagement;
//
//import javax.persistence.EntityManagerFactory;
//import javax.sql.DataSource;
//
//@Configuration
//@EnableJpaRepositories(basePackages = "com.example.find_house.repository")
//@EnableTransactionManagement
//public class JPAConfig {
//
//    // 使用jpa 链接数据库
//    // 1. 数据库链接对象，jdbc url, 鉴权（如果有）-> DataSource 对象
//
//    @Bean
//    @ConfigurationProperties(prefix = "spring.datasource")
//    public DataSource dataSource() {
//        return DataSourceBuilder.create().build();
//    }
//
//    // 2. 配置实体管理器工厂
//    @Bean
//    public LocalContainerEntityManagerFactoryBean entityManagerFactoryBean() {
//        // adapter (适配器） 作用是
//        HibernateJpaVendorAdapter jpaVendor = new HibernateJpaVendorAdapter();
//        // 不自动生产ddl 语句
//        jpaVendor.setGenerateDdl(false);
//        // 自动打印 sql 到日志里
//        jpaVendor.setShowSql(true);
//
//
//        // 配置实体管理器工厂
//        LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();
//        entityManagerFactory.setDataSource(dataSource());
//        entityManagerFactory.setJpaVendorAdapter(jpaVendor);
//        entityManagerFactory.setPackagesToScan("com.example.find_house.entity");
//
//
//        return entityManagerFactory;
//
//
//    }
//
//    // 配置jpa事务管理器
//    @Bean
//    public PlatformTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
//        JpaTransactionManager transactionManager = new JpaTransactionManager();
//        transactionManager.setEntityManagerFactory(entityManagerFactory);
//        return transactionManager;
//    }
//}
