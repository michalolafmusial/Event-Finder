<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="header.jsp" %>

</header><!-- end header -->

<div class="page-title">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <h2>Event name: ${event.getName()}</h2>
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
            <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                <div class="page-wrapper">

                    <div class="pp">

                        <img src="${event.getImageURL()}" alt="" class="img-fluid img-fullwidth">

                        <h3><strong>${event.getName()}</strong></h3>

                        <p><strong>${event.getStartDate()} - ${event.getFinishDate()}</strong></p>

                        <P><strong>Miejsce:</strong>
                            <BR>${event.getAddress()} - <a href="${event.getGoogleMaps()}" target="_blank">Mapa
                                dojazdu</a></BR>

                        <P><strong>Organizator:</strong>
                            <BR>${event.getOrganizer()}</BR>

                        <P><strong>Opis wydarzenia:</strong>
                            <br>${event.getDescription()}</p>

                        <P><strong>Zostało jeszcze ${availableTickets} biletów w
                            cenie ${event.getPrice()}/szt.</strong></P>

                        <form class="form-wrapper" method="post" action="/ticketsbuyservlet">

                            Kupuję bilet wstępu na event, sztuk: <input name="numberOfTickets" type="number" min="1"
                                                                        max="${availableTickets}">
                            <input name="eventId" value="${event.getId()}" type="hidden">
                            <input name="userID" value="${userId}" type="hidden">
                            <input name="availableTickets" value=${availableTickets} type="hidden">
                            <button type="submit" class="btn btn-primary">Kupuję<i
                                    class="fa fa-money"></i></button>

                        </form>

                    </div><!-- end pp -->
                </div><!-- end page-wrapper -->
            </div><!-- end col -->


        </div><!-- end row -->
    </div><!-- end container -->
</section>

<%@include file="footer.jsp" %>