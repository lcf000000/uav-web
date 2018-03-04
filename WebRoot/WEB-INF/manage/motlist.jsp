<%@ page language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>UAV Dataset Manage System</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=path%>/css/bootstrap/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=path%>/css/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="<%=path%>/css/datatables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="<%=path%>/css/datatables/select.dataTables.min.css" rel="stylesheet">
    
    <!-- DataTables Responsive CSS -->
    <link href="<%=path%>/css/datatables/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=path%>/css/manager/sb-admin-2.css" rel="stylesheet">
    
    <!-- JQuery CSS -->
    <link href="<%=path%>/css/jquery/toastr.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=path%>/css/font-awesome/font-awesome.min.css" rel="stylesheet" type="text/css">

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
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">UAV Management</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    	<spane>${manager.username}</span>
                        <i class="fa fa-user fa-fw"></i>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li class="divider"></li>
                        <li><a href="#" onclick="loginOut()"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dashboard fa-fw"></i> Welcome</a>
                        </li>
                        <li>
                            <a href="<%=path%>/manage/userlist"><i class="fa fa-table fa-fw"></i> Users</a>
                        </li>
                        <li>
                            <a href="<%=path%>/manage/infolist"><i class="fa fa-edit fa-fw"></i> Announcement</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Results<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<%=path%>/manage/detlist">Detection</a>
                                </li>
                                <li>
                                    <a href="<%=path%>/manage/sotlist">Single-tracking</a>
                                </li>
                                <li>
                                    <a href="<%=path%>/manage/motlist">Multi-tracking</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">MOT Results Manage</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default" id="search-panel">
                        <div class="panel-heading">
                            <h4>Search</h4>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" id="search-input">
							<form class="form-inline well">
								<div class="row">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span>User name:</span>
									<input type="text" class="form-control" placeholder="User name" id="username-search">
									&nbsp;&nbsp;
									<span>Tracker name:</span>
									<input type="text" class="form-control" placeholder="Tracker name" id="trackername-search">
	                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                <button type="button" class="btn" id="btn-advanced-search" onclick="search()"><i class="fa fa-search"></i> Search</button>
	                                <button type="button" class="btn" id="btn-advanced-search" onclick="removeSearchVal()"><i class="fa fa-times"></i> Remove Search Rules</button>
	                            </div>
							</form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>User List</h4>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover table-condensed" id="dataTables-user">
                            <button type="button" class="btn btn-info pull-right" onclick="editUser()"><i class="fa fa-pencil"></i> Edit</button>
                            <button type="button" class="btn btn-danger pull-right" onclick="removeUser()"><i class="fa fa-times"></i> Remove</button>
                            <button type="button" class="btn btn-success pull-right" onclick="addUser()"><i class="fa fa-plus"></i> Add</button>
                                <thead> 
									<tr>
										<th>ID</th>
										<th>Tracker Name</th>
	                                    <th>ARC</th>
	                                    <th>BC</th>
	                                    <th>CM</th>
	                                    <th>FM</th>
	                                    <th>FOC</th>
	                                    <th>IV</th>
	                                    <th>LR</th>
	                                    <th>OV</th>
	                                    <th>POC</th>
	                                    <th>SOB</th>
	                                    <th>SV</th>
	                                    <th>VC</th>
	                                    <th>User Name</th>
	                                    <th>Date</th>
	                                    <th>Code</th>
	                                    <th>Environment</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
								<tfoot>
									<tr>
										<th>ID</th>
										<th>Tracker Name</th>
	                                    <th>ARC</th>
	                                    <th>BC</th>
	                                    <th>CM</th>
	                                    <th>FM</th>
	                                    <th>FOC</th>
	                                    <th>IV</th>
	                                    <th>LR</th>
	                                    <th>OV</th>
	                                    <th>POC</th>
	                                    <th>SOB</th>
	                                    <th>SV</th>
	                                    <th>VC</th>
	                                    <th>User Name</th>
	                                    <th>Date</th>
	                                    <th>Code</th>
	                                    <th>Environment</th>
									</tr>
								</tfoot>
                            </table>
                            <!-- /.table-responsive -->
                            <div class="well">
                                <h4>DataTables Usage Information</h4>
                                <p>DataTables is a very flexible, advanced tables plugin for jQuery. In SB Admin, we are using a specialized version of DataTables built for Bootstrap 3. We have also customized the table headings to use Font Awesome icons in place of images. For complete documentation on DataTables, visit their website at <a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.</p>
                                <a class="btn btn-default btn-lg btn-block" target="_blank" href="https://datatables.net/">View DataTables Documentation</a>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    
	<script type="text/javascript">ctx="${pageContext.request.contextPath}";</script>
    <!-- jQuery -->
    <script src="<%=path%>/js/jquery/jquery.min.js"></script>
    <script src="<%=path%>/js/jquery/toastr.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=path%>/js/bootstrap/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=path%>/js/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="<%=path%>/js/datatables/jquery.dataTables.min.js"></script>
    <script src="<%=path%>/js/datatables/dataTables.bootstrap.min.js"></script>
    <script src="<%=path%>/js/datatables/dataTables.responsive.js"></script>
    <script src="<%=path%>/js/datatables/fnReloadAjax.js"></script>
    <script src="<%=path%>/js/datatables/dataTables.select.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=path%>/js/manager/sb-admin-2.js"></script>
    <script src="<%=path%>/js/manager/global.js"></script>
	<script src="<%=path%>/js/manager/sotlist.js"></script>
</body>
</html>
