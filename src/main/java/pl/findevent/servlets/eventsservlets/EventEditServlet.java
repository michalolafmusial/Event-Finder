package pl.findevent.servlets.eventsservlets;

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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Logger;

@WebServlet("/EventEditServlet")
class EventEditServlet extends HttpServlet
{
    
    final Logger logger = Logger.getLogger(getClass().getName());
    
    @Inject
    EventsDao eventsDao;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.setCharacterEncoding("UTF-8");
        //pobierz i ustaw parametry type z adresu. ustaw ten parametr dla sesji aby widzial go tez post
        String id = req.getParameter("id");
        req.setAttribute("id", id);
        req.getSession().setAttribute("id", id);
        
        // znajdz usera po id ktore bylo podane w pasku
        // ten user bedzie wykorzystany aby wyswietlic jego dane w formularzu (value=${user.getName()}
        Event event = eventsDao.read(Integer.parseInt(id));
        
        // aby formularz widział usera, rowniez dla sesji przy przełączaniu pomiedzy stronami
        
        req.setAttribute("event", event);
        req.getSession().setAttribute("event", event);
        
        // format date (event.getStartDate(), event.getFinishDate()) to String in format yyyy-MM-dd
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = format.format(event.getStartDate());
        String finishDate = format.format(event.getFinishDate());
        
        //set up start_date and finish_date to forward to editEvent.jsp as e.g. ${start_date}
        req.setAttribute("start_date", startDate);
        req.setAttribute("finish_date", finishDate);
        req.getSession().setAttribute("start_date", startDate);
        req.getSession().setAttribute("finish_date", finishDate);
        
        RequestDispatcher rd = req.getRequestDispatcher("editEvent.jsp");
        rd.forward(req, resp);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        
        req.setCharacterEncoding("UTF-8");
        
        HttpSession session = req.getSession();
        
        String idEvent = String.valueOf(req.getSession().getAttribute("id"));
        
        // get info about what user entered and assign to variable
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String start_date = req.getParameter("start_date");
        String finish_date = req.getParameter("finish_date");
        String address = req.getParameter("address");
        String google_maps = req.getParameter("google_maps");
        String organizer = req.getParameter("organizer");
        String price = req.getParameter("price");
        String tickets = req.getParameter("tickets");
        String category = req.getParameter("category");
        String promote = req.getParameter("promote");
        
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date finishDate = null;
        try
        {
            startDate = format.parse(start_date);
        }
        catch(ParseException e)
        {
            e.printStackTrace();
        }
        try
        {
            finishDate = format.parse(finish_date);
        }
        catch(ParseException e)
        {
            e.printStackTrace();
        }
        
        boolean promoteTranslate;
        
        if(promote.equals("YES"))
        {
            promoteTranslate = true;
        }
        else
        {
            promoteTranslate = false;
        }
        
        // set session attribute for user's parameters, i.e. assign login to login
        req.getSession().setAttribute("name", name);
        req.getSession().setAttribute("description", description);
        req.getSession().setAttribute("startDate", startDate);
        req.getSession().setAttribute("finishDate", finishDate);
        req.getSession().setAttribute("address", address);
        req.getSession().setAttribute("google_maps", google_maps);
        req.getSession().setAttribute("organizer", organizer);
        req.getSession().setAttribute("price", price);
        req.getSession().setAttribute("tickets", tickets);
        req.getSession().setAttribute("category", category);
        req.getSession().setAttribute("promoteTranslate", promoteTranslate);
        
        Event event = eventsDao.read(Integer.parseInt(idEvent));
        event.setName((String) req.getSession().getAttribute("name"));
        event.setDescription((String) req.getSession().getAttribute("description"));
        event.setStartDate((Date) req.getSession().getAttribute("startDate"));
        event.setFinishDate((Date) req.getSession().getAttribute("finishDate"));
        event.setAddress((String) req.getSession().getAttribute("address"));
        event.setGoogleMaps((String) req.getSession().getAttribute("google_maps"));
        event.setOrganizer(Integer.parseInt((String) req.getSession().getAttribute(("organizer"))));
        event.setTickets(Integer.parseInt((String) req.getSession().getAttribute("tickets")));
        event.setCategory(EventCategory.valueOf((String) req.getSession().getAttribute("category")));
        event.setPromote((Boolean) req.getSession().getAttribute("promoteTranslate"));
        
        eventsDao.modifyEventDb(event);
        logger.info("Event id: " + idEvent + " successfully updated");
        logger.info("New name: " + name + " | New description: " + description + " | New startDate: " + start_date
                    + " | New finishDate: " + finishDate
                    + " | New Address: " + address + " | New google_maps: " + google_maps + " | New organizer: " + organizer
                    + " | New tickets: " + tickets + " | New category: " + category + " | New isPromoted: " + promoteTranslate);
        session.invalidate();
        
        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
        // redirect to another servlet, i.e. /ListAllUsersAdminServlet
        resp.sendRedirect(req.getContextPath() + "/ListAllEventsAdminServlet");
        rd.forward(req, resp);
    }
}