<%-- 
    Document   : addproduct
    Created on : Nov 25, 2018, 5:18:28 PM
    Author     : User
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <style type="text/css">

            .panel>.panel-heading {
                color: #558b2f;
                background-color: #aed581;
                border-color: #aed581;
            }
            .panel>.panel-body
            {
                background-color: #f1f8e9;
                border-color: #aed581;
            }

            .form-control:FOCUS
            {
                border: 2px thin #9ccc65;
                border-radius: 5px;
            }
            .list-group-item {
                overflow: hidden;
            }
            #removebuttons
            {
                color: #ffffff;
                background-color: #e57373;
            }
            #removebuttons:HOVER {
                color: #ffffff;
                background-color: #e53935;
            }
            #editbuttons{
                color: #ffffff;
                background: linear-gradient(to bottom, #aed581 50%, #9ccc65 50%);	
            }
            #editbuttons:HOVER {
                color: #ffffff;
                background: linear-gradient(to bottom, #9ccc65 50%, #8bc34a 50%);	
            }
        </style>
        <script src="resources/js/angular.js"></script>

        <script>
            var passengerlist = ${passengerlist};
            var fromstationtlist = ${fromstationtlist};
            var tostationtlist = ${tostationtlist};
            var starttimelist = ${starttimelist};
            var endtimelist = ${endtimelist};
            angular.module('passengerapp', []).controller('passengerController',
                    function ($scope) {
                        $scope.passg = passengerlist;
                        $scope.froms = fromstationtlist;
                        $scope.tos = tostationtlist;
                        $scope.strtt = starttimelist;
                        $scope.endtt = endtimelist;
                        console.log($scope.passg);
                        console.log($scope.froms);
                        console.log($scope.tos);
                        console.log( $scope.strtt);
                        console.log( $scope.endtt);
                    });
        </script>
    </head>
    <a href="welcome" class="btn" id="loginbutton"><button type="button" class="btn btn-default">Home</button></a>
    <body ng-app="passengerapp" ng-controller="passengerController">
        <jsp:include page="header.jsp" />
        <div class="container-fluid"
             style="width: 90%; margin-top: 10px; margin-bottom: 10px">
            <div class="panel animated fadeInDown delay-05s" id="panel-1">
                <div class="panel-heading">
                    <span class="lead">Managing Passengers</span>
                </div>
                <!-- end panel heading -->
                <div class="panel-body">
                    <div class="formcontainer ">
                        <form:form commandName="Passengerinfobject" action="addingpassinfo"
                                   enctype="multipart/form-data">
                            <c:if test="${check}">
                                <div class="form-group" hidden="true">

                                    <form:input class="form-control" Placeholder="Passengers Id"
                                                type="text" path="passid" required="true"></form:input>
                                    </div>
                            </c:if>
                            <c:if test="${!check}">
                                <div class="form-group">
                                    <form:input class="form-control" Placeholder="Passengers Id"
                                                type="text" path="passid" readonly="true" required="true"></form:input>
                                    </div>
                            </c:if>
                            <div class="form-group">
                                <form:input class="form-control" Placeholder="Passengers Name"
                                            type="text" path="passname" required="true"></form:input>
                                </div>
                                <div class="form-group">
                                <form:input type="text" class="form-control"
                                            placeholder=" passenger address" path="passaddress" required="true"></form:input>
                                </div>
                                <div class="form-group">
                                <form:input type="email" class="form-control"
                                            Placeholder="Passengers gmail"  path="passgmail" value="${UserId}" required="true"></form:input>
                                </div>
                                <div class="form-group">
                                    <label>Sex</label>
                                    <label class="radio-inline">
                                    <form:radiobutton path="passgender" value="Male"/>Male </label>
                                <label class="radio-inline">
                                    <form:radiobutton path="passgender" value="Female"/>Female </label>
                            </div>
                            <div class="form-group">
                                <form:input type="number" class="form-control"
                                            placeholder="Age" path="passage" required="true"></form:input>
                                </div>
                                <div class="form-group">
                                <form:input type="text" class="form-control"
                                            placeholder="Mobile Number " path="passstatus" required="true"></form:input>
                                </div>
                                <div class="form-group">
                                <form:input type="text" class="form-control"
                                            placeholder="Passengers tickettakendate" path="ticketpurdate" required="true"></form:input>
                                </div>
                                <div class="form-group">
                                <form:input type="text" class="form-control"
                                            placeholder="Passengers tickettakendate" path="tickettakendate" required="true"></form:input>
                                </div>
                               <div class="form-group">
                                    <select class="form-control" ng-model="fromstationids" ng-options="x.fromstationid as x.fromstname for x in froms" >
                                        <option value="">-- choose an option --</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                <form:hidden  class="form-control" value="{{fromstationids}}" path="fromstationid"></form:hidden>
                                </div>
                                <div class="form-group">
                                    <select class="form-control" ng-model="tostationids" ng-options="x.tostationid as x.tostname  for x in tos" >
                                        <option value="">-- choose an option --</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                <form:hidden  class="form-control" value="{{tostationids}}" path="tostationid"></form:hidden>
                                </div>
                                <div class="form-group">
                                    <select class="form-control" ng-model="starttimeids" ng-options="x.starttimeid as x.stime for x in strtt" >
                                        <option value="">-- choose an option --</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                <form:hidden  class="form-control" value="{{starttimeids}}" path="starttimeid"></form:hidden>
                                </div>
                                <div class="form-group">
                                    <select class="form-control" ng-model="endtimeids" ng-options="x.endtimeid as x.etime  for x in endtt" >
                                        <option value="">-- choose an option --</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                <form:hidden  class="form-control" value="{{endtimeids}}" path="endtimeid"></form:hidden>
                                </div>
                            <c:if test="${check}">
                                <form:button id="editbuttons" type="submit" name="Add" class="btn">Add
                                    Details</form:button>
                                <form:button id="removebuttons" type="reset" class="btn">Reset
                                    Details</form:button>
                            </c:if>
                            <c:if test="${!check}">
                                <form:button id="editbuttons" type="submit" name="Edit" class="btn">Edit
                                    Details</form:button>
                                <form:button id="removebuttons" type="reset" class="btn">Reset
                                    Details</form:button>
                            </c:if>
                        </form:form>
                    </div>
                    <!-- panel body end 
                </div>
            </div>
                    <!-- panel end -->
                    <div class="panel animated fadeInUp delay-05s" id="panel-2">
                        <div class="panel-heading">
                            <span class="lead">Passsengers List</span>
                        </div>
                        <p><input type="text" ng-model="test" class="form-control" placeholder="Search Product"></p>
                        <!-- end panel2 heading -->
                        <div class="panel-body">
                            <ul class="list-group">
                                <li class="list-group-item" height="45px"
                                    ng-repeat=" passengers in passg| filter:test" >
                                    <table style="width: 100%" >
                                        <tr>

                                            <td>
                                                <!-- //passid, passaddress, passage, passgender, passgmail,
                                                //        passname, passstatus, starttime, endtime, ticketpurdate, tickettakendate, fromstname, tostname                                  -->
                                                <ul>
                                                    <li><span><b>passengers Id: </b></span>{{passengers.passid}}</li>
                                                    <li><span><b>passengers Name: </b></span>{{passengers.passname}}</li>
                                                    <li><span><b>passengers Address: </b></span>{{passengers.passaddress}}</li>
                                                    <li><span><b>passengers Gmail: </b></span>{{passengers.passgmail}}</li>
                                                    <li><span><b>passengers Gender: </b></span>{{passengers.passgender}}</li>
                                                    <li><span><b>passengers Age: </b></span>{{passengers.passage}}</li>
                                                    <li><span><b>passengers Ticket Purchase Date: </b></span>{{passengers.ticketpurdate}}</li>
                                                    <li><span><b>passengers Ticket Taken Date </b></span>{{passengers.tickettakendate}}</li>
                                                    <li><span><b>passengers Status: </b></span>{{passengers.fromstationid}}</li>
                                                    <li><span><b>passengers Arrival Time: </b></span>{{passengers.tostationid}}</li>
                                                    <li><span><b>passengers Ticket Taken Date </b></span>{{passengers.starttimeid}}</li>
                                                    <li><span><b>passengers Status: </b></span>{{passengers.endtimeid}}</li>
                                                    <li><span><b>passengers Arrival Time: </b></span>{{passengers.passstatus}}</li>

                                                </ul>

                                            <td><a href="editpassengerinfo?getpid={{passengers.passid}}"><button id="editbuttons"
                                                                                                                 type="submit" class="btn">Edit</button></a> <a
                                                    href="removingpassengerinfo/{{passengers.passid}}"><button id="removebuttons"
                                                                                                           type="button" class="btn">Remove</button></a></td>
                                            </td>   
                                        </tr>
                                    </table>
                                </li>
                            </ul>
                        </div>
                        <!--panel2 body end--> 
                    </div>
                    <!--panel2 end -->
                </div>

                <jsp:include page="footer.jsp" />


                <!--<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>-->

                <!-- Include Date Range Picker -->
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

                <script>
                                                                $(document).ready(function () {
                                                                    var date_input = $('input[name="ticketpurdate"]'); //our date input has the name "date"
                                                                    var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                                                                    date_input.datepicker({
                                                                        format: 'yyyy/mm/dd',
                                                                        container: container,
                                                                        todayHighlight: true,
                                                                        autoclose: true,
                                                                    })
                                                                })
                </script>
                <script>
                            $(document).ready(function () {
                                var date_input = $('input[name="tickettakendate"]'); //our date input has the name "date"
                                var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                                date_input.datepicker({
                                    format: 'yyyy/mm/dd',
                                    container: container,
                                    todayHighlight: true,
                                    autoclose: true,
                                })
                            })
                </script>

                </body>
                </html>


