package com.lcf.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmailUtil {
	
	public static void sendEmail(String userEmail, int flag, String userName) throws Exception {
		sendEmail(userEmail, flag, userName, "");
	}
	
	public static void sendEmail(String userEmail, int flag, String userName, String password) throws Exception {
		Properties props = new Properties();
		
		String emailAddress="tju.drone.vision@gmail.com";
		String emailPassword="VisDrones2018";
		
		// 获取邮箱smtp服务器的地址
		props.setProperty("mail.host", "smtp.gmail.com");
        //是否进行权限验证。
        props.setProperty("mail.smtp.ssl.enable", "true");
        props.setProperty("mail.smtp.auth", "true");

		// 权限
		Authenticator authenticator = new Authenticator() {
			@Override
            public PasswordAuthentication getPasswordAuthentication() {
                //填写自己的163邮箱的登录帐号和授权密码，授权密码的获取，在后面会进行讲解。
                return new PasswordAuthentication(emailAddress,emailPassword);
            }  
		};
		
		//  获得连接
        /**
         * props：包含配置信息的对象，Properties类型
         *         配置邮箱服务器地址、配置是否进行权限验证(帐号密码验证)等
         *
         * authenticator：确定权限(帐号和密码)
         *
         * 所以就要在上面构建这两个对象。
         */

        Session session = Session.getDefaultInstance(props, authenticator);


        // 创建消息
        Message message = new MimeMessage(session);
        // 发件人      
        message.setFrom(new InternetAddress(emailAddress));
        /**
         *  收件人
         *         第一个参数：
         *             RecipientType.TO    代表收件人
         *             RecipientType.CC    抄送
         *             RecipientType.BCC    暗送
         *         比如A要给B发邮件，但是A觉得有必要给要让C也看看其内容，就在给B发邮件时，
         *         将邮件内容抄送给C，那么C也能看到其内容了，但是B也能知道A给C抄送过该封邮件
         *         而如果是暗送(密送)给C的话，那么B就不知道A给C发送过该封邮件。
         *     第二个参数
         *         收件人的地址，或者是一个Address[]，用来装抄送或者暗送人的名单。或者用来群发。可以是相同邮箱服务器的，也可以是不同的
         *         这里我们发送给我们的qq邮箱
         */
        message.setRecipient(RecipientType.TO, new InternetAddress(userEmail));
        // 主题（标题）
        
        String str;
        // Sign up
        if (flag == 1) {
        	message.setSubject("Verify Your Email Address");
            // 正文
            str = "Dear Participator: <br/>" +
            		"Thanks for creating an account in the VisDrone challenge. "
            		+ "You may receive important news and updates about the challenge in the future.<br/> "
            		+ "Please verify your email address:<br>"
            		+ "<a href='" + password + "'>" + password + "</a>" +
                    "<br/>" +
                    "Kind Regards,<br/>" +
        			"The VisDrone Team";
        } else if (flag == 2){
        	// Submission
        	message.setSubject("VisDrone 2018 Submission");
        	// 正文
        	str = "Dear Participator: <br/><br/>" +
        			"Thank you for participating the VisDrone 2018 Challenge, "
        			+ "held on the ECCV 2018 workshop \"Vision Meets Drones: A Challenge\". "
        			+ "We have successfully received your results. "
        			+ "We will post the latest updates of the challenge on the website: "
        			+ "<a href='http://www.aiskyeye.com'>" + "http://www.aiskyeye.com" + "</a>" +
        			"<br/><br/>" +
        			"Kind Regards,<br/>" +
        			"The VisDrone Team";
        } else if (flag == 3){
        	message.setSubject("VisDrone 2018 Challenge Recover Password");
        	// 正文
        	str = "Dear " + userName + ", <br/>" +
        			"Your password is" + password +
        			"<br/>" +        			
        			"Please memorize your passwor and keep it safely.<br/>" +
        			"<br/>" +
        			"Sincerely,<br/>" +
        			"VisDrone2018";
        } else {
        	message.setSubject("VisDrone 2018 Challenge");
        	// 正文
        	str = "Dear " + userName + ", <br/>" +
        			"<br/>" +
        			"Sincerely,<br/>" +
        			"VisDrone2018";
        }
        // 设置编码，防止发送的内容中文乱码。
        message.setContent(str, "text/html;charset=UTF-8");


        // 发送消息
        Transport.send(message);
	}
}