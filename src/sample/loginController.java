package sample;

import java.io.IOException;
import java.net.URISyntaxException;

import javafx.scene.control.RadioButton;
import javafx.scene.control.ToggleGroup;
import javafx.scene.input.MouseEvent;
import javafx.fxml.FXML;

public class loginController extends Controller {

  @FXML
  private ToggleGroup studentLecturer;

  @FXML
  private RadioButton rbLecturer, rbStudent;

  public void SignUp(MouseEvent event) throws IOException {
    switchTo(event, "signUp.fxml");
  }

  public void ContactUs(MouseEvent event) throws IOException {
    switchTo(event, "contactUs.fxml");
  }

  public void openBrowser() throws URISyntaxException, IOException {
    openLink();
  }

  public void SignIn(MouseEvent event) throws IOException {
    if (rbStudent.isSelected()) {
      switchTo(event, "stuDash.fxml");
    } else if (rbLecturer.isSelected()) {
      switchTo(event, "lecDash.fxml");
    }
  }
}
