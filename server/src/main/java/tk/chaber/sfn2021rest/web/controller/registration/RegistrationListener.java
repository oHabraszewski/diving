package tk.chaber.sfn2021rest.web.controller.registration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import tk.chaber.sfn2021rest.UserService;
import tk.chaber.sfn2021rest.persistence.entity.User;
import tk.chaber.sfn2021rest.util.ConfigVars;

import javax.mail.internet.MimeMessage;
import java.util.UUID;

@Component
public class RegistrationListener implements ApplicationListener<OnRegistrationCompleteEvent> {
    @Autowired
    private UserService service;

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public void onApplicationEvent(OnRegistrationCompleteEvent event) {
        this.sendConfirmRegistration(event);
    }

    private void sendConfirmRegistration(OnRegistrationCompleteEvent event){
        User user = event.getUser();
        String token = UUID.randomUUID().toString();
        service.createVerificationToken(user, token);

        String recipientEmail = user.getEmail();
        String subject = "Confirm your registration to the Diving game";
        String confirmationUrl = ConfigVars.HOSTNAME + "/registrationConfirm?token=" + token;
        String HTML = "<center><h1 style=\"font-size:64px\">Diving</h1></center> <br> <p style=\"font-size: 20px\">Thank you for your registration to the Diving game! But wait a minute... Ah yes, you have to do one more thing before diving into the deep underwater world. Please click the button below in order to verify this email as an address linked to your Diving account.</p> <br> <center><a href=\"" + confirmationUrl + "\"><button style=\"width: 600px; height: 64px; background-color: #13a967; border-radius: 8px; font-size: 24px\">Verify!</button></a></center><br><br><p>If you think this message is not intended for you, ignore it.</p>";

        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper email = new MimeMessageHelper(mimeMessage, "UTF-8");
        try {
            email.setTo(recipientEmail);
            email.setSubject(subject);
            email.setText(HTML, true);
        }catch (Exception ex){
            System.out.println("Oh no...");
        }
        mailSender.send(mimeMessage);
    }
}
