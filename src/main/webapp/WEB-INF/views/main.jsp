<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA4YR8loJtUaiviLc-WxnBsSH9Znt9TNEY"></script>
    <script src="<c:url value="/resources"/>/scripts/map.js"></script>
    <script src="<c:url value="/resources"/>/jquery/jquery.cookie.js"></script>
    <script src="<c:url value="/resources"/>/jquery/jquery.contextMenu.js"></script>
    <script src="<c:url value="/resources"/>/jquery/jquery.ui.position.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources"/>/styles/jquery.contextMenu.css">
    <style>
        .popup-menu{
            border:1px solid black;
            position:absolute;
            z-index:1000;
            background-color:#FFFFFF;
            margin:0px;
            padding:0px;
            width:200px;
        }
        .popup-menu-item{
            padding-left:10px;
            border-bottom:1px solid black;
            display:inline-table;
            width:198px;
        }

        .popup-menu-item:hover{
            background-color: #c4e3f3;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <div class="input-group">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" onclick="getLocation()"><span class="glyphicon glyphicon-globe"></span>
                    </button>
                </span>
                <input type="text" class="form-control" id="userAddress"
                       title="" data-content="" data-placement="bottom" data-toggle="popover"
                       data-original-title="" onclick="hidePopover('userAddress')"/>
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" onclick="setLocationByAddress()"><span class="glyphicon glyphicon-search"
                                                                        title="Find"></span></button>
                </span>
            </div>
            <div id="map_container" style="height: 500px" class="media">
                <!-- Map is here  -->
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Filter
                    </h3>
                </div>
                <div class="panel-body">
                    <form action="" method="get" onsubmit="updateFilter()" class="form">
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Network">

                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-default dropdown-toggle"
                                            data-toggle="dropdown" aria-expanded="false"><span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                        <li><a href="#">Atmosfera</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" class="form-control " placeholder="Bank">

                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-default dropdown-toggle"
                                            data-toggle="dropdown" aria-expanded="false"><span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                        <li><a href="#">Privatbank</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="otherNetworks">
                                    Show banks from other networks
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="checkbox">
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="ATMs">
                                    ATMs
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="offices">
                                    Offices
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <label class="input-group-addon">Distance: </label>
                                <input type="text" class="form-control bfh-number" data-min="50" data-max="600" id="distance">
                                <label class="input-group-addon">m </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <a href="#" class="btn btn-default col-md-12" onclick="updateFilter()">Update filter</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="popup-menu" style = "display:none">
	<div class="popup-menu-item">Add to favorites</div>
	<div class="popup-menu-item">Add comment</div>
</div>
</body>
</html>
