package pl.findevent.dao;

import pl.findevent.domain.NewsLetter;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class NewsLetterDaoBean implements NewsLetterDao
{
    
    Logger logger = Logger.getLogger(getClass().getName());
    private static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("primary");
    
    @Override
    public void addAddressToDatabase(String address)
    {
        
        NewsLetter newsLetter = new NewsLetter();
        
        newsLetter.setEmail(address);
        
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.persist(newsLetter);
        transaction.commit();
        entityManager.close();
        
        logger.info("Dodano adres do newslettera: ".concat(address));
        
    }
}
