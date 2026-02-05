package examples.post;

import com.intuit.karate.junit5.Karate;

public class PostRunner {
    @Karate.Test
    Karate testPost(){
        return Karate.run("post").relativeTo(getClass());
    }
}
