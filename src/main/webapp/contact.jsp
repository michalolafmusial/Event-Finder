<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>

<div class="page-title">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <h2><i class="fa fa-envelope-o"></i> Kontakt</h2>
            </div><!-- end col -->
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Start</a></li>
                    <li class="breadcrumb-item"><a href="#">Strony</a></li>
                    <li class="breadcrumb-item active"><a href="#">Kontakt</a></li>
                </ol>
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</div>
<!-- end page-title -->

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                <div class="page-wrapper">
                    <div class="row">
                        <div class="col-lg-12">
                            <h4>Wyślij nam wiadomość</h4>
                            <p>Jeśli masz jakieś pytania, problemy albo propozycje - wyślij nam wiadomość. Na pewno odpowiemy!</p>
                        </div>

                        <div class="col-lg-12">
                            <form class="form-wrapper" method="post" action="/Contact">
                                <h4>Wiadomość</h4>
                                Email: <input type="text" class="form-control" name="email" placeholder="email"
                                              required>
                                Temat: <input type="text" class="form-control" name="subject" placeholder="temat"
                                              required>
                                Treść: <textarea cols="30" rows="10" class="form-control" name="content" placeholder="treść wiadomości"
                                              required></textarea>



                                <button type="submit" name="save" class="btn btn-primary">Wyślij wiadomość <i
                                        class="fa fa-send"></i></button>
                            </form>
                        </div>


                    </div>
                </div><!-- end row -->
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</section>


<%@include file="footer.jsp" %>