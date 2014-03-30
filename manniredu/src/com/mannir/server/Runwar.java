package com.mannir.server;

import java.awt.EventQueue;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.derby.drda.NetworkServerControl;
//import org.apache.derby.client.*;
import org.mortbay.jetty.Server;
import org.mortbay.jetty.webapp.WebAppContext;

//import org.eclipse.jetty.server.Server;
//import org.eclipse.jetty.webapp.WebAppContext;




public class Runwar {	///private static String dbURL = "jdbc:derby://localhost:1527/db;create=true;user=admin;password=13131";


	public static void main(String[] args) {
		try { NetworkServerControl server = new NetworkServerControl(InetAddress.getByName("localhost"),1527);
		server.start(null);
		System.out.println("DB Server Started!");
		//server.shutdown();
		//cn = DriverManager.getConnection(dbURL);
		} catch(Exception e) {System.out.println("Cannot Start DB Server!"); }
		
		final JettyServer jettyServer = new JettyServer();
		String jetty_home = System.getProperty("jetty.home",".");
        Server server = new Server(8080);
        WebAppContext webapp = new WebAppContext();
        webapp.setContextPath("/");
        //webapp.setWar(jetty_home+"/target/vrscloud-1.war");
        webapp.setWar("ROOT.war");
        server.setHandler(webapp);
      //  server.start();	
		
		
        jettyServer.setHandler(webapp);	
		
		Runnable runner = new Runnable() {
			@Override
			public void run() {
				new ServerRunner(jettyServer);
			}
		};
		EventQueue.invokeLater(runner);
	}
}
