package com.aravind.employeemanagement.service;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class EmployeeManagementUtil {
	

	private static SqlSessionFactory sqlSessionFactory;

	public static SqlSessionFactory createSession() {
		Reader reader;
		try {
			reader = Resources.getResourceAsReader("EmployeeManagement-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return sqlSessionFactory;
	}

	public static SqlSessionFactory getSqlSessionFactory() {
		if (sqlSessionFactory == null) {
			sqlSessionFactory = createSession();
		}

		return sqlSessionFactory;

	}

}
