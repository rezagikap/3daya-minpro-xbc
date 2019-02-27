<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>

<!-- Form Mulai -->
<form id="form-create">
	<div class="box box-info">
		<div class="box-header with-border">
			<h3 class="box-title">Add Employee</h3>
		</div>
		<div class="box-body">
			<div class="row">
				<div class="col-md-3">
					<input type="text" class="form-control" name="em[firstName]"
						id="firstName" placeholder="First Name" />
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control" name="em[lastName]"
						id="lastName" placeholder="Last Name" />
				</div>

				<div class="col-md-3">
					<input type="text" class="form-control" name="em[email]" id="email"
						placeholder="Email" />
				</div>

				<div class="col-md-3">
					<select name="em[title]" id="title" class="form-control">
						<option value="Mr.">Mr.</option>
						<option value="Mrs.">Mrs.</option>
					</select>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-3">
					<button type="button" value="1" class="btn btn-primary" id="btn-assign">Assign
						Outlet</button>
				</div>
				<div class="col-md-3">
					<input type="checkbox" name="em[haveAccount]" value="true"
						id="haveAccount"> Have Account?
				</div>
			</div>
			<br>
			<div class="row" id="row-role" style="display:none;">
				<div class="col-md-3">
					<select id="roleId" name="ur[roleId]" class="form-control">
						<option value="">=Select Role=</option>
					</select>
				</div>
				<div class="col-md-3">
					<input type="text" name="ur[username]" id="username"
						class="form-control" placeholder="User Name">
				</div>
				<div class="col-md-3">
					<input type="text" name="ur[password]" id="password"
						class="form-control" placeholder="Password">
				</div>
					
				
				
				<input type="hidden" class="form-control" name="em[active]" value="true" />
				<input type="hidden" class="form-control" name="ur[active]" value="true" />
			
	
				
			</div>
		</div>
		<div class="box-footer">
			<button type="button" onClick="addData($('#form-create'))"
				class="btn btn-primary pull-left" id="btn-add"
				style="padding-right: '10px'">Save</button>
			<button type="reset" class="btn btn-primary pull-right">Cancel</button>
		</div>
		
		<div class="form-group">
	
</div>
<div class="box-body no-padding">
	<table class="table table-stripped table-bordered">
		<thead>
			<tr>
				<th>Name</th>
				
			</tr>
		</thead>
		<tbody id="list-outlet">
		</tbody>
	</table>
</div>
	</div>
</form>
<!-- Form Selesai -->

<div class="form-group">
	<h3 class="box-title col-md-8">Staff List</h3>
</div>
<div class="box-body no-padding">
	<table class="table table-stripped table-bordered">
		<thead>
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Have Account?</th>
				<th>Outlet Access</th>
				<th>Role</th>
				<th>#</th>
			</tr>
		</thead>
		<tbody id="list-staff">
		</tbody>
	</table>
</div>




<div class="modal" id="modal-form">
	<div class="modal-dialog">
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title" id="modal-title">Form Edit Employee</h3>
			</div>
			<div class="box-body" id="modal-data"></div>
		</div>
	</div>
</div>

