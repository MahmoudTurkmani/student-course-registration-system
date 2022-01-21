package sample;

import java.io.IOException;
import java.net.URISyntaxException;
import java.io.File;
import java.util.Scanner;
import javafx.scene.control.TextField;
import com.jfoenix.controls.JFXCheckBox;
import javafx.scene.control.PasswordField;
import javafx.scene.control.RadioButton;
import javafx.scene.control.ToggleGroup;
import javafx.scene.input.MouseEvent;
import javafx.scene.text.Text;
import javafx.fxml.FXML;

public class loginController extends Controller {
  @FXML
  private ToggleGroup studentLecturer;
  @FXML
  private RadioButton rbLecturer, rbStudent;

  @FXML
  private TextField matricNo, textPassword;

  @FXML
  private PasswordField password;

  @FXML
  private Text loginMessage;
  
  @FXML
  private JFXCheckBox showPassword;

  public void SignUp(MouseEvent event) throws IOException {
    switchTo(event, "signUp.fxml");
  }

  public void ContactUs(MouseEvent event) throws IOException {
    switchTo(event, "contactUs.fxml");
  }

  public void openBrowser() throws URISyntaxException, IOException {
    openLink();
  }



  public void SignIn(MouseEvent event) throws IOException{
    if (matricNo.getText().isBlank()==true && textPassword.getText().isBlank()==true)
    {
      loginMessage.setText("Please enter matrics number and password!");
    }
    else if(matricNo.getText().isBlank()==true)
    {
    loginMessage.setText("Please enter matrics number!");
    }
 
    else if(password.getText().isBlank()==true)
    {
    loginMessage.setText("Please enter password!");
    }

    else{
      try
      {
        File fileObj = new File(matricNo.getText() + ".txt");
        Scanner sc =new Scanner(fileObj);
        String correctStudentID = sc.nextLine();
        String correctPassword = sc.nextLine();
        if(!matricNo.getText().equals(correctStudentID))
        {
          loginMessage.setText("Matrics number is incorrect!");
        }
        else if(!textPassword.getText().equals(correctPassword))
        {
          loginMessage.setText("Password is incorrect!");
        }
        else if (matricNo.getText().equals(correctStudentID) && textPassword.getText().equals(correctPassword) && rbStudent.isSelected())
       {
        switchTo(event, "stuDash.fxml");
       }

        
        while(sc.hasNextLine())
        {
        System.out.println(sc.nextInt());
        
      } 
      sc.close();
    }
      catch (IOException e) {
        loginMessage.setText("This matrics number has not registered yet!");
        System.out.println("An error occurred.");
        e.printStackTrace();
    }

    }
  }


public void TriggerPasswordCheckBox() {
  if (showPassword.isSelected()) {
    textPassword.setText(password.getText());
    textPassword.setVisible(true);
    password.setVisible(false);
  } else {
    password.setText(textPassword.getText());
    textPassword.setVisible(false);
    password.setVisible(true);
  }
}
}

    /**if (rbStudent.isSelected()) {
      switchTo(event, "stuDash.fxml");
    } else if (rbLecturer.isSelected()) {
      switchTo(event, "lecDash.fxml");
    }*/
  



 