<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@include file="header.jsp" %>




<div class="page-title">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <h2><i class="fa fa-question"></i> Błąd</h2>
            </div><!-- end col -->
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Start</a></li>
                    <li class="breadcrumb-item active">Błąd</li>
                </ol>
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</div><!-- end page-title -->


<% request.getAttribute("errorTitle"); %>
<% request.getAttribute("errorDecscription"); %>



<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-wrapper">
                    <div class="notfound">
                        <div class="row">
                            <div class="col-md-8 offset-md-2 text-center">
                                <h2>Błąd</h2>
                                <h3>${errorTitle}</h3>
                                <p>${errorDecscription}</p>
                                <a href="index.jsp" class="btn btn-primary">Strona główna</a>
                            </div>
                        </div>
                    </div>
                </div><!-- end page-wrapper -->
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</section>



<%@include file="footer.jsp"%>