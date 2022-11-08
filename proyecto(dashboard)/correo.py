from flask import render_template
from flask_mail import Mail,Message
def enviar_correo(app,title,recipient,usuario,contraseña,info,diagnostico):
    enviar = "veterinariabuenproductor@gmail.com"
    app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = 465,
    MAIL_USE_SSL = True,
    MAIL_USERNAME = enviar,
    MAIL_PASSWORD = 'zildwettliojgcnk')
    mail = Mail(app)
    msg = Message(
    subject  = (title), 
    sender = enviar, 
    recipients = [recipient], 
    )  
    if usuario:
        msg.html = render_template('correo.html',usuario = usuario,contraseña = contraseña )
    else:
        msg.html = render_template('correo-receta.html',receta = info,diag = diagnostico )
    mail.send(msg)