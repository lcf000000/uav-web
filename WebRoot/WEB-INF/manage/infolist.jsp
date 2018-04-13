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
    <link href="<%=path%>/css/metisMenu/metisMenu.css" rel="stylesheet">

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
    
    <!-- WangEditor3 CSS -->
    <link href="<%=path%>/css/manager/wangEditor-fullscreen-plugin.css" rel="stylesheet">
    <link href="<%=path%>/css/views/table.css" rel="stylesheet">

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
                                    <a href="<%=path%>/manage/detlist">Image Detection</a>
                                </li>
                                <li>
                                    <a href="<%=path%>/manage/vdetlist">Video Detection</a>
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
                    <h1 class="page-header">Info Manage</h1>
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
                        <div class="panel-body" id = "search-input">
							<form class="form-inline well" id = "search-form">
								<div class="row">
									<span>Title:</span>
									<input type="text" class="form-control" placeholder="Title..." id="title-search">
									&nbsp;&nbsp;
									<span>Author:</span>
									<input type="text" class="form-control" placeholder="Author..." id="author-search">
									&nbsp;&nbsp;
									<span>&nbsp;Date:&nbsp;</span>
									<input type="text" class="form-control" placeholder="2018-1-1" id="date-search">
									&nbsp;&nbsp;
									<span>Information comment:</span>
									<input type="text" class="form-control" placeholder="Information comment..." id="comment-search">
								</div>
								<div class="row">
								&nbsp;
								</div>
								<div class="row">
									<span>&nbsp;Content&nbsp;&nbsp;:&nbsp;&nbsp;</span>
									<input type="text" class="form-control" placeholder="Content..." id="content-search">
									&nbsp;&nbsp;
									<span>Location&nbsp;:&nbsp;</span>
									<select id="loc-search" name="location" class="selectpicker show-tick form-control">
	                                        <option value="1">Index welcome</option>
	                                        <option value="2">BM-Idet</option>
	                                        <option value="3">BM-Vdet</option>
	                                        <option value="4">BM-Sot</option>
	                                        <option value="5">BM-Mot</option>
	                                        <option value="6">Results Format</option>
	                                        <option value="7">Test Guidelines</option>
	                                        <option value="8">Upload Results</option>
	                                        <option value="9">Eva-Idet</option>
	                                        <option value="10">Eva-Vdet</option>
	                                        <option value="11">Eva-Sot</option>
	                                        <option value="12">Eva-Mot</option>
	                                        <option value="13">LB-Idet</option>
	                                        <option value="14">LB-Vdet</option>
	                                        <option value="15">LB-Sot</option>
	                                        <option value="16">LB-Mot</option>
	                                        <option value="17">FAQ</option>
	                                        <option value="999">other</option>
	                                </select>
	                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                <button type="button" class="btn" onclick="search()"><i class="fa fa-search"></i> Search</button>
	                            	<button type="button" class="btn" onclick="removeSearchVal()"><i class="fa fa-times"></i> Remove Search Rules</button>
	                            </div>
							</form>
                        </div>
                    </div>
                    <div class="panel panel-default" id="edit-panel">
                        <div class="panel-heading">
                            <h4>Edit</h4>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<form class="form-inline well" id="editInfo-form">
								<div class="row">
									<input type="hidden" name="id" id="id-edit">
									<span>Title:</span>
									<input type="text" class="form-control" placeholder="Title..." id="title-edit" name="title">
									&nbsp;&nbsp;
									<span>Author:</span>
									<input type="text" class="form-control" placeholder="Author..." id="author-edit" name="author" readonly="readonly" value="${manager.username}">
									&nbsp;&nbsp;
									<span>Information comment:</span>
									<input type="text" class="form-control" placeholder="Information comment..." id="comment-edit" name="comment">
									&nbsp;&nbsp;
									<span style="color:#F00">*Location&nbsp;:&nbsp;</span>
									<select id="loc-edit" name="location" class="selectpicker show-tick form-control">
	                                        <option value="1">Index welcome</option>
	                                        <option value="2">BM-Idet</option>
	                                        <option value="3">BM-Vdet</option>
	                                        <option value="4">BM-Sot</option>
	                                        <option value="5">BM-Mot</option>
	                                        <option value="6">Results Format</option>
	                                        <option value="7">Test Guidelines</option>
	                                        <option value="8">Upload Results</option>
	                                        <option value="9">Eva-Idet</option>
	                                        <option value="10">Eva-Vdet</option>
	                                        <option value="11">Eva-Sot</option>
	                                        <option value="12">Eva-Mot</option>
	                                        <option value="13">LB-Idet</option>
	                                        <option value="14">LB-Vdet</option>
	                                        <option value="15">LB-Sot</option>
	                                        <option value="16">LB-Mot</option>
	                                        <option value="17">FAQ</option>
	                                        <option value="999">other</option>
	                                </select>
	                                <span style="color:#F00">*Confirm selection ！</span>
								</div>
							</form>
	                        <div id="editor" style="text-align:justify;line-height:20px;">
						    </div>
						    &nbsp;
						    <div class="row">
							    <button type="button" class="btn"  onclick="saveEdit()" style="margin-left:30px"><i class="fa fa-save"></i> Save Edit</button>   
		                        <button type="button" class="btn"  onclick="cancelEdit()" style="margin-left:30px"><i class="fa fa-share-square-o"></i> Cancel Edit</button>
						    </div>  
                       	</div>
                    </div>
                    <div class="panel panel-default" id="add-panel">
                        <div class="panel-heading">
                            <h4>Add</h4>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
	                        <form class="form-inline well" id="addInfo-form">
								<div class="row">
									<span>Title:</span>
									<input type="text" class="form-control" placeholder="Title..." id="title-add" name="title">
									&nbsp;&nbsp;
									<span>Author:</span>
									<input type="text" class="form-control" placeholder="Author..." id="author-add" name="author" readonly="readonly" value="${manager.username}">
									&nbsp;&nbsp;
									<span>Information comment:</span>
									<input type="text" class="form-control" placeholder="Information comment..." id="comment-add" name="comment">
									&nbsp;:&nbsp;
									<span style="color:#F00">Location&nbsp;:&nbsp;</span>
									<select id="loc-add" name="location" class="selectpicker show-tick form-control">
	                                        <option value="1">Index welcome</option>
	                                        <option value="2">BM-Idet</option>
	                                        <option value="3">BM-Vdet</option>
	                                        <option value="4">BM-Sot</option>
	                                        <option value="5">BM-Mot</option>
	                                        <option value="6">Results Format</option>
	                                        <option value="7">Test Guidelines</option>
	                                        <option value="8">Upload Results</option>
	                                        <option value="9">Eva-Idet</option>
	                                        <option value="10">Eva-Vdet</option>
	                                        <option value="11">Eva-Sot</option>
	                                        <option value="12">Eva-Mot</option>
	                                        <option value="13">LB-Idet</option>
	                                        <option value="14">LB-Vdet</option>
	                                        <option value="15">LB-Sot</option>
	                                        <option value="16">LB-Mot</option>
	                                        <option value="17">FAQ</option>
	                                        <option value="999">other</option>
	                                </select>
	                                <span style="color:#F00">*Confirm selection ！</span>
								</div>
							</form>
                        	<div id="adder" style="text-align:justify;line-height:20px;">
						    </div>
						   	&nbsp;
						    <div class="row">
		                        <button type="button" class="btn"  onclick="submitAdd()" style="margin-left:30px" id="addInfo-btn"><i class="fa fa-save"></i> Submit</button>   
		                        <button type="button" class="btn"  onclick="cancelAdd()" style="margin-left:30px"><i class="fa fa-share-square-o"></i> Cancel</button>
	                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>Info List</h4>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover table-condensed" id="dataTables-info">
                            <button type="button" class="btn btn-info pull-right" onclick="editInfo()"><i class="fa fa-pencil"></i> Edit</button>
                            <button type="button" class="btn btn-danger pull-right" onclick="removeInfo()"><i class="fa fa-times"></i> Remove</button>
                            <button type="button" class="btn btn-success pull-right" onclick="addInfo()"><i class="fa fa-plus"></i> Add</button>
                                <thead>
									<tr>
										<th>ID</th>
	                                    <th>Title</th>
	                                    <th>Author</th>
	                                    <th>Location</th>
	                                    <th>Time</th>
	                                    <th>Comment</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
								<tfoot>
									<tr>
										<th>ID</th>
	                                    <th>Title</th>
	                                    <th>Author</th>
	                                    <th>Location</th>
	                                    <th>Time</th>
	                                    <th>Comment</th>
									</tr>
								</tfoot>
                            </table>
                            <!-- /.table-responsive -->
                            <div class="well">
                                <h4>DataTables Usage Information</h4>
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
    <script src="<%=path%>/js/manager/wangEditor.min.js"></script>
    <script src="<%=path%>/js/manager/wangEditor-fullscreen-plugin.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=path%>/js/manager/sb-admin-2.js"></script>
    <script src="<%=path%>/js/manager/global.js"></script>
    <script src="<%=path%>/js/manager/infolist.js"></script>
</body>

</html>
