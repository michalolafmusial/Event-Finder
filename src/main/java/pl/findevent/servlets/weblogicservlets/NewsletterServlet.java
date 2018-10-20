package pl.findevent.servlets.weblogicservlets;

import pl.findevent.dao.NewsLetterDao;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/Newsletter")
public class NewsletterServlet extends HttpServlet

{
    final Logger logger = Logger.getLogger(getClass().getName());
    
    @Inject
    NewsLetterDao newsLetterDao;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        
        req.setCharacterEncoding("UTF-8");
        RequestDispatcher rd = req.getRequestDispatcher("/newsletter.jsp");
        rd.forward(req, resp);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        
        req.setCharacterEncoding("UTF-8");
        RequestDispatcher rd = req.getRequestDispatcher("/newsletter.jsp");
        
        String content = req.getParameter("email");
        
        newsLetterDao.addAddressToDatabase(content);
        
        logger.info("Nowy wpis do newslettera od : ".concat(content));
        
        rd.forward(req, resp);
        
    }
}
