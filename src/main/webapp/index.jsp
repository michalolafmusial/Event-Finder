<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>




<section class="section first-section">
    <div class="container-fluid">
        <div class="masonry-blog clearfix">

<c:forEach items="${listOfEventsMainPage}" var="eventLoop">
            <div class="center-side">
                <div class="masonry-box post-media">
                    <img src="${eventLoop.getImageURL()}" alt=""
                         class="img-fluid">
                    <div class="shadoweffect">
                        <div class="shadow-desc">
                            <div class="blog-meta">
                                <span class="bg-aqua"><a href="EventDetails?id=${eventLoop.getId()}"
                                                         title="">${eventLoop.getCategory()}</a></span>
                                <h4><a href="EventDetails?id=${eventLoop.getId()}"
                                       title="">${eventLoop.getName()}</a>
                                </h4>
                                <small><a href="EventDetails?id=${eventLoop.getId() }" title="">Start
                                    date: ${eventLoop.getStartDate()}</a>
                                </small>
                                <small><a href="EventDetails?id=${eventLoop.getId()}" title="">End
                                    date: ${eventLoop.getFinishDate()}</a>
                                </small>
                            </div><!-- end meta -->
                        </div><!-- end shadow-desc -->
                    </div><!-- end shadow -->
                </div><!-- end post-media -->
            </div><!-- end left-side -->
</c:forEach>


        </div><!-- end masonry -->
    </div>
</section>




