package examples.bookings;

import com.intuit.karate.junit5.Karate;

public class BookingsRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("bookings").relativeTo(getClass());
    }
}
