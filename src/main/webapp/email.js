function sendEmail(email, name, type) {
	console.log("email")
	var mailTemplate;
	var mailTitle;

	if (type === "register") {
		mailTitle = "Welcome to The Jobs Consultancy!";
		mailTemplate = `
  <!DOCTYPE html>
  <html>
  <head>
    <title>Welcome!</title>
  </head>
  <body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4;">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;">
      <tr>
        <td align="center" bgcolor="#2a2e32" style="padding: 40px 0;">
          <h1 style="color: #ffffff;">Welcome!</h1>
        </td>
      </tr>
      <tr>
        <td bgcolor="#ffffff" style="padding: 40px 20px;">
          <p>Dear ${name},</p>
          <p>Congratulations! You have successfully registered with The Jobs Consultancy service. We are excited to help you find your dream job.</p>
          <p>Thank you for choosing The Jobs Consultancy. We look forward to assisting you in your job search journey.</p>
          <p>Best regards,</p>
          <p>The Jobs Consultancy Team</p>
        </td>
      </tr>
      <tr>
        <td bgcolor="#2a2e32" style="padding: 20px; text-align: center;">
          <p style="color: #ffffff; margin: 0;">The Jobs. All rights reserved.</p>
        </td>
      </tr>
    </table>
  </body>
  </html>
`;
	}

	Email.send({
		SecureToken: "fe886413-1310-4191-a166-a18c91a6ae04",
		To: email,
		From: "gajindukb@gmail.com",
		Subject: mailTitle,
		Body: mailTemplate
	}).then(
		message => console.log(message)
	);
}


