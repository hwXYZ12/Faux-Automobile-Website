<%-- 
    Document   : AllAds
    Created on : Oct 28, 2014, 11:27:08 PM
    Author     : Kevin
--%>

<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Console Cowboys in CyberSpace Manager</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="">Console Cowboys in CyberSpace Manager</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%out.print(session.getAttribute("login")); %> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="logout.jsp"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="AddEmployee.jsp"><i class="fa fa-fw fa-user-plus"></i> Employee Tasks</a>
                    </li>
                    <li>
                        <a href="SalesReport.jsp"><i class="fa fa-fw fa-print"></i> Reports</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Top Seller
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <a href="AddEmployee.jsp"><i class="fa fa-fw fa-user-plus"></i> Add Employee</a>
                            </li>
                            <li>
                                <a href="EditEmployee.jsp"><i class="fa fa-fw fa-wrench"></i> Edit Employee</a>
                            </li>
                            <li>
                                <a href="RemoveEmployee.jsp"><i class="fa fa-fw fa-ban"></i> Remove Employee</a>
                            </li>
                            <li>
                                <a href="TopSeller.jsp"><i class="fa fa-fw fa-fighter-jet"></i> Top Seller</a>
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                
                <div class="row">
                   
                </div>
                
                 <div class="row">
                    <div class="col-lg-6">
                        <h2>Top Seller</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th> Last Name </th>
                                        <th> First Name </th>
                                        <th> Employee ID </th>
                                        <th> Total Revenue </th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                String Query = 
                                    "SELECT    LastName AS 'Last Name', " +
                                    "FirstName AS 'First Name', " +
                                    "EmployeeID, " +
                                    "MAX(TotalRevenue) AS 'Total Revenue' " +
                                    "FROM     ((SELECT    EmployeeID, " +
                                        "FirstName, " +
                                        "LastName, " +
                                        "SUM(UnitPrice * NumUnits) AS 'TotalRevenue' " +
                                        "FROM     Employee NATURAL JOIN Advertisement " +
                                        "NATURAL JOIN Sale " +
                                        "GROUP BY    EmployeeID) AS X)";
                                java.sql.ResultSet rs =DBConnection.ExecQuery(Query);
                                while(rs.next())
                                {
                               %>
                                  <tr>
                                      <td > <% out.print(rs.getString(1)); %> </td>
                                      <td > <% out.print(rs.getString(2)); %> </td>
                                      <td > <% out.print(rs.getString(3)); %> </td>
                                      <td > <% out.print(rs.getString(4)); %> </td>
                                     </tr>
                                   <%      		
                                 }
                                  %>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                                  
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
