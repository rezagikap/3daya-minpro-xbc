<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">Role</h3>
		<div class="box-tools">
			<button type="button" id="btn-add" class="btn btn-primary btn-sm">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	<div class="box-tools col-md-12">
			<input type="text" name="search" id="search"/>
			<button type="button" class="btn btn-primary btn-sm" id="btn-search">
				<i class="fa fa-search"></i>
			</button>
		</div>
	<div class="box-body">
		<table class="table">
			<thead>
				<tr>
					<th>Code</th>
					<th>Name</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody id="list-data">
			</tbody>
		</table>		
	</div>
</div>

<div class="modal" id="modal-role">
	<div class="modal-dialog">
		<div class="box box-success">
			<div class="box-header with-border">
				<h3 class="box-title" id="modal-title">Form Input</h3>
			</div>
			<div class="box-body" id="modal-data">
				
			</div>
		</div>
	</div>
</div>
<script>
	// method yang pertama kali dipanggil saat page di load
	$(function(){
		// memanggil method loadData;
		loadData();
	});
	
	//ketika button add di click
	$("#btn-add").click(function(){
		var d = new Date($.now());
		$.ajax({
			url:'${contextName}/role/create',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("Role");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-role").modal('show');
				$('#createdOn').val(d.getDate()+"-"+d.getMonth()+"-"+d.getFullYear()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
			}
		});
	});
	
	// method untuk add data
	function addData($form){
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/role/
			url:'${contextName}/api/role/',
			type:'post',
			// data type berupa JSON
			dataType:'json',
			// mengirim parameter data
			data:JSON.stringify(dataForm),
			// mime type 
			contentType: 'application/json',
			success : function(result){
				//menutup modal
				$("#modal-role").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
			}
		});
		console.log(dataForm);
	}
	//method loadData
	function loadData(){
		$.ajax({
			// url ke api/role/
			url:'${contextName}/api/role/',
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(result){
				//kosong data di table
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
					var dataRow ='<tr>'+
						'<td>'+ item.code+'</td>'+
						'<td>'+ item.name+'</td>'+
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
	
	// function get data 
	function getData(dataId){
		// panggil API
		$.ajax({
			// url ke api/role/
			url:'${contextName}/api/role/'+dataId,
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(dataApi){
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#code').val(dataApi.code);
				$('#modal-data').find('#name').val(dataApi.name);
				$('#modal-data').find('#description').val(dataApi.description);
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
	
	//btn-edit di click
	$('#list-data').on('click','.btn-edit', function(){
		var vid = $(this).val();
		var d = new Date($.now());
		$.ajax({
			url:'${contextName}/role/edit',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("EDIT");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-role").modal('show');
				//panggil method
				getData(vid);
				$('#createdOn').val(
						d.getDate() + "-" + d.getMonth() + "-"
								+ d.getFullYear() + " " + d.getHours()
								+ ":" + d.getMinutes() + ":"
								+ d.getSeconds());
			}
		});
	});
	
	// method untuk edit data
	function editData($form){
		// memangil method getFormData dari file
		// resources/dist/js/map-dagang-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/role/
			url:'${contextName}/api/role/',
			type:'put',
			// data type berupa JSON
			dataType:'json',
			// mengirim parameter data
			data:JSON.stringify(dataForm),
			// mime type 
			contentType: 'application/json',
			success : function(result){
				//menutup modal
				$("#modal-role").modal('hide');
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
			url:'${contextName}/role/delete',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("DELETE");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-role").modal('show');
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
			url:'${contextName}/api/role/'+vid,
			// method http di controller
			type:'delete',
			// data type berupa JSON
			dataType:'json',
			// jika sukses
			success : function(result){
				//menutup modal
				$("#modal-role").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
				console.log(result);
			}
		});
	}
	
	/* //ketika button search di click
	$("#btn-search").on('click','.btn-search', function(){
		var vid = $form.find("#name").val();
			$.ajax({
			url:'${contextName}/role/index',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				//$("#modal-title").html("Role");
				$('#modal-data').find('#name').val(dataApi.name);
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-role").modal('show');
				$('#createdOn').val(d.getDate()+"-"+d.getMonth()+"-"+d.getFullYear()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
			}
		});
	});  */
	
	</script>