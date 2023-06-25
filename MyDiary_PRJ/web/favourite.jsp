<%-- 
    Document   : favourite
    Created on : Mar 22, 2023, 1:09:06 AM
    Author     : kienb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />
        <style>
            h3 {
                margin: 0;
            }
            .collection.with-header {
                border: none;
            }
            .collection .collection-item {
                padding-left: 20px !important;
            }
        </style>
    </head>
    <body class="blue lighten-4">
        <header>
            <nav class="blue darken-3" role="navigation">
                <div class="nav-wrapper container">

                    <a href="." class="brand-logo">MY DIARY</a>

                    <ul class="right hide-on-med-and-down">

                        <li><a href="."><i class="material-icons right">home</i> Home</a></li>
                            <c:if test="${sessionScope.user == null}">
                            <li><a href="./register"><i class="material-icons right">person_add</i> Register</a></li>
                            <li><a href="./login"><i class="material-icons right">exit_to_app</i> Login</a></li>
                            </c:if>
                            <c:if test="${sessionScope.user != null}">
                            <li><a href="favourite.jsp"><i class="material-icons left">favorite</i> Favorite</a></li>
                            <li><a href="./mydiaries"><i class="material-icons right">library_books</i> My Diaries</a></li>
                            <li><a href="./logout"><i class="material-icons right">exit_to_app</i> Logout</a></li>
                            </c:if>
                    </ul>

                    <ul id="nav-mobile" class="sidenav">

                        <li class="active"><a href="."><i class="material-icons left">home</i> Home</a></li>
                            <c:if test="${sessionScope.user == null}">
                            <li><a href="./register"><i class="material-icons left">person_add</i> Register</a></li>
                            <li><a href="./login"><i class="material-icons left">exit_to_app</i> Login</a></li>
                            </c:if>
                            <c:if test="${sessionScope.user != null}">
                            <li><a href="favourite.jsp"><i class="material-icons left">favorite</i> Favorite</a></li>
                            <li><a href="./mydiaries"><i class="material-icons left">library_books</i> My Diaries</a></li>
                            <li><a href="./logout"><i class="material-icons left">exit_to_app</i> Logout</a></li>
                            </c:if>
                    </ul>

                    <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                </div>
            </nav>
        </header>
        <div class="section no-pad-bot">
            <div class="container">
                <h1 class="header center">Favourite</h1>
            </div>
        </div>
        <main class="container">
            <div class="card-panel">
                <table class="striped">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Date Of Diary</th>
                            <th>Visibility</th>
                            <th>Title</th>
                            <th>Content</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${sessionScope.diaryList}" var="i">
                            <tr>
                                <td>${i.id}</td>
                                <td>${i.dateOfDiary}</td>
                                <td>${i.visibility}</td>
                                <td>${i.title}</td>
                                <td>${i.content}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>

        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script>
            $(function () {
                $('.sidenav').sidenav();
            });
        </script>
    </body>
</html>
