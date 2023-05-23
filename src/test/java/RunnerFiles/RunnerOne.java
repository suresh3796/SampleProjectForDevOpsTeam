package RunnerFiles;

import io.cucumber.junit.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.runner.RunWith;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(
        plugin = {"pretty"},
//        tags= ("@fb1"),
        features = {"src/test/resources/features/FB"},
        glue = {"StepDefinitions","StepDefFile"})
public class RunnerOne {
}
