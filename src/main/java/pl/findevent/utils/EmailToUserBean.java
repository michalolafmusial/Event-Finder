package pl.findevent.utils;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import javax.ejb.Stateless;
import java.util.logging.Logger;

@Stateless
public class EmailToUserBean implements EmailToUser
{
    
    Logger logger = Logger.getLogger(getClass().getName());
    
    @Override
    public void send(String address, String subject, String content)
    {
        
        try
        {
            
            Email email = new SimpleEmail();
            email.setHostName("mail0.mydevil.net");
            email.setSmtpPort(465);
            email.setAuthenticator(new DefaultAuthenticator("marekwitkowski@marekwitkowski.usermd.net", "haslo"));
            email.setSSLOnConnect(true);
            email.setFrom("marekwitkowski@marekwitkowski.usermd.net");
            email.setSubject(subject);
            email.setMsg(content);
            email.addTo(address);
            email.send();
            
        }
        catch(EmailException e)
        {
            
            logger.warning("Nie udało się wysłać maila:".concat(address));
            
        }
        
    }
}
