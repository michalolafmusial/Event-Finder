<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>

<div class="page-title">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <h2><i class="fa fa-calendar"></i> Eventy</h2>
            </div><!-- end col -->
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Start</a></li>
                    <li class="breadcrumb-item"><a href="#">Administracja</a></li>
                    <li class="breadcrumb-item active"><a href="#">Eventy</a></li>
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


                        <table class="table table-striped table-bordered table-list table-hover">
                            <thead>
                            <tr>

                                <th>ID</th>
                                <th>Nazwa</th>
                                <th>Opis imprezy</th>
                                <th>Początek eventu</th>
                                <th>Koniec eventu</th>
                                <th>Adres</th>
                                <th>Google maps</th>
                                <th>Organizator</th>
                                <th>Cena za bilet</th>
                                <th>Ilość biletów</th>
                                <th>Kategoria</th>
                                <th>Promocja</th>


                                <th><em class="fa fa-cog"></em></th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${listOfEvents}" var="eventLoop">
                                <tr>
                                    <td>
                                            ${eventLoop.getId()}
                                    </td>
                                    <td>
                                            ${eventLoop.getName()}
                                    </td>
                                    <td>
                                            ${eventLoop.getDescription()}
                                    </td>
                                    <td>
                                            ${eventLoop.getStartDate()}
                                    </td>
                                    <td>
                                            ${eventLoop.getFinishDate()}
                                    </td>
                                    <td>
                                            ${eventLoop.getAddress()}
                                    </td>
                                    <td>
                                        <c:set var="googlemaps" scope="session" value="${eventLoop.getGoogleMaps()}"/>

                                        <c:if test="${googlemaps != ''}">
                                            <a href="${eventLoop.getGoogleMaps()}" target="_blank"><em
                                                    class="fa fa-map-marker color-green"></em></a>
                                        </c:if>
                                        <c:if test="${googlemaps == ''}">
                                            <em class="fa fa-warning color-red"></em></a>
                                        </c:if>


                                    </td>
                                    <td>
                                            ${eventLoop.getOrganizer()}
                                    </td>
                                    <td>
                                            ${eventLoop.getPrice()}
                                    </td>
                                    <td>
                                            ${eventLoop.getTickets()}
                                    </td>
                                    <td>
                                            ${eventLoop.getCategory()}
                                    </td>
                                    <td>
                                            ${eventLoop.isPromote()}
                                    </td>


                                    <td align="center">
                                        <a href="EventEditServlet?id=${eventLoop.getId()}"><em
                                                class="fa fa-pencil color-aqua"></em></a>
                                        <c:set var="active" scope="session" value="${eventLoop.getActive()}"/>
                                        <c:if test="${active}">
                                            <a href="EventDeleteServlet?id=${eventLoop.getId()}"><em
                                                    class="fa fa-trash color-red"></em></a>
                                        </c:if>
                                        <c:if test="${!active}">
                                            <a href="EventDeleteServlet?id=${eventLoop.getId()}"><em
                                                    class="fa fa-plus color-green"></em></a>
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