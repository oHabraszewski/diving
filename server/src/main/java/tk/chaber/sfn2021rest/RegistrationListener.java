package tk.chaber.sfn2021rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.MessageSource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import tk.chaber.sfn2021rest.db.UserService;
import tk.chaber.sfn2021rest.db.entities.User;
import tk.chaber.sfn2021rest.utils.ConfigVars;

import java.util.Locale;
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
        String message = "Someone provided this email address to confirm their account creation. If that was you, click on the link below. Otherwise, ignore this message.";

        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientEmail);
        email.setSubject(subject);
        email.setText(message + "\r\n" + confirmationUrl);
        mailSender.send(email);
    }
}
