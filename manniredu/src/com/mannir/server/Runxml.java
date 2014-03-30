package com.mannir.server;

import java.awt.EventQueue;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.derby.drda.NetworkServerControl;
import org.mortbay.jetty.Server;
import org.mortbay.jetty.webapp.WebAppContext;



public class Runxml {
	//private static String dbURL = "jdbc:derby://localhost:1527/db;create=true;user=admin;password=13131";
	//public static Connection cn;
 
	public static void main(String[] args) {
		try { NetworkServerControl server = new NetworkServerControl(InetAddress.getByName("localhost"),1527);
			server.start(null);
			System.out.println("DB Server Started!");
			//server.shutdown();
			//cn = DriverManager.getConnection(dbURL);
			} catch(Exception e) {System.out.println("Cannot Start DB Server!"); }

		final JettyServer jettyServer = new JettyServer();
	       WebAppContext context = new WebAppContext();
	       context.setDescriptor("src/main/webapp/WEB-INF/web.xml");
	       context.setResourceBase("src/main/webapp");
	       context.setContextPath("/");
	       context.setParentLoaderPriority(true);
		jettyServer.setHandler(context);
		Runnable runner = new Runnable() {
			@Override
			public void run() {
				new ServerRunner(jettyServer);
			}
		};
		EventQueue.invokeLater(runner);
	}
}
