package com.mannir.edu;
import java.io.IOException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class MannireduServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("6");
	}
}
