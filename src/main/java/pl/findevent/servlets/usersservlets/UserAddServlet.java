package pl.findevent.servlets.usersservlets;

import pl.findevent.dao.UsersDao;
import pl.findevent.domain.User;
import pl.findevent.domain.UserType;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/User")
class UserAddServlet extends HttpServlet
{
    
    final Logger logger = Logger.getLogger(getClass().getName());
    
    @Inject
    UsersDao usersDao;
    
    //   @Inject
    //   EmailToUser emailToUser;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        
        req.setCharacterEncoding("UTF-8");
        RequestDispatcher rd = req.getRequestDispatcher("/user.jsp");
        rd.forward(req, resp);
    
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        
        req.setCharacterEncoding("UTF-8");
        
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String type = req.getParameter("type");
        
        if(usersDao.isUniqueLogin(login))
        {
            logger.info("Login: " + login + " already exists in database. Cannot create account with duplicate login.");
            logger.info("Re-direct to main page");
            req.setAttribute("errorTitle", "Cannot create user account");
            req.setAttribute("errorDecscription", "Login already exists. Please enter another login");
            RequestDispatcher rd = req.getRequestDispatcher("error.jsp");
            rd.forward(req, resp);
            return;
        }
        
        User user = new User();
        user.setLogin(login);
        user.setPassword(password);
        user.setName(name);
        user.setSurname(surname);
        user.setEmail(email);
        user.setPhoneNumber(phone);
        user.setUserType(UserType.valueOf(type));
        user.setActive(true);
        
        usersDao.saveUserToDb(user);
        logger.info("User: " + login + " successfully added to database");
        
        //   emailToUser.send(user.getEmail(), "EventFinder - potwierdzenie założenia konta", "EventFinder - potwierdznie założenia konta\tŻyczymy dobrej zabawy!");
        
        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
        rd.forward(req, resp);
        
    }
}