function sendAppointmentEmail(email, type, consultant, user, slot) {
	console.log("email")
	var mailTemplate;
	var mailTitle;

	if (type === "book") {
		mailTitle = "Appoinment reserved!";
		mailTemplate = `<!DOCTYPE html>
<html>
<head>
  <title>New Appointment Created</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4;">

  <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;">
    <tr>
      <td align="center" bgcolor="#2a2e32" style="padding: 40px 0;">
        <h1 style="color: #ffffff;">New Appointment Created</h1>
      </td>
    </tr>
    <tr>
      <td bgcolor="#ffffff" style="padding: 40px 20px;">
        <p>Dear ${user},</p>
        <p>We're writing to inform you that a new appointment has been created with one of our consultants.</p>
        <p>Your appointment details:</p>
        <ul>
          <li><strong>Consultant:</strong> ${consultant}</li>
          <li><strong>Time Slot:</strong> ${slot}</li>
        </ul>
        <p>If you did not schedule this appointment or have any questions, please let us know immediately.</p>
        <p>We shall update you on the appointment status...</p>
        <p>Thank you for choosing The Job Consultancy.</p>
        <p>Best regards,</p>
        <p>The Jobs Consultancy Team</p>
      </td>
    </tr>
    <tr>
      <td bgcolor="#2a2e32" style="padding: 20px; text-align: center;">
        <p style="color: #ffffff; margin: 0;">The Jobs. All rights reserved.</p>
      </td>
    </tr>
  </table>

</body>
</html>`

	}

	else if (type === "cancel") {

		mailTitle = "Appointment Canceled";
		mailTemplate = `<!DOCTYPE html>
<html>
<head>
  <title>Appointment Canceled</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4;">

  <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;">
    <tr>
      <td align="center" bgcolor="#2a2e32" style="padding: 40px 0;">
        <h1 style="color: #ffffff;">Appointment Canceled</h1>
      </td>
    </tr>
    <tr>
      <td bgcolor="#ffffff" style="padding: 40px 20px;">
        <p>Dear ${user},</p>
        <p>We're writing to inform you that your appointment has been canceled.</p>
        <p>Appointment details:</p>
        <ul>
          <li><strong>Consultant:</strong> ${consultant}</li>
          <li><strong>Time Slot:</strong> ${slot}</li>
        </ul>
        <p>If you have any questions or concerns, please feel free to reach out to our support team.</p>

        <p>Best regards,</p>
        <p>The Jobs Consultancy Team</p>
      </td>
    </tr>
    <tr>
      <td bgcolor="#2a2e32" style="padding: 20px; text-align: center;">
        <p style="color: #ffffff; margin: 0;">The Jobs. All rights reserved.</p>
      </td>
    </tr>
  </table>

</body>
</html>
`;

	}
	else if (type === "reject") {

		mailTitle = "Appointment Rejected";
		mailTemplate = `<!DOCTYPE html>
<html>
<head>
  <title>Appointment Rejected</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4;">

  <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;">
    <tr>
      <td align="center" bgcolor="#2a2e32" style="padding: 40px 0;">
        <h1 style="color: #ffffff;">Appointment Rejected</h1>
      </td>
    </tr>
    <tr>
      <td bgcolor="#ffffff" style="padding: 40px 20px;">
        <p>Dear ${user},</p>
        <p>We regret to inform you that your requested appointment has been rejected.</p>
        <p>Appointment details:</p>
        <ul>
          <li><strong>Consultant:</strong> ${consultant}</li>
          <li><strong>Time Slot:</strong> ${slot}</li>
        </ul>
        <p>If you have any concerns or would like more information, please feel free to reach out to our team.</p>
        <p>We appreciate your interest in The Jobs.</p>
        <p>Best regards,</p>
        <p>The Jobs Consultancy Team</p>
      </td>
    </tr>
    <tr>
      <td bgcolor="#2a2e32" style="padding: 20px; text-align: center;">
        <p style="color: #ffffff; margin: 0;">The Jobs Consultancy. All rights reserved.</p>
      </td>
    </tr>
  </table>

</body>
</html>

`;

	}

	else if (type === "accept") {

		mailTitle = "Appointment Confirmed";
		mailTemplate = `<!DOCTYPE html>
<html>
<head>
  <title>Appointment Confirmed</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4;">

  <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;">
    <tr>
      <td align="center" bgcolor="#2a2e32" style="padding: 40px 0;">
        <h1 style="color: #ffffff;">Appointment Confirmed</h1>
      </td>
    </tr>
    <tr>
      <td bgcolor="#ffffff" style="padding: 40px 20px;">
        <p>Dear ${user},</p>
        <p>We are pleased to confirm that your appointment has been scheduled with one of our consultants.</p>
        <p>Your appointment details:</p>
        <ul>
          <li><strong>Consultant:</strong> ${consultant}</li>
          <li><strong>Time Slot:</strong> ${slot}</li>
        </ul>
        <p>We look forward to meeting you and assisting you in your job search journey.</p>
        <p>If you have any questions or need to reschedule, please contact our support team.</p>
        <p>Thank you for choosing The Jobs Consultancy.</p>
        <p>Best regards,</p>
        <p>The Jobs Consultancy Team</p>
      </td>
    </tr>
    <tr>
      <td bgcolor="#2a2e32" style="padding: 20px; text-align: center;">
        <p style="color: #ffffff; margin: 0;">The Jobs. All rights reserved.</p>
      </td>
    </tr>
  </table>

</body>
</html>`;

	}
	else if (type === "complete") {

		mailTitle = "Appointment Completion";
		mailTemplate = `<!DOCTYPE html>
<html>
<head>
  <title>Appointment Completion</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4;">

  <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;">
    <tr>
      <td align="center" bgcolor="#2a2e32" style="padding: 40px 0;">
        <h1 style="color: #ffffff;">Appointment Completion</h1>
      </td>
    </tr>
    <tr>
      <td bgcolor="#ffffff" style="padding: 40px 20px;">
        <p>Dear ${user},</p>
        <p>We hope you found your recent appointment with our consultant valuable.</p>
        <p>Your appointment details:</p>
        <ul>
          <li><strong>Consultant:</strong> ${consultant}</li>
          <li><strong>Time Slot:</strong> ${slot}</li>
        </ul>
        <p>We would appreciate your feedback and any suggestions you may have to help us improve our services.</p>
        <p>If you have any further questions or need additional assistance, please don't hesitate to reach out.</p>
        <p>Thank you for choosing The Jobs Consultancy.</p>
        <p>Best regards,</p>
        <p>The Jobs Consultancy Team</p>
      </td>
    </tr>
    <tr>
      <td bgcolor="#2a2e32" style="padding: 20px; text-align: center;">
        <p style="color: #ffffff; margin: 0;">The Jobs Consultancy. All rights reserved.</p>
      </td>
    </tr>
  </table>

</body>
</html>
`;

	}

	else if (type === "bookToConsultant") {

		mailTitle = "New Appointment Received";
		mailTemplate = `<!DOCTYPE html>
<html>
<head>
  <title>New Appointment Recived</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4;">

  <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;">
    <tr>
      <td align="center" bgcolor="#2a2e32" style="padding: 40px 0;">
        <h1 style="color: #ffffff;">New Appointment Received</h1>
      </td>
    </tr>
    <tr>
      <td bgcolor="#ffffff" style="padding: 40px 20px;">
        <p>Dear ${consultant},</p>
        <p>We're writing to inform you that a new appointment has been created for you to assist a client.</p>
        <p>Appointment details:</p>
        <ul>
          <li><strong>Job Seeker:</strong> ${user}</li>
          <li><strong>Time Slot:</strong> ${slot}</li>
        </ul>
        <p>Please review the appointment details and be prepared to assist the client as scheduled.</p>
        <p>If you have any questions or need further information, please don't hesitate to contact us.</p>
        <p>Thank you for your commitment to The Job Consultancy.</p>
        <p>Best regards,</p>
        <p>The Jobs Consultancy Team</p>
      </td>
    </tr>
    <tr>
      <td bgcolor="#2a2e32" style="padding: 20px; text-align: center;">
        <p style="color: #ffffff; margin: 0;">The Jobs. All rights reserved.</p>
      </td>
    </tr>
  </table>

</body>
</html>

`;

	}



	Email.send({
		SecureToken: "fe886413-1310-4191-a166-a18c91a6ae04",
		To: email,
		From: "gajindukb@gmail.com",
		Subject: mailTitle,
		Body: mailTemplate
	}).then(
		message => console.log(message)
	);
} 