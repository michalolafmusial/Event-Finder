package pl.findevent.dao;

import pl.findevent.domain.EventCategory;

import javax.ejb.Local;
import java.util.List;

@Local
public interface CategoriesDao {

    List<EventCategory> getAllCategories();


}
