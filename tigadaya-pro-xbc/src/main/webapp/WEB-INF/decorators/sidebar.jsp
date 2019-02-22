<%	request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${contextName}/resources/dist/img/user2-160x160.jpg"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>Alexander Pierce</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<!-- search form -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..."> <span class="input-group-btn">
					<button type="submit" name="search" id="search-btn"
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">MAIN NAVIGATION</li>
			<li class="active treeview">
				<a href="#">
					<i class="fa fa-dashboard"></i> 
					<span>Master Data</span> 
					<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span>
				</a>
				<ul class="treeview-menu">
					<li><a href="${contextName}/user"><i class="fa fa-circle-o"></i>User</a></li>
					<li><a href="${contextName}/role"><i class="fa fa-circle-o"></i>Role</a></li>
					<li><a href="${contextName}/menu"><i class="fa fa-circle-o"></i>Menu</a></li>
					<li><a href="${contextName}/test"><i class="fa fa-circle-o"></i>Test</a></li>
					<li><a href="${contextName}/list"><i class="fa fa-circle-o"></i>List</a></li>
					<li><a href="${contextName}/question"><i class="fa fa-circle-o"></i>Question</a></li>
					<li><a href="${contextName}/testtype"><i class="fa fa-circle-o"></i>Test Type</a></li>
					<li><a href="${contextName}/biodata"><i class="fa fa-circle-o"></i>Biodata</a></li>
					<li><a href="${contextName}/trainer"><i class="fa fa-circle-o"></i>Trainer</a></li>
					<li><a href="${contextName}/technology"><i class="fa fa-circle-o"></i>Technology</a></li>
					<li><a href="${contextName}/bootcamptesttype"><i class="fa fa-circle-o"></i>Bootcamp Test Type</a></li>
					<li><a href="${contextName}/bootcampType"><i class="fa fa-circle-o"></i>Bootcamp Type</a></li>
					<li><a href="${contextName}/class"><i class="fa fa-circle-o"></i>Class</a></li>
					<li><a href="${contextName}/office"><i class="fa fa-circle-o"></i>Office</a></li>
					<li><a href="${contextName}/category"><i class="fa fa-circle-o"></i>Category</a></li>
				</ul>
			</li>		
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>