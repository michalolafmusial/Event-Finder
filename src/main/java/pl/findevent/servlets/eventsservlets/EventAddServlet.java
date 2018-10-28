package pl.findevent.servlets.eventsservlets;

import pl.findevent.Exception.UserImageNotFoundException;
import pl.findevent.cdi.ImageUpload;
import pl.findevent.dao.EventsDao;
import pl.findevent.domain.Event;
import pl.findevent.domain.EventCategory;

import javax.faces.application.Application;
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
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/addevent")
@MultipartConfig
class EventAddServlet extends HttpServlet {

    final Logger logger = Logger.getLogger(getClass().getName());

    @Inject
    EventsDao eventsDao;

    @Inject
    ImageUpload imageUpload;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher rd = req.getRequestDispatcher("addevent.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String start_date = req.getParameter("start_date");
        String finish_date = req.getParameter("finish_date");
        String address = req.getParameter("address");
        String googleMaps = req.getParameter("google_maps");
        String organizer = req.getParameter("organizer");
        String price = req.getParameter("price");
        String tickets = req.getParameter("tickets");
        String category = req.getParameter("category");
        String promote = req.getParameter("promote");


        logger.info("Start date podana: " + start_date);
        logger.info("Finish date podana: " + finish_date);

        Date startDate2 = null;
        Date finishDate2 = null;

        try {
            startDate2 = new SimpleDateFormat("yyyy-MM-dd").parse(start_date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        try {
            finishDate2 = new SimpleDateFormat("yyyy-MM-dd").parse(finish_date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        boolean promoteTranslate;

        if (promote.equals("YES")) {
            promoteTranslate = true;
        } else {
            promoteTranslate = false;
        }


        Event event = new Event();
        event.setName(name);
        event.setDescription(description);
        event.setStartDate(startDate2);
        event.setFinishDate(finishDate2);
        event.setAddress(address);
        event.setGoogleMaps(googleMaps);
        event.setOrganizer(Integer.valueOf(organizer));
        event.setPrice(Double.valueOf(price));
        event.setTickets(Integer.parseInt(tickets));
        event.setCategory(EventCategory.valueOf(category));
        event.setPromote(promoteTranslate);
        event.setActive(true);



        Part filePart = req.getPart("image");
        File file;
        try {
            file = imageUpload.uploadImageFile(filePart);
            event.setImageURL("/UserPhotos/" + file.getName());
        } catch (UserImageNotFoundException userImageNotFound) {
            logger.log(Level.SEVERE, userImageNotFound.getMessage());
        }


        eventsDao.saveEventToDb(event);

        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
        rd.forward(req, resp);

    }


    private String getFileName(final Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }


}