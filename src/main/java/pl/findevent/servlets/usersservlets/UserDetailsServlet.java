package pl.findevent.servlets.usersservlets;

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
import java.util.logging.Logger;

@WebServlet("/UserDetails")
class UserDetailsServlet extends HttpServlet
{
    
    final Logger logger = Logger.getLogger(getClass().getName());
    
    @Inject
    UsersDao usersDao;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        
        req.setCharacterEncoding("UTF-8");
        
        String redirect;
        String userID = req.getParameter("id");


        User user = usersDao.read(Integer.parseInt(userID));
        
        req.setAttribute("user", user);
        
        redirect = "/UserDetails.jsp";
        
        RequestDispatcher rd = req.getRequestDispatcher(redirect);
        rd.forward(req, resp);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        
        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
        rd.forward(req, resp);
        
    }
}