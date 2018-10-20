package pl.findevent.utils;

import javax.ejb.Local;

@Local
public interface EmailToUser {

    void send(String address, String subject, String content);

}
