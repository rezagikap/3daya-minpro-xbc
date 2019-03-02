<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">Idle Monitoring</h3>
	</div>
		
	<div class="box-body">
	<div class="row">
		<div class="col-md-11">
			<div class="input-group col-md-5">
				<input type="text" name="search" id="search" class="form-control"
					placeholder="Search by name " /> <span class="input-group-btn">
					<button class="btn btn-warning btn-xm "
						onClick="search()">
						<i class="fa fa-circle-o"></i>
					</button>
				</span>
			</div>
		</div>
		<div class="box-tools">
			<button type="button" id="btn-add"
				class="btn btn-warning btn-xm">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	<br>
		<table class="table">
			<thead>
				<tr>
					<th>NAME</th>
					<th>IDLE DATE</th>
					<th>PLACEMENT DATE</th>
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
				<h3 class="box-title" id="modal-title">ADD DATA</h3>
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
					url : '${contextName}/idlemonitoring/create',
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
								d.getDate() + "-" + (d.getMonth()+1) + "-"
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
					url : '${contextName}/api/idlemonitoring/',
					type : 'get',
					// data type berupa JSON
					dataType : 'json',
					success : function(result) {
						//kosong data di table
						$("#list-data").empty();
						// looping data dengan jQuery
						$.each(result,function(index, item) {
											if(item.isDelete==false){
												var dataRow = '<tr>'
													+ '<td>'
													+ item.name
													+ '</td>'
													+ '<td>'
													+ item.idleDate
													+ '</td>'
													+ '<td>'
													+ item.placementDate
													+ '</td>'
													+ '<td class="col-md-1">'
													+ '<div class="dropdown">'
													+ '<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'
													+ '<ul class="dropdown-menu">'
													+ '<li id="btn-edit" value="'+ item.id +'"><a>Edit</a></li> '
													+ '<li id="btn-placement" value="'+ item.id +'"><a>Placement</a></li> '
													+ '<li id="btn-delete" value="'+ item.id +'"><a>Delete</a></li> '
													+ '</ul>' + '</div>'
													+ '</td>' + '</tr>';
											$("#list-data").append(dataRow);	
											}
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
			// url ke api/idlemonitoring/
			url : '${contextName}/api/idlemonitoring/',
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
	function getDataEdit(dataId) {
		var d = new Date($.now());
		$.ajax({
			url : '${contextName}/api/idlemonitoring/' + dataId,
			type : 'get',
			dataType : 'json',
			success : function(dataApi) {
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#testId').val(dataApi.testId);
				$('#modal-data').find('#idleDate').val(dataApi.idleDate);
				$('#modal-data').find('#lastProject').val(dataApi.lastProject);
				$('#modal-data').find('#idleReason').val(dataApi.idleReason);
				$('#modal-data').find('#placementDate').val(dataApi.placementDate);
				$('#modal-data').find('#placementAt').val(dataApi.placementAt);
				$('#modal-data').find('#notes').val(dataApi.notes);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				$('#modal-data').find('#modifiedBy').val(dataApi.modifiedBy);
				$('#modal-data').find('#modifiedOn').val(dataApi.modifiedOn);
				$('#modal-data').find('#deletedBy').val(dataApi.deletedBy);
				$('#modal-data').find('#deletedOn').val(dataApi.deletedOn);
				$('#modal-data').find('#isDelete').val(dataApi.isDelete);
				$('#modifiedOn').val(
						d.getDate() + "-" + (d.getMonth()+1) + "-"
								+ d.getFullYear() + " " + d.getHours()
								+ ":" + d.getMinutes() + ":"
								+ d.getSeconds());
				
				
			}
		});
	}
	
	function getDataDelete(dataId) {
		var d = new Date($.now());
		$.ajax({
			url : '${contextName}/api/idlemonitoring/' + dataId,
			type : 'get',
			dataType : 'json',
			success : function(dataApi) {
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#testId').val(dataApi.testId);
				$('#modal-data').find('#idleDate').val(dataApi.idleDate);
				$('#modal-data').find('#lastProject').val(dataApi.lastProject);
				$('#modal-data').find('#idleReason').val(dataApi.idleReason);
				$('#modal-data').find('#placementDate').val(dataApi.placementDate);
				$('#modal-data').find('#placementAt').val(dataApi.placementAt);
				$('#modal-data').find('#notes').val(dataApi.notes);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				$('#modal-data').find('#modifiedBy').val(dataApi.modifiedBy);
				$('#modal-data').find('#modifiedOn').val(dataApi.modifiedOn);
				$('#modal-data').find('#deletedBy').val(dataApi.deletedBy);
				$('#modal-data').find('#deletedOn').val(dataApi.deletedOn);
				$('#modal-data').find('#isDelete').val(dataApi.isDelete);
		
				$('#deletedOn').val(
						d.getDate() + "-" + (d.getMonth()+1) + "-"
								+ d.getFullYear() + " " + d.getHours()
								+ ":" + d.getMinutes() + ":"
								+ d.getSeconds());
			}
		});
	}
	// ketidak btn-edit di click
	$('#list-data').on('click', '#btn-edit', function() {
				var vid = $(this).val();
				$.ajax({
					url : '${contextName}/idlemonitoring/edit',
					type : 'get',
					dataType : 'html',
					success : function(result) {
						//mengganti judul modal
						$("#modal-title").html("EDIT DATA");
						//mengisi content dengan variable result
						$("#modal-data").html(result);
						//menampilkan modal pop up
						$("#modal-form").modal('show');
						
						// panggil method getData
						getDataEdit(vid);
						
					}
				});
				
				console.log(dataApi);
			});
	// method untuk edit data
	function editData($form) {
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/idlemonitoring/
			
			url : '${contextName}/api/idlemonitoring/',
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
			url : '${contextName}/idlemonitoring/delete',
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
			var biodata_id=$form.find('#testId').val();
			var idle_date=$form.find('#idleDate').val();
			var last_project=$form.find('#lastProject').val();
			var idle_reason=$form.find('#idleReason').val();
			var placement_date=$form.find('#placementDate').val();
			var placement_at=$form.find('#placementAt').val();
			var notes=$form.find('#notes').val();
			var create_by=$form.find('#createdBy').val();
			var create_on=$form.find('#createdOn').val();
			var modified_by=$form.find('#modifiedBy').val();
			var modified_on=$form.find('#modifiedOn').val();
			var deleted_by=$form.find('#deletedBy').val();
			var deleted_on=$form.find('#deletedOn').val();
			//var is_delete=$form.find('#isDelete').val();
			$.ajax({
				// url ke api/idlemonitoring/
				url : '${contextName}/api/idlemonitoring/delete/',
				// method http di controller
				type : 'put',
				dataType : 'json',
				// data type berupa JSON
				data: '{"id":' + vid + ',"idlemonitoringname":"' + idlemonitoringname + '","password":"' + password + '","email":"' + email + '","roleId":"' + role_id + '","mobileFlag":"' + mobile_flag + '","mobileToken":"' + mobile_token + '","createdBy":"' + create_by + '","createdOn":"' + create_on + '","modifiedBy":"' + modified_by + '","modifiedOn":"' + modified_on + '","deletedBy":"' + deleted_by + '","deletedOn":"' + deleted_on + '","isDelete": true }',
				contentType:'application/json',
				// jika sukses
				success : function(result) {
					//menutup modal
					$("#modal-form").modal('hide');
					// panggil method load data, untuk melihat data terbaru
					loadData();
					console.log(dataForm);
				}
			});	
		}
	
	function search(){
		var item = $('#search').val();
		$.ajax({
			url: '${contextName}/api/idlemonitoring/search/' + item,
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
						+ '<td class="col-md-1">'
						+ '<div class="dropdown">'
						+ '<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'
						+ '<ul class="dropdown-menu">'
						+ '<li id="btn-edit" value="'+ item.id +'"><a>Edit</a></li> '
						+ '<li id="btn-reset" value="'+ item.id +'"><a> Placement </a></li> '
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