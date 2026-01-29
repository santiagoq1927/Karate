package examples.udc;

import com.intuit.karate.junit5.Karate;

public class TestRunner {


    @Karate.Test
    Karate testUsers() {
        return Karate.run("21javaUse").relativeTo(getClass());
    }
}
