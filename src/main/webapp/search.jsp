<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>


<div class="page-title">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <h2><i class="fa fa-search"></i> Wyszukiwanie: ${stringForSearch}</h2>
            </div><!-- end col -->
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Start</a></li>
                    <li class="breadcrumb-item"><a href="#">Strony</a></li>
                    <li class="breadcrumb-item active"><a href="#">Wyszukiwanie</a></li>
                </ol>
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</div>


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
                                <th>Name</th>
                                <th>Description</th>
                                <th>Start Date</th>
                                <th>Finish Date</th>
                                <th>Address</th>
                                <th>Google maps</th>
                                <th>Organizer</th>
                                <th>Price</th>
                                <th>Ticekts</th>
                                <th>Category</th>
                                <th>Promote</th>


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
                                            ${eventLoop.getGoogleMaps()}
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
                                        <a
                                                href="EventEditServlet?id=${eventLoop.getId()}"><em
                                                class="fa fa-pencil"></em></a>
                                        <!--     <a
                                                href="DeleteEventFromDbServletGet?id=${eventLoop.getId()}"><em
                                                class="fa fa-trash"></em></a>
-->
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


<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="section-title">
                    <h3 class="color-aqua"><a href="blog-category-01.html" title="">Lifestyle</a></h3>
                </div><!-- end title -->

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="blog-box">
                            <div class="post-media">
                                <a href="single.html" title="">
                                    <img src="upload/blog_05.jpg" alt="" class="img-fluid">
                                    <div class="hovereffect">
                                        <span></span>
                                    </div><!-- end hover -->
                                </a>
                            </div><!-- end media -->
                            <div class="blog-meta big-meta">
                                <h4><a href="single.html" title="">The golden rules you need to know for a positive
                                    life</a></h4>
                                <p>Aenean interdum arcu blandit, vehicula magna non, placerat elit. Mauris et
                                    pharetratortor. Suspendissea sodales urna. In at augue elit. Vivamus enim nibh,
                                    maximus ac felis nec, maximus tempor odio.</p>
                                <small><a href="blog-category-01.html" title="">Lifestyle</a></small>
                                <small><a href="single.html" title="">24 July, 2017</a></small>
                                <small><a href="blog-author.html" title="">by Amanda</a></small>
                            </div><!-- end meta -->
                        </div><!-- end blog-box -->

                        <hr class="invis">

                        <div class="blog-box">
                            <div class="post-media">
                                <a href="single.html" title="">
                                    <img src="upload/blog_06.jpg" alt="" class="img-fluid">
                                    <div class="hovereffect">
                                        <span></span>
                                    </div><!-- end hover -->
                                </a>
                            </div><!-- end media -->
                            <div class="blog-meta big-meta">
                                <h4><a href="single.html" title="">I have a desert visit this summer</a></h4>
                                <p>Aenean interdum arcu blandit, vehicula magna non, placerat elit. Mauris et
                                    pharetratortor. Suspendissea sodales urna. In at augue elit. Vivamus enim nibh,
                                    maximus ac felis nec, maximus tempor odio.</p>
                                <small><a href="blog-category-01.html" title="">Lifestyle</a></small>
                                <small><a href="single.html" title="">22 July, 2017</a></small>
                                <small><a href="blog-author.html" title="">by Martines</a></small>
                            </div><!-- end meta -->
                        </div><!-- end blog-box -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end col -->

            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="section-title">
                    <h3 class="color-aqua"><a href="blog-category-01.html" title="">Lifestyle</a></h3>
                </div><!-- end title -->

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="blog-box">
                            <div class="post-media">
                                <a href="single.html" title="">
                                    <img src="upload/blog_05.jpg" alt="" class="img-fluid">
                                    <div class="hovereffect">
                                        <span></span>
                                    </div><!-- end hover -->
                                </a>
                            </div><!-- end media -->
                            <div class="blog-meta big-meta">
                                <h4><a href="single.html" title="">The golden rules you need to know for a positive
                                    life</a></h4>
                                <p>Aenean interdum arcu blandit, vehicula magna non, placerat elit. Mauris et
                                    pharetratortor. Suspendissea sodales urna. In at augue elit. Vivamus enim nibh,
                                    maximus ac felis nec, maximus tempor odio.</p>
                                <small><a href="blog-category-01.html" title="">Lifestyle</a></small>
                                <small><a href="single.html" title="">24 July, 2017</a></small>
                                <small><a href="blog-author.html" title="">by Amanda</a></small>
                            </div><!-- end meta -->
                        </div><!-- end blog-box -->

                        <hr class="invis">

                        <div class="blog-box">
                            <div class="post-media">
                                <a href="single.html" title="">
                                    <img src="upload/blog_06.jpg" alt="" class="img-fluid">
                                    <div class="hovereffect">
                                        <span></span>
                                    </div><!-- end hover -->
                                </a>
                            </div><!-- end media -->
                            <div class="blog-meta big-meta">
                                <h4><a href="single.html" title="">I have a desert visit this summer</a></h4>
                                <p>Aenean interdum arcu blandit, vehicula magna non, placerat elit. Mauris et
                                    pharetratortor. Suspendissea sodales urna. In at augue elit. Vivamus enim nibh,
                                    maximus ac felis nec, maximus tempor odio.</p>
                                <small><a href="blog-category-01.html" title="">Lifestyle</a></small>
                                <small><a href="single.html" title="">22 July, 2017</a></small>
                                <small><a href="blog-author.html" title="">by Martines</a></small>
                            </div><!-- end meta -->
                        </div><!-- end blog-box -->
                    </div><!-- end col -->
                </div><!-- end row -->


            </div><!-- end col -->
        </div><!-- end row -->


        <hr class="invis1">

    </div><!-- end row -->


    </div><!-- end container -->
</section>


<%@include file="footer.jsp" %>
