package pl.findevent.servlets.weblogicservlets;

import pl.findevent.dao.EventsDao;
import pl.findevent.domain.Event;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/Search")
class SearchServlet extends HttpServlet
{
    
    final Logger logger = Logger.getLogger(getClass().getName());
    
    @Inject
    EventsDao eventsDao;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        
        req.setCharacterEncoding("UTF-8");
    
        List<Event> eventsFromSearch = new ArrayList<>();
        
        eventsFromSearch = eventsDao.getFindedEventsFromDB(req.getParameter("stringForSearch"));
        
        req.getSession().setAttribute("eventsFromSearch", eventsFromSearch);
        req.getSession().setAttribute("stringForSearch", req.getParameter("stringForSearch"));
        
        RequestDispatcher rd = req.getRequestDispatcher("search.jsp");
        rd.forward(req, resp);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        
        req.setCharacterEncoding("UTF-8");
        RequestDispatcher rd = req.getRequestDispatcher("search.jsp");
        
        rd.forward(req, resp);
        
    }
}