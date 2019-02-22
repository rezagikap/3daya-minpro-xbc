<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>
<div class="box box-info">
	<div class="box-header with-border">
		<h3 class="box-title">USER</h3>
		
		<div class="box-tools col-md-12">
			<input type="input" name="search" id="search"/>
			<button type="button" class="btn btn-primary btn-sm" id="btn-search">
				<i class="fa fa-search"></i>Search
			</button>
		</div>
		
		<div class="box-tools">
			<button type="button" class="btn btn-primary btn-sm" id="btn-add">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	<div class="box-body">
		<table class="table">
			<thead>
				<tr>
					<th>NAME</th>
					<th>ROLE</th>
					<th>EMAIL</th>
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
				<h3 class="box-title" id="modal-title">Form Input</h3>
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
	$("#btn-add").click(function() {
		var d = new Date($.now());
		$.ajax({
			url : '${contextName}/user/create',
			type : 'get',
			dataType : 'html',
			success : function(result) {
				// mengganti judul modal
				$("#modal-title").html("Add New User");
				// mengisi content dengan variable result
				$("#modal-data").html(result);
				// menampilkan modal pop up
				$("#modal-form").modal('show');
				$('#createdOn').val(
						d.getDate() + "-" + d.getMonth() + "-"
								+ d.getFullYear() + " " + d.getHours()
								+ ":" + d.getMinutes() + ":"
								+ d.getSeconds());
				loadRole($("#modal-data"));
			}
		});
	});

	//method loadData
	function loadData(){
		$.ajax({
			// url ke api/role/
			url:'${contextName}/api/user/',
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(result){
				//kosong data di table
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
					var dataRow ='<tr>'+
						'<td>'+ item.username+'</td>'+
						'<td>'+ item.roleId+ '</td>'+ 
						'<td>'+ item.email+ '</td>'+ 
						'<td class="col-md-1">'+
						'<button type="button" class="btn btn-edit btn-warning btn-sm" value="'+ item.id +'"><i class="fa fa-edit"></i></button> '+
						'<button type="button" class="btn btn-delete btn-danger btn-sm" value="'+ item.id +'"><i class="fa fa-trash"></i></button> '+
						'</td>'+
						'</tr>';
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
			// url ke api/user/
			url : '${contextName}/api/user/',
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
			url : '${contextName}/api/user/' + dataId,
			type : 'get',
			dataType : 'json',
			success : function(dataApi) {
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#username').val(dataApi.username);
				$('#modal-data').find('#roleId').val(dataApi.roleId);
				$('#modal-data').find('#email').val(dataApi.email);
				console.log(dataApi);
			}
		});
	}
	// ketidak btn-edit di click
	$('#list-data').on('click','.btn-edit', function(){
		var d = new Date($.now());
		$.ajax({
			url:'${contextName}/user/edit',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("Edit Data User");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-form").modal('show');
				// panggil method getData
				getData(vid);
				$('#modifiedOn').val(
						d.getDate() + "-" + d.getMonth() + "-"
								+ d.getFullYear() + " " + d.getHours()
								+ ":" + d.getMinutes() + ":"
								+ d.getSeconds());
				loadRole($("#modal-data"));
				
			}
		});
	});
	
	// method untuk delete data
	function editData($form){
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/user/
			url:'${contextName}/api/user/',
			type:'put',
			// data type berupa JSON
			dataType:'json',
			// mengirim parameter data
			data:JSON.stringify(dataForm),
			// mime type 
			contentType: 'application/json',
			success : function(result){
				//menutup modal
				$("#modal-form").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
			}
		});
		console.log(dataForm);
	}
	
	//btn-delete di click
	$('#list-data').on('click','.btn-delete', function(){
		var vid = $(this).val();
		$.ajax({
			url:'${contextName}/user/delete',
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
			// url ke api/trainer/
			url:'${contextName}/api/user/'+vid,
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
	
	function loadRole($form, $selected){
		$.ajax({
			// url ke api/product/
			url:'${contextName}/api/role/list',
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(result){
				// empty data first
				$form.find("#roleId").empty();
				$form.find("#roleId").append('<option value="">=Select Role=</option>');
				// looping data
				$.each(result, function(index, item){
					if($selected == item.id){
						$form.find("#roleId").append('<option value="'+ item.id +'" selected="selected">'+ item.code +' - '+ item.name +'</option>');
					}else {
						$form.find("#roleId").append('<option value="'+ item.id +'">'+ item.code +' - '+ item.name +'</option>');
					}
				});
			}
		});
	}
</script>