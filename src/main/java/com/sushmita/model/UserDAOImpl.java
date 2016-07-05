package com.sushmita.model;

import java.util.List;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository("userDAO")
public class UserDAOImpl extends AbstractDAO<Integer, User> implements UserDAO {

	private MailSender mailSender;
	private SimpleMailMessage templateMessage;

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void setTemplateMessage(SimpleMailMessage templateMessage) {
		this.templateMessage = templateMessage;
	}

	static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);

	public User findById(int id) {
		User user = getByKey(id);
		if (user != null) {
			Hibernate.initialize(user.getUserRoles());
		}
		return user;
	}

	public User findBySSO(String sso_id) {
		logger.info("SSO_ID : {}", sso_id);
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("sso_id", sso_id));
		User user = (User) crit.uniqueResult();
		if (user != null) {
			Hibernate.initialize(user.getUserRoles());
		}
		return user;
	}

	@SuppressWarnings("unchecked")
	public List<User> findAllUsers() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("id"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<User> users = (List<User>) criteria.list();

		return users;
	}

	public void save(User user) {
		persist(user);
	}

	public void deleteBySSO(String sso_id) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("sso_id", sso_id));
		User user = (User) crit.uniqueResult();
		delete(user);
	}

	public void sendMail(User user) {

		SimpleMailMessage msg = new SimpleMailMessage(this.templateMessage);
		msg.setTo(user.getPatientEmail());
		msg.setSubject("Patient Registration Successful - Password Attached");
		msg.setText("Dear " + user.getPatientFirstName() + user.getPatientLastName()
				+ ", Your registration with beacon has been successful." + "\n" + "Your password is "
				+ user.getPassword() + "." + "\n" + "\n"
				+ "Your password is required for logging in to the beacon network." + "\n"
				+ "Once logged in, you may view your personal details as well as your patient history." + "\n"
				+ "To reset password or for additional assistance, please reach out to your system administrator.");
		try {
			this.mailSender.send(msg);
		} catch (MailException ex) {
			System.err.println(ex.getMessage());
		}
	}

}