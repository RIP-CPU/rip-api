package id.co.cpu.test.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.transaction.Transactional;

import junit.framework.TestCase;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@Ignore
@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = ApplicationTest.class)
@WebAppConfiguration
public class ConnectionTest extends TestCase{

	private static final Logger LOG = LoggerFactory.getLogger(ConnectionTest.class);
	
	@Ignore
	@Test
	public void testMySQL(){
		
		LOG.info("-------- MySQL JDBC Connection Testing ------------");
		 
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			LOG.error("Where is your MySQL JDBC Driver? {}",e.getMessage());			
			return;
		}
	 
		LOG.info("MySQL JDBC Driver Registered!");
		Connection connection = null;
	 
		try {
			connection = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/rip","root", "");
	 
		} catch (SQLException e) {
			LOG.error("Connection Failed! Check output console: {}",e.getMessage());			
			return;
		}
	 
		if (connection != null) {
			LOG.info("You made it, take control your database now!");
		} else {
			LOG.error("Failed to make connection!");
		}	
	}
	
	
}
