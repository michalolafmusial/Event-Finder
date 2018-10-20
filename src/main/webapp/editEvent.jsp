<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>


<div class="page-title">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <h2><i class="fa fa-user"></i> Edit event</h2>
            </div><!-- end col -->
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Start</a></li>
                    <li class="breadcrumb-item active"><a href="#">Edit Event</a></li>
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


                    </div>
                    <!-- end row -->


                    <div class="row">


                        <div class="col-lg-6">
                            <form class="form-wrapper" method="post" action="/EventEditServlet">
                                <h4>Edycja Eventu</h4>
                                Nazwa eventu: <input type="text" class="form-control" name="name" placeholder="Nazwa"
                                                     value="${event.getName()}" required>
                                Opis eventu: <input type="text" class="form-control" name="description"
                                                    placeholder="Opis"
                                                    value="${event.getDescription()}" required>
                                Początek: <input type="date" class="form-control" name="start_date"
                                                 placeholder="Data rozpoczęcia"
                                                 value="${start_date}" required>
                                Koniec: <input type="date" class="form-control" name="finish_date"
                                               placeholder="Data zakończeniae"
                                               value="${finish_date}" required>
                                Adres: <input type="text" class="form-control" name="address"
                                              placeholder="Adres imprezy"
                                              value="${event.getAddress()}">
                                Google Maps: <input type="text" class="form-control" name="google_maps"
                                                    placeholder="Link do google maps"
                                                    value="${event.getGoogleMaps()}">
                                Organizator: <input type="number" min="1" step="1" class="form-control" name="organizer"
                                                    placeholder=""
                                                    value="${event.getOrganizer()}" required>
                                Cena za wstęp: <input type="number" min="0.01" step="0.01" class="form-control"
                                                      name="price"
                                                      placeholder="Cena za wstęp w PLN"
                                                      value="${event.getPrice()}" required>
                                Ilość biletów: <input type="number" min="1" step="1" class="form-control" name="tickets"
                                                      placeholder="ilość biletów"
                                                      value="${event.getTickets()}" required>


                                Category: <select class="form-control" name="category" value="${event.getCategory()}">
                                <option>MUSIC</option>
                                <option>SPORT</option>
                                <option>TRAVEL</option>
                                <option>IT</option>
                                <option>FASHION</option>
                                <option>LIFESTYLE</option>
                                <option>FOOD</option>
                                <option>HEALTH</option>
                                <option>ENTERTAIMENT</option>
                            </select>

                                Promote?: <select class="form-control" name="promote" value="${event.isPromote()}">
                                <option>YES</option>
                                <option>NO</option>

                            </select>


                                <button type="submit" name="save" class="btn btn-primary">Zaktualizuj <i
                                        class="fa fa-save"></i></button>
                            </form>
                        </div>
                    </div>
                </div><!-- end page-wrapper -->
            </div><!-- end col -->


        </div><!-- end row -->
    </div><!-- end container -->
</section>


<%@include file="footer.jsp" %>