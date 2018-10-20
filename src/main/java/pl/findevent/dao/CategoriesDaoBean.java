package pl.findevent.dao;

import pl.findevent.domain.EventCategory;

import javax.ejb.Stateless;
import java.util.Arrays;
import java.util.List;

@Stateless
public class CategoriesDaoBean implements CategoriesDao {

    @Override
    public List<EventCategory> getAllCategories() {

        return Arrays.asList(EventCategory.values());
    }


}
