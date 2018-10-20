package pl.findevent.servlets.adminservlets;


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

@WebServlet("/ListAllUsersAdminServlet")


public class ListAllUsersAdminServlet extends HttpServlet {

    @Inject
    UsersDao usersDao;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        List<User> listOfUsers = usersDao.getUsersListFromDB();
        request.setAttribute("listOfUsers", listOfUsers);
        RequestDispatcher rd = request.getRequestDispatcher("ListAllUsersAdmin.jsp");
        rd.forward(request, response);

    }

    public ListAllUsersAdminServlet() {
    }
}
