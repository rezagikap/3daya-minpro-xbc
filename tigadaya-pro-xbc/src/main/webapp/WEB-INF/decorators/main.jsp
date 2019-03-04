<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="${contextName}/resources/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="${contextName}/resources/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="${contextName}/resources/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextName}/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="${contextName}/resources/dist/css/skins/_all-skins.min.css">
<!-- Date Picker -->
<link rel="stylesheet" href="${contextName}/resources/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- jQuery 3 -->
<script src="${contextName}/resources/jquery/dist/jquery.min.js"></script>
<!-- ////// -->
<script src="${contextName}/resources/dist/js/jquery.serializejson.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${contextName}/resources/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script src="${contextName}/resources/dist/js/map-form-object.js"></script>
<!-- <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="${contextName}/resources/jquery/jquery.validate.js"></script>
<script src="${contextName}/resources/jquery/localization/messages_es.js"></script>
<script src="${contextName}/resources/dist/css/screen.css"></script>
<script src="${contextName}/resources/dist/css/style.css"></script> -->

<decorator:head />
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<%@include file="header.jsp"%>
		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="sidebar.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>
				Dashboard <small>Control panel</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Dashboard</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<!-- main body begin-->
						<decorator:body />
						<!-- main body end -->
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 2.4.0
		</div>
		<strong>Copyright &copy; 2014-2016 <a
			href="https://adminlte.io">Almsaeed Studio</a>.
		</strong> All rights reserved. </footer>

		<!-- Control Sidebar -->
		<%@include file="controlSidebar.jsp" %>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- ./wrapper -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.7 -->
	<script src="${contextName}/resources/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- datepicker -->
	<script	src="${contextName}/resources/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<!-- Slimscroll -->
	<script	src="${contextName}/resources/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="${contextName}/resources/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="${contextName}/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) ->
	<script src="${contextName}/resources/dist/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes ->
	<script src="${contextName}/resources/dist/js/demo.js"></script-->
</body>
</html>