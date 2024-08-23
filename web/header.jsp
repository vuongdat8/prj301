

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="mainmenu-area">
    <div class="container">
        <div class="row">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div> 
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><img src="img/2020-FPTU-Eng.png" style="height: 50px;"alt=""/></li>
                    <li><a href="home">Home</a></li>

                    <c:if test="${sessionScope.account != null}">
                        <c:if  test="${sessionScope.account.role == 1}">
                            <li><a href="manage">(Admin)Manage</a></li>
                        </c:if>
                        
                        <li><a href="logout">Logout</a></li>
                        </c:if>
                        <c:if test="${sessionScope.account == null}">
                        <li><a href="login">Login</a></li>
                        </c:if>


                </ul>
            </div>  
        </div>
    </div>
</div> <!-- End mainmenu area -->
