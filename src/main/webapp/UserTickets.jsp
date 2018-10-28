<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="header.jsp" %>

</header><!-- end header -->

<div class="page-title">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <h2>User name: ${user.getName()}</h2>
            </div><!-- end col -->
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active"><a href="#">Pages</a></li>
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


                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${listOfUserTickets}" var="userTicketsLoop">
                                <tr>
                                    <td>
                                            ${userTicketsLoop.get(0)}
                                    </td>
                                    <td>
                                            ${userTicketsLoop.getName()}
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