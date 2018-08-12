<%-- 
    Document   : indexetudiant
    Created on : 2018-04-26, 13:25:15
    Author     : Janah
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="exam.bloc_horraire"%>
<%@page import="exam.Etudiant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        ArrayList<bloc_horraire> ListHorraire = new ArrayList<bloc_horraire>();
        String ContextPath = request.getContextPath();
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP:1.1
        response.setHeader("Pragma", "no-cache"); // HTTP:1.0
        response.setHeader("Expires", "0"); // Proxies
        Etudiant ConnectedEtud = null;
        if (session.getAttribute("EtudiantConnected") == null) {
            response.sendRedirect(ContextPath + "index.jsp");
        } else {
            ConnectedEtud = (Etudiant) session.getAttribute("EtudiantConnected");
            ListHorraire = (ArrayList<bloc_horraire>) session.getAttribute("ListeHorraire");
        }
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
    
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <h1>binevenue <%= ConnectedEtud.getNom()%><h4><a href="#">deconnexion</a></h4></h1>
        <h3>Vos blocs :</h3>
        <table>
            <tr>
                <th>id</th>
                <th>etudiant</th>
                <th>debut</th>
                <th>fin</th>
            </tr>
            <%for (bloc_horraire bl : ListHorraire) {%>
            <tr>
                <td><%=bl.getId()%></td>
                <td><%=bl.getId_etudiant()%></td>
                <td><%=bl.getDate_debut()%></td>
                <td><%=bl.getDate_fin()%></td>
            </tr>
            <%}%>
        </table>

        <div class="container">
            <h3>Inserer une plage horraire</h3>
            <div class="form">
                <form method="post" action="InsertionBlocHorraireEtudiant" class="login-form">
                    <input name="idetudiant" type="hidden" value="<%= ConnectedEtud.getId()%>" placeholder=""/>

                    <div class="row">
                        <div class='col-sm-6'>
                            <div class="form-group">
                                <div class='input-group date' id='datetimepicker1'>
                                    <input name="debut" type='datetime-local' class="form-control" placeholder="debut"/>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class='col-sm-6'>
                            <div class="form-group">
                                <div class='input-group date' id='datetimepicker2'>
                                    <input name="fin" type='datetime-local' class="form-control" placeholder="fin"/>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button>Ajouter</button>
                </form>
                <div class="control-group">
                    <label class="control-label">DateTime Picking</label>
                    <div class="controls input-append date form_datetime" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                        <input size="16" type="text" value="" readonly>
                        <span class="add-on"><i class="icon-remove"></i></span>
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>
                    <input type="hidden" id="dtp_input1" value="" /><br/>
                </div>
                <h3>Modifier plage horraire</h3>
                <form method="post" action="post">
                    <input name="idetudiant" type="hidden" value="<%= ConnectedEtud.getId()%>" placeholder="username"/>
                    <select name="idbloc">
                        <option value="-1">id_bloc</option>
                        <%for (bloc_horraire bl : ListHorraire) {%>
                        <option value="<%=bl.getId()%>" ><%=bl.getId()%></option>
                        <%}%>
                    </select>
                    <div class="row">
                        <div class='col-sm-6'>
                            <div class="form-group">
                                <div class='input-group date' id='datetimepicker2'>
                                    <input name="update_fin" type='date' class="form-control" placeholder="debut"/>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class='col-sm-6'>
                            <div class="form-group">
                                <div class='input-group date' id='datetimepicker2'>
                                    <input name="update_debut" type='date' class="form-control" placeholder="fin"/>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button>modifier</button>
                </form>
                <h3>Supprimmer Bloc</h3>
                <form method="post" action="">
                    <input name="delete_id" type="numeric"/>
                    <button>supprimer</button>
                </form>
            </div>
        </div>
        <script
            src="http://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $('#datetimepicker1').datetimepicker();
                $('#datetimepicker2').datetimepicker();
            });
        </script>
        <script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
        <script type="text/javascript" src="js/locales/bootstrap-datetimepicker.ca.js" charset="UTF-8"></script>
        <script type="text/javascript">
                    $('.form_datetime').datetimepicker({
                        //language:  'fr',
                        weekStart: 1,
                        todayBtn: 1,
                        autoclose: 1,
                        todayHighlight: 1,
                        startView: 2,
                        forceParse: 0,
                        showMeridian: 1
                    });
                    $('.form_date').datetimepicker({
                        language: 'fr',
                        weekStart: 1,
                        todayBtn: 1,
                        autoclose: 1,
                        todayHighlight: 1,
                        startView: 2,
                        minView: 2,
                        forceParse: 0
                    });
                    $('.form_time').datetimepicker({
                        language: 'fr',
                        weekStart: 1,
                        todayBtn: 1,
                        autoclose: 1,
                        todayHighlight: 1,
                        startView: 1,
                        minView: 0,
                        maxView: 1,
                        forceParse: 0
                    });
        </script>
    </body>
</html>
