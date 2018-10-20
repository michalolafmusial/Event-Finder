package pl.findevent.dao;

import pl.findevent.domain.Event;

import javax.ejb.Stateless;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class EventsDaoBean implements EventsDao {

    private List<Event> eventList = new ArrayList<>();
    private static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("primary");

    public List<Event> getEvents() {
        return eventList;
    }

    public void setEvents(List<Event> events) {
        this.eventList = events;
    }

    final Logger logger = Logger.getLogger(getClass().getName());
    final String SPACE = " ";

    @Override
    public List<Event> getEventsListFromDB() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        eventList = entityManager.createQuery("FROM Event order by id desc").getResultList();
        entityManager.close();
        return eventList;

    }


    @Override
    public List<Event> getNextFivePromotedEventsFromDB() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        eventList = entityManager.createQuery("FROM Event where promote = true order by startDate asc").getResultList();
        entityManager.close();

        return eventList;
    }

    @Override
    public void saveEventToDb(Event event) {

        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.persist(event);
        transaction.commit();
        entityManager.close();
    }


    @Override
    public List<Event> getFindedEventsFromDB(String searchString) {

        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        eventList = entityManager.createQuery("FROM Event where name like %searchString% or description like %searchString%").getResultList();
        entityManager.close();

        return eventList;

    }

    @Override
    public Event read(int id) {

        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Event event = entityManager.find(Event.class, id);
        return event;

    }

    @Override
    public void modifyEventDb(Event event) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        entityManager.merge(event);
        entityTransaction.commit();
        entityManager.close();
    }

    @Override
    public void markEventAsActiveInDb(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        Event event = read(id);
        logger.info("Event id: " + id + SPACE + "current status: " + event.getActive());
        logger.info("Setting up as active...");
        event.setActive(true);
        entityManager.merge(event);
        entityTransaction.commit();
        entityManager.close();
        logger.info("Event id " + id + SPACE + "current status: " + event.getActive());
    }

    @Override
    public void markEventAsInactiveInDb(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        Event event = read(id);
        logger.info("Event id: " + id + SPACE + "current status: " + event.getActive());
        logger.info("Setting up as inactive...");
        event.setActive(false);
        entityManager.merge(event);
        entityTransaction.commit();
        entityManager.close();
        logger.info("Event id " + id + SPACE + "current status: " + event.getActive());

    }

    @Override
    public void buyTickets(int userId, int eventId, int numberOfTickets) {
        logger.info("numberofticketsser: " + numberOfTickets);
        logger.info("eventIdser: " + eventId);
        logger.info("userIDser: " + userId);
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        Query query = entityManager.createNativeQuery("INSERT INTO event_user (id_user, id_event, tickets_number) VALUES (?, ?, ?)");
        query.setParameter(1, userId);
        query.setParameter(2, eventId);
        query.setParameter(3, numberOfTickets);
        //  Query query1 = entityManager.createNativeQuery("select login from users where id_user = 49");
        //  System.out.println(query1.getResultList().get(0));
        query.executeUpdate();
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public Object getAvailableTicketsNumbers (int eventId)
    {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        entityTransaction.begin();
        Query query = entityManager.createNativeQuery("SELECT tickets_left from numberOfAvailableTickets where id_event=?");
        query.setParameter(1,eventId);
        System.out.println(query);
        Object availableTickets = query.getSingleResult();
        logger.info("Ilosc ticektow wg bazy to: "+availableTickets);
        return  availableTickets;
    }

    public EventsDaoBean() {
        // required for JPA
    }
}
