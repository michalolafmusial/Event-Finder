package pl.findevent.servlets.eventsservlets;

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
import java.util.logging.Logger;

@WebServlet("/EventDeleteServlet")
class EventDeleteServlet extends HttpServlet
{
    
    final Logger logger = Logger.getLogger(getClass().getName());
    
    @Inject
    EventsDao eventsDao;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        
        String id = req.getParameter("id");

        Event event = eventsDao.read(Integer.parseInt(id));

        
        if(event.getActive())
        {
            eventsDao.markEventAsInactiveInDb(Integer.parseInt(id));
            logger.info("Event: " + event.getName() + " marked as inactive in DB.");
        }
        else
        {
            eventsDao.markEventAsActiveInDb(Integer.parseInt(id));
            logger.info("Event: " + event.getName() + " marked as active in DB.");
        }
        
        RequestDispatcher rd = req.getRequestDispatcher("ListAllEventsAdminServlet");
        rd.forward(req, resp);
    }
    
}