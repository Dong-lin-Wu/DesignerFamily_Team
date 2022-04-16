package tw.designerfamily;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DesignerFamilyTeamApplication {

	public static void main(String[] args) {
		SpringApplication application = new SpringApplication(DesignerFamilyTeamApplication.class);
		//自訂內容
		System.out.println("SpringBoot Run Success!");
		application.run(args);
	}

}
