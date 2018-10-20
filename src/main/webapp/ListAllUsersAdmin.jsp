<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>

<div class="page-title">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <h2><i class="fa fa-user"></i> Użytkownicy</h2>
            </div><!-- end col -->
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Start</a></li>
                    <li class="breadcrumb-item"><a href="#">Admninistracja</a></li>
                    <li class="breadcrumb-item active"><a href="#">Użytkownicy</a></li>
                </ol>
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</div>
<!-- end page-title -->

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="page-wrapper">
                    <div class="row">
                        <table class="table table-striped table-bordered table-list">
                            <thead>
                            <tr>

                                <th>ID</th>
                                <th>Login</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>E-mail</th>
                                <th>Telefon</th>
                                <th>Typ użytkownika</th>
                                <th>Czy aktywny?</th>


                                <th><em class="fa fa-cog"></em></th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${listOfUsers}" var="userLoop">
                                <tr>
                                    <td>
                                            ${userLoop.getId()}
                                    </td>
                                    <td>
                                            ${userLoop.getLogin()}
                                    </td>
                                    <td>
                                            ${userLoop.getName()}
                                    </td>
                                    <td>
                                            ${userLoop.getSurname()}
                                    </td>
                                    <td>
                                        <a href="mailto:${userLoop.getEmail()}">${userLoop.getEmail()}</a>
                                    </td>
                                    <td>
                                            ${userLoop.getPhoneNumber()}
                                    </td>
                                    <td>
                                            ${userLoop.getUserType()}
                                    </td>
                                    <td>
                                            ${userLoop.getActive()}
                                    </td>


                                    <td align="center">
                                        <a
                                           href="UserEditServlet?id=${userLoop.getId()}"><em
                                                class="fa fa-pencil color-aqua"></em></a>
                                        <c:set var="active" scope="session" value="${userLoop.getActive()}"/>
                                        <c:if test="${active}">
                                        <a href="UserDeleteServlet?id=${userLoop.getId()}"><em class="fa fa-trash color-green"></em></a>
                                        </c:if>
                                        <c:if test="${!active}">
                                        <a href="UserDeleteServlet?id=${userLoop.getId()}"><em class="fa fa-plus color-red"></em></a>
                                        </c:if>


                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div><!-- end row -->
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</section>


<%@include file="footer.jsp" %>
</div>