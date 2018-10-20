<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>


<div class="page-title">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <h2><i class="fa fa-user"></i> Edit user</h2>
            </div><!-- end col -->
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Start</a></li>
                    <li class="breadcrumb-item active"><a href="#">Edit User</a></li>
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
                            <form class="form-wrapper" method="post" action="/UserEditServlet">
                                <h4>Edit user</h4>
                                Login (not-editable): <input type="text" class="form-control" name="login" placeholder="login"
                                       value="${user.getLogin()}" disabled>
                                Name: <input type="text" class="form-control" name="name" placeholder="name"
                                       value="${user.getName()}" required>
                                Surname: <input type="text" class="form-control" name="surname" placeholder="surname"
                                       value="${user.getSurname()}" required>
                                Email: <input type="email" class="form-control" name="email" placeholder="email"
                                       value="${user.getEmail()}" required>
                                Phone: <input type="tel" class="form-control" name="phone" placeholder="phone"
                                       value="${user.getPhoneNumber()}">
                                Type: <select class="form-control" name="type" value="${user.getUserType()}">
                                    <option>NORMAL</option>
                                    <option>BUSINESS</option>
                                    <option>ADMIN</option>
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