<script>
//method yang pertama di panggil saat page di load
//method yang pertama kali dipanggil saat page di load

	$(function() {
		// memanggil method loadData;
		loadData();
		loadRole();
	});
	

	
	$("#btn-assign").click(function(){
		$.ajax({
			url:'${contextName}/employee/assignoutlet',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("Assign Outlet To Employee");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-form").modal('show');
				
				loadRole();
				loadOutlet();
			}
		});
	});
	
	
	
	// method untuk add data
	function addData($form) {
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js	
		var dataForm = $form.serializeJSON();
		var dataPo = JSON.stringify(dataForm);
		$.ajax({
			// url ke api/product/
			url : '${contextName}/api/employee/',
			type : 'post',
			// data type berupa JSON
			dataType : 'json',
			// mengirim parameter data
			data : JSON.stringify(dataForm),
			// mime type 
			contentType : 'application/json',
			success : function(result) {
				loadRole();
				loadData();
				roleS(form);
				alert('Saved');
			}
		});
		console.log(dataForm);
		//	alert('berhasil');
	}
	
	function loadOutlet() {
		$.ajax({
			// url ke api/supplier/
			url : '${contextName}/api/outlet/',
			type : 'get',
			// data type berupa JSON
			dataType : 'json',
			success : function(result) {
				$.each(result, function(index, item) {
					var datanya = '<tr>'
						+ '<td>'
						+ '<input type="checkbox" name="outletId" value="'+ item.id +'" class="form-check-input" id="outletId"> <label>'+ item.name +'</label>'
						+ '</td>'
						+ '</tr>'
					$("#tboutlet").append(datanya);
				});
			}
		});
	}
	
	function loadRole() {
		$.ajax({
			// url ke api/supplier/
			url : '${contextName}/api/role/',
			type : 'get',
			// data type berupa JSON
			dataType : 'json',
			success : function(result) {
				// empty data first
				$("#roleId").empty();
				$("#roleId").append(
						'<option value="">-Role-</option>');
				// looping data
				$.each(result, function(index, role) {
					$("#roleId").append('<option value="'+ role.id +'">'+ role.name +'</option>');
				});
			}
		});
	}
	
	function loadData() {
		$.ajax({
					// url ke api/category/
					url : '${contextName}/api/employee/',
					type : 'get',
					// data type berupa JSON
					dataType : 'json',
					success : function(result) {
						//kosong data di table
						$("#list-staff").empty();
						// looping data dengan jQuery
						$.each(result, function(index, item) {
							if (item.active){
											//	var n1 = "" + item.firstName;
											//	var n2 = "" + item.lastName;
											//	var names = "" + n1 + " " + n2;
											var dataRow = '<tr>'
													+ '<td>'
													+ item.firstName+ '</td>'
													+ '<td>'+ item.email+ '</td>'
													+ '<td>'+ item.haveAccount+ '</td>'
													+ '<td>'+ item.outletAccess+ '</td>'
													+ '<td>'+ + '</td>'
													+ '<td class="col-md-1">'
													+ '<button type="button" class="btn btn-edit btn-warning btn-sm" value="'+ item.id +'"><i class="fa fa-edit"></i></button> '
													+ '<button type="button" class="btn btn-delete btn-danger btn-sm" value="'+ item.id +'"><i class="fa fa-trash"></i></button> '
													+ '</td>' + '</tr>';
											$("#list-staff").append(dataRow);
							}
										});
						// menampilkan data ke console => F12
						console.log(result);
					}
				});
	}

	// ketidak btn-edit di click
	$('#list-staff').on('click','.btn-edit',
			function() {
				var vid = $(this).val();
				$.ajax({
					url : '${contextName}/employee/edit',
					type : 'get',
					dataType : 'html',
					success : function(result) {
						//mengisi content dengan variable result
						$("#modal-data").html(result);
						//menampilkan modal pop up
						$("#modal-form").modal('show');
						// panggil method getData
						// panggil API
						$.ajax({
							// url ke api/category/
							url : '${contextName}/api/employee/' + vid,
							type : 'get',
							// data type berupa JSON
							dataType : 'json',
							success : function(dataApi) {
								$('#modal-data').find('#id').val(dataApi.id);
								$('#modal-data').find('#firstName').val(dataApi.firstName);
								$('#modal-data').find('#lastName').val(dataApi.lastName);
								$('#modal-data').find('#email').val(dataApi.email);
								$('#modal-data').find('#title').val(dataApi.title);
								$('#modal-data').find('#haveAccount').val(dataApi.haveAccount);
							//	$('#modal-data').find('#role')
							//			.val(dataApi.role);
								loadRole($("#modal-data"));
								console.log(dataApi);
							}
						});
					}
				});
			});

	$('#haveAccount').click(function(){
		var checked_status = this.checked;
        if(checked_status == true) {
            $('#row-role').show();
        }
        else { $('#row-role').hide();
        }
    });
		//  $('#row-role').show();
		// alert('checklist');
	
	function editData($form) {
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/user/
			url : '${contextName}/api/employee/',
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
	
	$('#list-staff').on('click','.btn-delete', function(){
		var vid = $(this).val();
		$.ajax({
			url:'${contextName}/employee/delete',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("Edit Employee");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-form").modal('show');
				
			getData(vid);
			}
		});
	});
	function getData(dataId){
		// panggil API
		$.ajax({
			// url ke api/category/ harus sesuai dengan ApiController
			url:'${contextName}/api/employee/'+dataId,
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(dataApi){
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#firstName').val(dataApi.firstName);
				$('#modal-data').find('#lastName').val(dataApi.lastName);
				$('#modal-data').find('#email').val(dataApi.email);
				$('#modal-data').find('#createAccount').val(dataApi.createAccount);
				
				console.log(dataApi);
			}
		});
	}

	//method untuk delete data
	function deleteData($form){
		// memangil method getFormData dari file
		var vid = $($form).find("#id").val();
		var fname = $($form).find("#firstName").val();
		var lname = $($form).find("#lastName").val();
		var  account= $($form).find("#haveAccount").val();
		var  email= $($form).find("#email").val();
		$.ajax({
			// url ke api/category/
			url:'${contextName}/api/employee/',
			// method http di controller
			type:'put',
			// data type berupa JSON
			dataType:'json',
			// mengirim parameter data
			data: '{"id":' + vid + ',"email":"' + email + '","firstName":"' + fname + '","lastName":"' + lname + '", "haveAccount":true ,"active": false }',
			// mime type 
			contentType: 'application/json',
			success : function(result){
				//menutup modal
				$("#modal-form").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				
				loadData();
				console.log(result);
				
			}
		});
	}
	
	function assignOutlet($form) {
		var dataProduct = $form.serializeJSON();
		var data = '<tr>'
				+ '<td><input type="text" name="eo[][outletId]" value="'+ dataProduct.outletId +'" class="form-control"/></td>'
				
				+ '</tr>';

		// data table #list-outlet
		$('#list-outlet').append(data);
		// hide modal
		$("#modal-form").modal('hide');
		console.log(dataProduct);
	}
</script>