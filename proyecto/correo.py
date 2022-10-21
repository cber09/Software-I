from flask_mail import Mail,Message
def enviar_correo(app,title,recipient,message):
    enviar = "jhoel05sequeira@gmail.com"
    app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = 465,
    MAIL_USE_SSL = True,
    MAIL_USERNAME = enviar,
    MAIL_PASSWORD = 'ygiphiweczdbvfke')
    mail = Mail(app)
    msg = Message(
    subject  = (title), 
    sender = enviar, 
    recipients = [recipient], 
    body= message
    )  
    mail.send(msg)