package pl.findevent.servlets.ticketsservlets;


import pl.findevent.dao.UsersDao;
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

@WebServlet("/ListUserTicketsServlet")


public class ListUserTicketsServlet extends HttpServlet {

    @Inject
    UsersDao usersDao;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer userID = (Integer) request.getSession().getAttribute("id");

        // FIX ME
        // Get users ticekts from DB

        response.setContentType("text/html;charset=UTF-8");
        List listOfUserTickets = usersDao.getUserTickets(userID);
        request.setAttribute("listOfUserTickets", listOfUserTickets);
        RequestDispatcher rd = request.getRequestDispatcher("UserTickets.jsp");
        rd.forward(request, response);

    }

    public ListUserTicketsServlet() {
    }
}
