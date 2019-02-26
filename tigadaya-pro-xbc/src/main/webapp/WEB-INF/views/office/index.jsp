<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">USER</h3>
	</div>
	
	<div class="box-header col-md-12">
			<input type="text" name="search" id="search"
				placeholder="Search by officename/email" />
			<button class="margin col-md-0.5 btn btn-warning btn-xm"
				onClick="search()">
				<i class="fa fa-circle-o"></i>
			</button>
			<div class="box-tools col-md-1">
				<button type="button" id="btn-add"
					class="margin col-md-0.5 btn btn-warning btn-m">
					<i class="fa fa-plus"></i>
				</button>
			</div>
		</div>
		
	<div class="box-body">
		<table class="table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Contact</th>
					<th class="col-md-1">#</th>
				</tr>
			</thead>
			<tbody id="list-data">
			</tbody>
		</table>
	</div>
</div>

<div class="modal" id="modal-form">
	<div class="modal-dialog">
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title" id="modal-title">ADD OFFICE</h3>
			</div>
			<div class="box-body" id="modal-data"></div>
		</div>
	</div>
</div>

<script>
	// method yang pertama dipanggil saat page diload
	$(function() {
		// memanggil method load data
		loadData();
	});
	//ketika button add di Click
	$("#btn-add").click(
			function() {
				var d = new Date($.now());
				$.ajax({
					url : '${contextName}/office/create',
					type : 'get',
					dataType : 'html',
					success : function(result) {
						// mengganti judul modal
						$("#modal-title").html("ADD DATA");
						// mengisi content dengan variable result
						$("#modal-data").html(result);
						// menampilkan modal pop up
						$("#modal-form").modal('show');
						$('#createdOn').val(
								d.getDate() + "-" + d.getMonth() + "-"
										+ d.getFullYear() + " " + d.getHours()
										+ ":" + d.getMinutes() + ":"
										+ d.getSeconds());
					}
				});
			});
	//method loadData
	function loadData() {
		$
				.ajax({
					// url ke api/role/
					url : '${contextName}/api/office/',
					type : 'get',
					// data type berupa JSON
					dataType : 'json',
					success : function(result) {
						//kosong data di table
						$("#list-data").empty();
						// looping data dengan jQuery
						$
								.each(
										result,
										function(index, item) {
											var dataRow = '<tr>'
													+ '<td>'+ item.name + '</td>'
													+ '<td>'+ item.phone +' / '+ item.email + '</td>'
													+ '<td class="col-md-1">'
													+ '<div class="dropdown">'
													+ '<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'
													+ '<ul class="dropdown-menu">'
													+ '<li id="btn-edit" value="'+ item.id +'"><a>Edit</a></li> '
													+ '<li id="btn-delete" value="'+ item.id +'"><a>Delete</a></li> '
													+ '</ul>' + '</div>'
													+ '</td>' + '</tr>';
											$("#list-data").append(dataRow);
										});
						// menampilkan data ke console => F12
						console.log(result);
					}
				});
	}
	// method untuk add data
	function addData($form) {
		// memanggil method getFormdata dari file
		// resources/dist/js/map-form-object.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/office/
			url : '${contextName}/api/office/',
			type : 'post',
			dataType : 'json',
			data : JSON.stringify(dataForm),
			contentType : 'application/json',
			success : function(result) {
				$("#modal-form").modal('hide');
				loadData();
			}
		});
		console.log(dataForm);
	}
	function getData(dataId) {
		$.ajax({
			url : '${contextName}/api/office/' + dataId,
			type : 'get',
			dataType : 'json',
			success : function(dataApi) {
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#name').val(dataApi.officename);
				$('#modal-data').find('#phone').val(dataApi.password);
				$('#modal-data').find('#email').val(dataApi.email);
				$('#modal-data').find('#address').val(dataApi.roleId);
				$('#modal-data').find('#notes').val(dataApi.mobileFlag);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				$('#modal-data').find('#modifiedBy').val(dataApi.modifiedBy);
				$('#modal-data').find('#modifiedOn').val(dataApi.modifiedOn);
				$('#modal-data').find('#deletedBy').val(dataApi.deletedBy);
				$('#modal-data').find('#deletedOn').val(dataApi.deletedOn);
				$('#modal-data').find('#isDelete').val(dataApi.isDelete);
				console.log(dataApi);
			}
		});
	}
	// ketika btn-edit di click
	$('#list-data').on(
			'click',
			'#btn-edit',
			function() {
				var vid = $(this).val();
				$.ajax({
					url : '${contextName}/office/edit',
					type : 'get',
					dataType : 'html',
					success : function(result) {
						//mengganti judul modal
						$("#modal-title").html("EDIT DATA");
						//mengisi content dengan variable result
						$("#modal-data").html(result);
						//menampilkan modal pop up
						$("#modal-form").modal('show');
						//panggil Role
						loadRole($("#modal-data"));
						// panggil method getData
						getData(vid);
					}
				});
			});
	// method untuk edit data
	function editData($form) {
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/office/
			url : '${contextName}/api/office/',
			type : 'put',
			// data type berupa JSON
			dataType : 'json',
			// mengirim parameter data
			data : JSON.stringify(dataForm),
			// mime type 
			contentType : 'application/json',
			success : function(result) {
				//menutup modal
				$("#modal-form").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
			}
		});
		console.log(dataForm);
	}
	//btn-delete di click
	$('#list-data').on('click', '#btn-delete', function() {
		var vid = $(this).val();
		$.ajax({
			url : '${contextName}/office/delete',
			type : 'get',
			dataType : 'html',
			success : function(result) {
				//mengganti judul modal
				$("#modal-title").html("DELETE");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-form").modal('show');
				//panggil method
				getData(vid);
			}
		});
	});
	// method untuk delete data
	function deleteData($form) {
		// memangil method getFormData dari file
		var vid = $form.find("#id").val();
		$.ajax({
			// url ke api/trainer/
			url : '${contextName}/api/office/' + vid,
			// method http di controller
			type : 'delete',
			// data type berupa JSON
			dataType : 'json',
			// jika sukses
			success : function(result) {
				//menutup modal
				$("#modal-form").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
				console.log(result);
			}
		});
	}
	
	function search(){
		var item = $('#search').val();
		$.ajax({
			url: '${contextName}/api/office/search/' + item,
			type: 'get',
			dataType: 'json',
			success: function(result){
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
					var dataRow = '<tr>'
						+ '<td>'
						+ item.name
						+ '</td>'
						+ '<td>'
						+ item.email
						+ '</td>'
						+ '<td class="col-md-1">'
						+ '<div class="dropdown">'
						+ '<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'
						+ '<ul class="dropdown-menu">'
						+ '<li id="btn-edit" value="'+ item.id +'"><a>Edit</a></li> '
						+ '<li id="btn-delete" value="'+ item.id +'"><a>Delete</a></li> '
						+ '</ul>' + '</div>'
						+ '</td>' + '</tr>';
					$("#list-data").append(dataRow);
				});
				console.log(result);
			}
		});
	}
	
</script>