package examples.users2;

import com.intuit.karate.junit5.Karate;

class Users2Runner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("users2").relativeTo(getClass());
    }    

}
