<%-- 
    Document   : paymentticket
    Created on : Jan 12, 2019, 11:06:06 AM
    Author     : noman
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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
            var paymentlist = ${paymentlist};
            var traininforlist = ${traininforlist};
            var reservationlist = ${reservationlist};
            var reservationdetails = ${reservationdetails};
            var farecharlist = ${farecharlist};
            
            angular.module('showcartpageto', []).controller('Cartcontrollerp',
                    function ($scope) {
                        $scope.paymentlist = paymentlist;
                        $scope.traininforlist = traininforlist;
                        $scope.reservationlist = reservationlist;
                        $scope.reservationdetails = reservationdetails;
                        $scope.farecharlist = farecharlist;
                        
                        console.log($scope.paymentlist);
                    });
        </script>
    </head>
    <body ng-app="showcartpageto" ng-controller="Cartcontrollerp">
        <jsp:include page="header.jsp" />
        <div class="container-fluid"
             style="width: 90%; margin-top: 10px; margin-bottom: 10px">

            <div class="panel animated fadeInDown delay-05s" id="panel-1">
                <div class="panel-heading">
                    <span class="lead">Payment by cart</span>
                </div>
                <!-- end panel heading -->
                <div class="panel-body">
                    <div class="formcontainer ">

                        <form:form commandName="paymentforticketp" action="addpayment"
                                   enctype="multipart/form-data">
                            <c:if test="${check}">
                                <div class="form-group">

                                    <form:input class="form-control" Placeholder="Payment Id"
                                                type="hidden" path="paymentid" required="true"></form:input>
                                    </div>
                            </c:if>
                            <c:if test="${!check}">
                                <div class="form-group">
                                    <form:input class="form-control" Placeholder="Payment Id"
                                                type="text" path="paymentid" readonly="true" ></form:input>
                                    </div>
                            </c:if>

                            <div class="form-group">
                                <select class="form-control" ng-model="resid" ng-options=" x.resid as  x.resid  for x in reservationlist">
                                    <option value="">-- choose an option --</option>
                                </select>

                            </div>
                            <div class="form-group">
                                <form:hidden  class="form-control" value="{{resid}}" path="resid"></form:hidden>
                                </div>

                                <div class="form-group">
                                    <select class="form-control" ng-model="launchids" ng-options="x.launchid as x.launchid  for x in reservationlist" >
                                        <option value="">-- choose an option --</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                <form:hidden  class="form-control" value="{{launchids}}" path="launchid"></form:hidden>
                                </div>
                                
                              <div class="form-group">
                                    <form:input class="form-control" Placeholder="Quantity"
                                                type="text" path="qty"  ></form:input>
                                    </div>
                              <div class="form-group">
                                <select class="form-control" ng-model="selectedSup3" ng-options=" x.fareamt  for x in farecharlist">
                                    <option value="">-- choose an option --</option>
                                </select>

                            </div>
                            <div class="form-group">
                                <form:hidden  class="form-control" value="{{launchsubid}}" path="fareid"></form:hidden>
                                </div>
                                
                              <div class="form-group">
                                        <form:input class="form-control" value="{{launchsubid}}" path="fareamt"></form:input>
                                        </div>
                                
                            <c:if test="${check}">
                                <form:button id="editbuttons" type="submit" name="AddPay" class="btn">Confirm pay</form:button>
                                <form:button id="removebuttons" type="reset" class="btn">Reset
                                    Details</form:button>
                            </c:if>
                            <c:if test="${!check}">
                                <form:button id="editbuttons" type="submit" name="EditFare" class="btn">Edit
                                    Details</form:button>
                                <form:button id="removebuttons" type="reset" class="btn">Reset
                                    Details</form:button>
                            </c:if>

                        </form:form>
                    </div>
                    <!-- panel body end -->
                </div>
            </div>
            <!-- panel end -->
            <div class="panel animated fadeInUp delay-05s" id="panel-2">
                <div class="panel-heading">
                    <span class="lead">pay list</span>
                </div>
                <p><input type="text" ng-model="test" class="form-control" placeholder="Search paylist"></p>
                <!-- end panel2 heading -->
                 <div width="100%">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>payment id</th>
                                        <th>Resid</th>
                                        <th>Launch Name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Total</th>
                                        

                                    </tr>
                                </thead>

                                <tbody>
                                    <tr ng-repeat="bsc in paymentlist | filter:test">

                                        <td>{{bsc.paymentid}}</td>
                                       
                                        <td>{{bsc.resid}}</td>
                                        <td>{{bsc.trainid}}</td>
                                        <td>{{bsc.qty}}</td>
                                        <td>{{bsc.fareamt}}</td>
                                        <td>{{bsc.total}}</td>
                                        
                                        <td><a href="editnetsalarypage?getpid={{bsc.netsalaryid}}"><button id="editbuttons" type="submit" class="btn btn-warning">Edit</button></a> 
                                            <a href="removingnetsalary/{{bsc.netsalaryid}}"><button id="removebuttons" type="button" class="btn btn-danger">Remove</button></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                <!-- panel2 body end -->
            </div>
            <!-- panel2 end -->
        </div>

        <jsp:include page="footer.jsp" />


    </body>
</html>