package pl.findevent.servlets.weblogicservlets;

import pl.findevent.utils.EmailToUser;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/Contact")
class ContactServlet extends HttpServlet {
    
    final Logger logger = Logger.getLogger(getClass().getName());

    @Inject
    EmailToUser emailToUser;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        RequestDispatcher rd = req.getRequestDispatcher("/contact.jsp");
        rd.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");


        String email = req.getParameter("email");
        String subject = req.getParameter("subject");
        String content = req.getParameter("content");




        emailToUser.send(email,subject,content);
    
        logger.info("Przyszła wiadomość od : ".concat(email));





        rd.forward(req, resp);


    }
}