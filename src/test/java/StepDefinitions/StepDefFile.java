package StepDefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import net.serenitybdd.core.pages.PageObject;
import org.junit.Assert;
import org.openqa.selenium.By;

import java.sql.Driver;

public class StepDefFile extends PageObject {
    Driver driver;
    @Given("open facebook login page")
    public void landingPage(){
        getDriver().get("https://www.facebook.com/");
    }

    @Then("facebook login page should be opened")
    public void facebookLoginPageShouldBeOpened() {
        Assert.assertTrue(getDriver().getTitle().contains("Facebook"));
    }

    @And("input invalid {string} {string}")
    public void input(String arg0, String arg1) {
        getDriver().findElement(By.name("email")).sendKeys(arg0);
        getDriver().findElement(By.name("pass")).sendKeys(arg1);
    }

    @When("click on login button")
    public void clickOnLoginButton() {
        getDriver().findElement(By.name("login")).click();
    }

    @Then("click on forget password link")
    public void clickOnForgetPasswordLink() {
        getDriver().findElement(By.xpath("//a[text()='Forgotten password?']")).click();
    }

    @Then("verify forget password page opened")
    public void verifyForgetPasswordPageOpened() {
        Assert.assertTrue(getDriver().getTitle().contains("Forgotten"));
    }

    @Then("click on create page")
    public void clickOnCreatePage() {
        getDriver().findElement(By.xpath("//a[text()='Create a Page']")).click();
    }

    @Then("create a page should open")
    public void createAPageShouldOpen() {
        Assert.assertTrue(getDriver().findElement(By.xpath("//div[text()='Create a Page']")).isDisplayed());
    }
}
