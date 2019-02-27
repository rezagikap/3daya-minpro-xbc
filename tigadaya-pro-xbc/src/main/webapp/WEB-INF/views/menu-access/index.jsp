
<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<div class="box box-info box-warning">
	<div class="box-header bg-warning">
		<h3 class="box-title">
			<b>MENU ACCESS</b>
		</h3>
	</div>
	<div class="box-body">
		<form id="form-create" class="form-horizontal">
			<div class="row">
			
				<div class="col-md-6">
					<div class="form-group">
						<div class="col-md-12">
							<label class="control-label">ROLE</label>
							<select name="roleId" class="form-control" id="roleId">
								<option value="">-Choose Role-</option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="col-md-6">
					<div class="form-group">
						<div class="col-md-12">
							<label class="control-label">MENU</label>
							<select name="menuId" class="form-control" id="menuId">
								<option value="">-Choose Menu-</option>
							</select>
						</div>
					</div>
					
					<input type="hidden" class="form-control" name="createdBy" value="1" />
					<input type="hidden" class="form-control" name="createdOn" id="createdOn" />
					
					<div class="text-right">
					<button type="button" id="btn-cancel" class="btn btn-warning">Cancel</button>
					<button type="button" class="btn btn-warning" onClick="addData($('#form-create'))">	Save</button>
					</div>
					
				</div>
			</div>
			
		</form>
		<hr>

		<table class="table">
			<thead>
				<tr>
					<th>ROLE</th>
					<th>MENU</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody id="list-data">
			</tbody>
		</table>
		
	</div>
</div>

<div class="modal" id="modal-form">
	<div class="modal-dialog modal-md">
		<div class="box box-warning">
			<div class="box-header with-border bg-warning">
				<h3 class="box-title" id="modal-title">Form Input</h3>
			</div>
			<div class="box-body" id="modal-data"></div>
		</div>
	</div>
</div>
	
	<input type="hidden" class="form-control" name="id"id="id" value="1" />
	<input type="hidden" class="form-control" name="createdBy" value="1" />
	<input type="hidden" class="form-control" name="createdOn"id="createdOn" />

<script>
	//method yang pertama kali dipanggil saat page di load
	$(function() {
		// memanggil method loadData;
		loadData();
	});
	
	$('#btn-cancel').click(function() {
		// memanggil method loadData;
		loadData();
	});

	//ketika button add di click
	$('#btn-add').click(function() {
		$.ajax({
			url : '$(contextName)/menu-access/create',
			type : 'get',
			dataType : 'html',
			success : function(result) {
				//mengganti judul modal
				$("#modal-title").html("Add Menu Access");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-form").modal('show');
			}
		});
	});
	
	// function get data 
	function getData(dataId){
		// panggil API
		$.ajax({
			// url ke api/role/
			url:'${contextName}/api/menu-access/'+dataId,
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(dataApi){
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#menuId').val(dataApi.menuId);
				$('#modal-data').find('#roleId').val(dataApi.roleId);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				console.log(dataApi);
			}
		});
	}

	//method loadData
	function loadData() {
		var d = new Date($.now());
		$.ajax({
					// url ke api/package/
					url : '${contextName}/api/menu-access/',
					type : 'get',
					// data type berupa JSON
					dataType : 'json',
					success : function(result) {
						loadRole($("#form-create"));
						loadMenu($("#form-create"));
						$('#createdOn').val(d.getDate()+"-"+d.getMonth()+"-"+d.getFullYear()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
						//kosong data di table
						$("#list-data").empty();
						// looping data dengan jQuery
						$
								.each(
										result,
										function(index, item) {
											var dataRow = '<tr>'
													+ '<td>'
													+ item.roles.name
													+ '</td>'
													+ '<td>'
													+ item.menus.title
													+ '</td>'
													+ '<td class="col-md-1">'
													+ '<div class="dropdown">'
													+ '<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'
												    + '<ul class="dropdown-menu">'
												    +	'<li id="btn-delete" value="'+item.id+'"><a>Delete</a></li>'
												    + '</ul>'
												    + '</div>'
													+ '</td>' + '</tr>';
											$("#list-data").append(dataRow); //munculkan tabel di list data
										});
						// menampilkan data ke console => F12
						console.log(result);
					}
				});
	}
	
	function loadRole($form, $selected){
		$.ajax({
			// url ke api/product/
			url:'${contextName}/api/role/',
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(result){
				// empty data first
				$form.find("#roleId").empty();
				$form.find("#roleId").append('<option value="">-Choose Role-</option>');
				// looping data
				$.each(result, function(index, item){
					if ($selected==item.id) {
						$form.find("#roleId").append('<option value="'+ item.id +'" selected="selected">'+ item.name +'</option>');
					} else {
						$form.find("#roleId").append('<option value="'+ item.id +'">'+ item.name +'</option>');
					}
					
				});
			}
		});
	}
	
	function loadMenu($form, $selected){
		$.ajax({
			// url ke api/product/
			url:'${contextName}/api/menu/',
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(result){
				// empty data first
				$form.find("#menuId").empty();
				$form.find("#menuId").append('<option value="">-Choose Menu-</option>');
				// looping data
				$.each(result, function(index, item){
					if ($selected==item.id) {
						$form.find("#menuId").append('<option value="'+ item.id +'" selected="selected">'+ item.title +'</option>');
					} else {
						$form.find("#menuId").append('<option value="'+ item.id +'">'+ item.title +'</option>');
					}
					
				});
			}
		});
	}
	
	// method untuk add data
	function addData($form){
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/product/
			url:'${contextName}/api/menu-access/',
			type:'post',
			// data type berupa JSON
			dataType:'json',
			// mengirim parameter data
			data:JSON.stringify(dataForm),
			// mime type 
			contentType: 'application/json',
			success : function(result){
				//menutup modal
				// panggil method load data, untuk melihat data terbaru
				loadData();
			}
		});
		console.log(dataForm);
	}
	
	//btn-delete di click
	$('#list-data').on('click','#btn-delete', function(){
		var vid = $(this).val();
		$.ajax({
			url:'${contextName}/menu-access/delete',
			type:'get',
			dataType:'html',
			success : function(result){
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
	function deleteData($form){
		// memangil method getFormData dari file
		var vid = $form.find("#id").val();
		$.ajax({
			// url ke api/role/
			url:'${contextName}/api/menu-access/'+vid,
			// method http di controller
			type:'delete',
			// data type berupa JSON
			dataType:'json',
			// jika sukses
			success : function(result){
				//menutup modal
				$("#modal-form").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
				console.log(result);
			}
		});
	}
</script>