<%-- 
    Document   : index
    Created on : 2018-04-26, 12:15:57
    Author     : Janah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center" class="login-page container margi">
            <h1>Prof</h1>
            <div class="form">
                <form method="post" action="LoginProfServlet" class="login-form">
                    <input name="prof_username_connexion" type="text" placeholder="username"/>
                    <input name="prof_password_connexion" type="password" placeholder="password"/>
                    <button>login</button>
                </form>
            </div>
            
            <h1>Etudiant</h1>
             <div class="form">
                <form method="post" action="" class="register-form">
                    <input name="username" type="text" placeholder="username"/>
                    <input name="password" type="password" placeholder="password"/>
                    <input name="nom" type="text" placeholder="nom"/>
                    <button>create</button>
                    <p class="message">Déja enregistré? <a href="#">Connexion</a></p>
                </form>
                <form method="post" action="LoginEtudiantServlet" class="login-form">
                    <input name="username_connexion" type="text" placeholder="username"/>
                    <input name="password_connexion" type="password" placeholder="password"/>
                    <button>login</button>
                    <p class="message">nouveau etudiant? <a href="#">Creer compte</a></p>
                </form>
            </div>
        </div>
        <script
            src="http://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
        <script>
            $('.message a').click(function () {
                $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
            });
        </script>

    </body>
</html>
