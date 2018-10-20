package pl.findevent.servlets.eventsservlets;

import pl.findevent.dao.EventsDao;
import pl.findevent.dao.UsersDao;
import pl.findevent.domain.Event;
import pl.findevent.domain.User;

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

@WebServlet("/EventDetails")
class EventDetailsServlet extends HttpServlet {

    final Logger logger = Logger.getLogger(getClass().getName());

    @Inject
    EventsDao eventsDao;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String redirect;
        String eventID = req.getParameter("id");
        int eventIdGet = Integer.parseInt(req.getParameter("id"));

        if ((eventID == null) || (eventID == "")) {
            redirect = "/index.jsp";
            RequestDispatcher rd = req.getRequestDispatcher(redirect);
            rd.forward(req, resp);
            return;
        }

        Event event = eventsDao.read(Integer.parseInt(eventID));
        req.setAttribute("event", event);
        Integer userId = (Integer) req.getSession().getAttribute("id");
        req.setAttribute("userId", userId);

        Object availableTickets = eventsDao.getAvailableTicketsNumbers(eventIdGet);
        logger.info("Available tickets for event: " + eventIdGet + " to: " + availableTickets);
        req.setAttribute("availableTickets", availableTickets);
        redirect = "/EventDetails.jsp";

        RequestDispatcher rd = req.getRequestDispatcher(redirect);
        rd.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
        rd.forward(req, resp);

    }
}