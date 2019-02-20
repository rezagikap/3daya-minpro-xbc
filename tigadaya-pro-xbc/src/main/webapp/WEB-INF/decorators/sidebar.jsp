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
					<li><a href="${contextName}/category"><i class="fa fa-circle-o"></i>Category</a></li>
					<li><a href="${contextName}/package"><i class="fa fa-circle-o"></i>Package</a></li>
					<li><a href="${contextName}/product"><i class="fa fa-circle-o"></i>Product</a></li>
					<li><a href="${contextName}/supplier"><i class="fa fa-circle-o"></i>Supplier</a></li>
					<li><a href="${contextName}/po"><i class="fa fa-circle-o"></i>Purchase Order</a></li>
				</ul>
			</li>		
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>