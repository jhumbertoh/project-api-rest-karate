package examples.issues;

import com.intuit.karate.junit5.Karate;

class IssuesRunner {
    
    @Karate.Test
    Karate testIssues() {
        return Karate.run("issues").relativeTo(getClass());
    }
}