<%--<section class="section">--%>
    <%--<div class="container">--%>
        <%--<div class="row">--%>
            <%--<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">--%>
                <%--<div class="section-title">--%>
                    <%--<h3 class="color-aqua"><a href="blog-category-01.html" title="">Lifestyle</a></h3>--%>
                <%--</div><!-- end title -->--%>

                <%--<div class="row">--%>
                    <%--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
                        <%--<div class="blog-box">--%>
                            <%--<div class="post-media">--%>
                                <%--<a href="single.html" title="">--%>
                                    <%--<img src="upload/blog_05.jpg" alt="" class="img-fluid">--%>
                                    <%--<div class="hovereffect">--%>
                                        <%--<span></span>--%>
                                    <%--</div><!-- end hover -->--%>
                                <%--</a>--%>
                            <%--</div><!-- end media -->--%>
                            <%--<div class="blog-meta big-meta">--%>
                                <%--<h4><a href="single.html" title="">The golden rules you need to know for a positive--%>
                                    <%--life</a></h4>--%>
                                <%--<p>Aenean interdum arcu blandit, vehicula magna non, placerat elit. Mauris et--%>
                                    <%--pharetratortor. Suspendissea sodales urna. In at augue elit. Vivamus enim nibh,--%>
                                    <%--maximus ac felis nec, maximus tempor odio.</p>--%>
                                <%--<small><a href="blog-category-01.html" title="">Lifestyle</a></small>--%>
                                <%--<small><a href="single.html" title="">24 July, 2017</a></small>--%>
                                <%--<small><a href="blog-author.html" title="">by Amanda</a></small>--%>
                            <%--</div><!-- end meta -->--%>
                        <%--</div><!-- end blog-box -->--%>

                        <%--<hr class="invis">--%>

                        <%--<div class="blog-box">--%>
                            <%--<div class="post-media">--%>
                                <%--<a href="single.html" title="">--%>
                                    <%--<img src="upload/blog_06.jpg" alt="" class="img-fluid">--%>
                                    <%--<div class="hovereffect">--%>
                                        <%--<span></span>--%>
                                    <%--</div><!-- end hover -->--%>
                                <%--</a>--%>
                            <%--</div><!-- end media -->--%>
                            <%--<div class="blog-meta big-meta">--%>
                                <%--<h4><a href="single.html" title="">I have a desert visit this summer</a></h4>--%>
                                <%--<p>Aenean interdum arcu blandit, vehicula magna non, placerat elit. Mauris et--%>
                                    <%--pharetratortor. Suspendissea sodales urna. In at augue elit. Vivamus enim nibh,--%>
                                    <%--maximus ac felis nec, maximus tempor odio.</p>--%>
                                <%--<small><a href="blog-category-01.html" title="">Lifestyle</a></small>--%>
                                <%--<small><a href="single.html" title="">22 July, 2017</a></small>--%>
                                <%--<small><a href="blog-author.html" title="">by Martines</a></small>--%>
                            <%--</div><!-- end meta -->--%>
                        <%--</div><!-- end blog-box -->--%>
                    <%--</div><!-- end col -->--%>
                <%--</div><!-- end row -->--%>
            <%--</div><!-- end col -->--%>

            <%--<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">--%>
                <%--<div class="section-title">--%>
                    <%--<h3 class="color-aqua"><a href="blog-category-01.html" title="">Lifestyle</a></h3>--%>
                <%--</div><!-- end title -->--%>

                <%--<div class="row">--%>
                    <%--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
                        <%--<div class="blog-box">--%>
                            <%--<div class="post-media">--%>
                                <%--<a href="single.html" title="">--%>
                                    <%--<img src="upload/blog_05.jpg" alt="" class="img-fluid">--%>
                                    <%--<div class="hovereffect">--%>
                                        <%--<span></span>--%>
                                    <%--</div><!-- end hover -->--%>
                                <%--</a>--%>
                            <%--</div><!-- end media -->--%>
                            <%--<div class="blog-meta big-meta">--%>
                                <%--<h4><a href="single.html" title="">The golden rules you need to know for a positive--%>
                                    <%--life</a></h4>--%>
                                <%--<p>Aenean interdum arcu blandit, vehicula magna non, placerat elit. Mauris et--%>
                                    <%--pharetratortor. Suspendissea sodales urna. In at augue elit. Vivamus enim nibh,--%>
                                    <%--maximus ac felis nec, maximus tempor odio.</p>--%>
                                <%--<small><a href="blog-category-01.html" title="">Lifestyle</a></small>--%>
                                <%--<small><a href="single.html" title="">24 July, 2017</a></small>--%>
                                <%--<small><a href="blog-author.html" title="">by Amanda</a></small>--%>
                            <%--</div><!-- end meta -->--%>
                        <%--</div><!-- end blog-box -->--%>

                        <%--<hr class="invis">--%>

                        <%--<div class="blog-box">--%>
                            <%--<div class="post-media">--%>
                                <%--<a href="single.html" title="">--%>
                                    <%--<img src="upload/blog_06.jpg" alt="" class="img-fluid">--%>
                                    <%--<div class="hovereffect">--%>
                                        <%--<span></span>--%>
                                    <%--</div><!-- end hover -->--%>
                                <%--</a>--%>
                            <%--</div><!-- end media -->--%>
                            <%--<div class="blog-meta big-meta">--%>
                                <%--<h4><a href="single.html" title="">I have a desert visit this summer</a></h4>--%>
                                <%--<p>Aenean interdum arcu blandit, vehicula magna non, placerat elit. Mauris et--%>
                                    <%--pharetratortor. Suspendissea sodales urna. In at augue elit. Vivamus enim nibh,--%>
                                    <%--maximus ac felis nec, maximus tempor odio.</p>--%>
                                <%--<small><a href="blog-category-01.html" title="">Lifestyle</a></small>--%>
                                <%--<small><a href="single.html" title="">22 July, 2017</a></small>--%>
                                <%--<small><a href="blog-author.html" title="">by Martines</a></small>--%>
                            <%--</div><!-- end meta -->--%>
                        <%--</div><!-- end blog-box -->--%>
                    <%--</div><!-- end col -->--%>
                <%--</div><!-- end row -->--%>


            <%--</div><!-- end col -->--%>
        <%--</div><!-- end row -->--%>


        <%--<hr class="invis1">--%>

    <%--</div><!-- end row -->--%>


    <%--</div><!-- end container -->--%>
<%--</section>--%>




<%@include file="footer.jsp" %>
