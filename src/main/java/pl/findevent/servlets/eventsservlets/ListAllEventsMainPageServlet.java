package pl.findevent.servlets.eventsservlets;

import pl.findevent.dao.CategoriesDao;
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

@WebServlet("/ListAllEventsMainPageServlet")

public class ListAllEventsMainPageServlet extends HttpServlet {

    final Logger logger = Logger.getLogger(getClass().getName());

    @Inject
    EventsDao eventsDao;
//    CategoriesDao categoriesDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        List<Event> listOfEventsMainPage = eventsDao.getEventsListFromDB();
//        List<EventCategory> listOfCategories = categoriesDao.getAllCategories();
        request.setAttribute("listOfEventsMainPage", listOfEventsMainPage);
//        request.setAttribute("listOfCategories", listOfCategories);
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);

    }

}
