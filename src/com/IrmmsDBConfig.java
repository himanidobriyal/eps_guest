package com;

import javax.naming.NamingException;
import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.lookup.JndiDataSourceLookup;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@Configuration
@EnableTransactionManagement
@PropertySource("classpath:application.properties")
@EnableJpaRepositories(
	basePackages= {"com.ireps.common.dao","com.ireps.admin.dao","com.ireps.eAuction.Dao","com.ireps.admin.user.dao","com.ireps.auction.postBidding.dao"},
	entityManagerFactoryRef="irmmsEMFactory", 
	transactionManagerRef="irmmsDSTM"
)
public class IrmmsDBConfig {

	@Value("${spring.datasource.irmms.jndi-name}")
	private String irmmsJndiName;
	
	@Primary
	@Bean
    public DataSource irmmsDS() throws NamingException {
		 JndiDataSourceLookup dataSourceLookup = new JndiDataSourceLookup();
		 DataSource dataSource = dataSourceLookup.getDataSource(irmmsJndiName);
	     return dataSource;
		//return (DataSource) new JndiTemplate().lookup(irmmsJndiName);
    }
    
	@Primary
    @Bean
    public LocalContainerEntityManagerFactoryBean irmmsEMFactory(@Qualifier("irmmsDS") DataSource irmmsDS,
    		EntityManagerFactoryBuilder builder) {
		return builder.dataSource(irmmsDS).packages(new String[] {"com.ireps.admin.entity","com.ireps.common.entity","com.ireps.eAuction.entity", "com.ireps.auction.form","com.ireps.admin.form","com.ireps.auction.postBidding.form"}).build();
    }
	
	@Primary
    @Bean
    public PlatformTransactionManager irmmsDSTM(@Qualifier("irmmsEMFactory") EntityManagerFactory irmmsEMFactory) {
		return new JpaTransactionManager(irmmsEMFactory);
    	
    }
    
}

