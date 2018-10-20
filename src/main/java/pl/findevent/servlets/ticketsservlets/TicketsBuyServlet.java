package pl.findevent.servlets.ticketsservlets;

import pl.findevent.Exception.UserImageNotFoundException;
import pl.findevent.cdi.ImageUpload;
import pl.findevent.dao.EventsDao;
import pl.findevent.domain.Event;
import pl.findevent.domain.EventCategory;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/ticketsbuyservlet")
@MultipartConfig
class TicketsBuyServlet extends HttpServlet {

    final Logger logger = Logger.getLogger(getClass().getName());

    @Inject
    EventsDao eventsDao;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher rd = req.getRequestDispatcher("addevent.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String numberOfTickets = req.getParameter("numberOfTickets");
        String eventId = req.getParameter("eventId");
        String userID = req.getParameter("userID");


        logger.info("numberofticketsstring: "+numberOfTickets);
        logger.info("eventIdSring: "+eventId);
        logger.info("userIDString: "+userID);


        Integer numberOfTicketsInt = Integer.parseInt(numberOfTickets);
        Integer eventIdInt = Integer.parseInt(eventId);
        Integer userIdInt = Integer.parseInt(userID);


        logger.info("numberofticketsint: "+numberOfTicketsInt);
        logger.info("eventIdint: "+eventIdInt);
        logger.info("userIDint: "+userIdInt);



        eventsDao.buyTickets(userIdInt, eventIdInt, numberOfTicketsInt);

        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
        rd.forward(req, resp);

        //   eventsDao.saveEventToDb(event);


    }


}