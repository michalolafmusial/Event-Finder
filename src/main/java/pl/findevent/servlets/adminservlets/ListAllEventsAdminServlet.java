package pl.findevent.servlets.adminservlets;

import pl.findevent.dao.CategoriesDao;
import pl.findevent.dao.CategoriesDaoBean;
import pl.findevent.dao.EventsDao;
import pl.findevent.domain.Event;
import pl.findevent.domain.EventCategory;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/ListAllEventsAdminServlet")

public class ListAllEventsAdminServlet extends HttpServlet
{
    
    final Logger logger = Logger.getLogger(getClass().getName());
    
    @Inject
    EventsDao eventsDao;

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        
        response.setContentType("text/html;charset=UTF-8");
        List<Event> listOfEvents = eventsDao.getEventsListFromDB();
        request.setAttribute("listOfEvents", listOfEvents);
        logger.info("Data z bazy: "+listOfEvents.get(0).getStartDate());
        listOfEvents.get(0).getStartDate().toString().substring(0,10);
        RequestDispatcher rd = request.getRequestDispatcher("ListAllEventsAdmin.jsp");
        rd.forward(request, response);
        
    }
    
}
