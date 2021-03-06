<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/user/save" var="updateURL"/>
<style>
    .form-group {
        margin-top: 5px;
        margin-bottom: 5px;
    }
</style>
<script>
    $(document).ready(function () {
        //$('.${update}').addClass('active');
    });
</script>

<div class="container">
    <!-- Small modal window-->
    <c:if test="${status=='OK'}">
        <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span
                    class="sr-only">Close</span></button>
            <strong>Success!</strong> Your data is saved successfully!!!
        </div>
    </c:if>
    <c:if test="${status=='ERROR'}">
        <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span
                    class="sr-only">Close</span></button>
            <strong>Error!</strong> Your data wasn't saved!!!
        </div>
    </c:if>
    <div class="col-md-12" role="main" id="userData">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    My profile <sec:authorize
                        access="isAuthenticated()">[${pageContext.request.userPrincipal.name}]</sec:authorize>
                </h3>
            </div>
            <div class="panel-body">
                <form:form method="post" action="${updateURL}" modelAttribute="user" cssClass="form-horizontal"
                           role="form" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-md-2">
                            <img src="/resources/images/${user.avatar}" class="img-responsive" alt="Responsive image"
                                 id="userAvatar">

                            <div class="controls clearfix">
                        <span class="btn btn-success btn-file">
                            <i class="glyphicon glyphicon-camera"></i> <span>change avatar</span>
                            <input type="file" name="image" id="image"/>
                        </span>
                            </div>
                        </div>
                        <div class="col-md-6">

                            <form:hidden path="id"/>

                            <div class="form-group">
                                <label for="login" class="col-sm-2 control-label">NickName</label>

                                <div class="col-md-10">
                                    <form:input path="login" placeholder="login" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-sm-2 control-label">E-mail</label>

                                <div class="col-md-10">
                                    <form:input path="email" placeholder="email" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">Password</label>

                                <div class="col-md-10">
                                    <form:password path="password" value="${user.password}" placeholder="password"
                                                   cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirmPassword" class="col-sm-2 control-label">Confirm</label>

                                <div class="col-md-10">
                                    <input type="password" id="confirmPassword" value="${user.password}"
                                           placeholder="repeat password"
                                           class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group last">
                                <button type="submit" class="btn btn-success">Save</button>
                            </div>

                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>


</div>