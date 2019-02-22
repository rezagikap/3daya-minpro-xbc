<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">CATEGORY</h3>
		<div class="box-tools">
			<button type="button" id="btn-add" class="btn btn-success btn-sm">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	<div class="box-body">
		<input class="margin col-md-2" type="text" placeholder="Search by Title" required>
		<table class="table">
			<thead>
				<tr>
					<th>CODE</th>
					<th>NAME</th>
					<th>#</th>
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
			<div class="box-header with-border">
				<h3 class="box-title" id="modal-title"></h3>
			</div>
			<div class="box-body" id="modal-data">
				
			</div>
		</div>
	</div>
</div>

<script>
	//method yang pertama kali dipanggil saat page di load
	$(function(){
		// memanggil method loadData;
		loadData();
	});
	// ketika btn-add di klik
	$("#btn-add").click(function(){
		var d = new Date($.now());
		$.ajax({
			url : '${contextName}/category/create',
			type : 'get',
			dataType : 'html',
			success : function(result){
				$('#modal-title').html('Add New Category');
				$('#modal-data').html(result);
				$('#modal-form').modal('show');
				$('#createdOn').val(
						d.getDate() + "-" + d.getMonth() + "-"
								+ d.getFullYear() + " " + d.getHours()
								+ ":" + d.getMinutes() + ":"
								+ d.getSeconds());
			}
		});
	});
	// method untuk add data
	function addData($form){
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/trainer/
			url:'${contextName}/api/category/',
			type:'post',
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
	//method loadData
	function loadData(){
		$.ajax({
			// url ke api/category/
			url:'${contextName}/api/category/',
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(result){
				//kosong data di table
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
					var dataRow ='<tr>'+
						'<td>'+ item.code +'</td>'+
						'<td>'+ item.name +'</td>'+
						'<td class="col-md-1">'+
							'<button type="button" class="btn btn-edit btn-warning btn-xs" value="'+ item.id +'"><i class="fa fa-edit"></i></button> '+
							'<button type="button" class="btn btn-delete btn-danger btn-xs" value="'+ item.id +'"><i class="fa fa-trash"></i></button> '+
						'</td>'+
						'</tr>';
					$("#list-data").append(dataRow);
				});
				// menampilkan data ke console => F12
				console.log(result);
			}
		});
	}
	
	function getData(dataId) {
		// panggil API
		$.ajax({
			// url ke api/role/
			url : '${contextName}/api/category/' + dataId,
			type : 'get',
			// data type berupa JSON
			dataType : 'json',
			success : function(dataApi) {
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#code').val(dataApi.code);
				$('#modal-data').find('#name').val(dataApi.name);
				$('#modal-data').find('#description').val(dataApi.description);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				$('#modal-data').find('#isDelete').val(dataApi.isDelete);
				console.log(dataApi);
			}
		});
	}
</script>