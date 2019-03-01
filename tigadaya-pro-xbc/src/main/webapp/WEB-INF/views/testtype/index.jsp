<% request.setAttribute("contextName", request.getServletContext().getContextPath());%>
<div class="box box-info">
	<div class="box-header with-border">
		<h3 class="box-title">TEST</h3>
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
					<th>CREATED BY</th>
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

	$("#btn-add").click(function() {
		$.ajax({
			url : '${contextName}/testtype/create',
			type : 'get',
			dataType : 'html',
			success : function(result) {
				// mengganti judul modal
				$("#modal-title").html("TEST TYPE");
				// mengisi content dengan variable result
				$("#modal-data").html(result);
				// menampilkan modal pop up
				$("#modal-form").modal('show');
			}
		});
	});
	
	// method loadData
	function loadData() {
		$.ajax({
					// url ke api/testtype/
					url : '${contextName}/api/testtype/',
					type : 'get',
					// data type nya berupa JSON
					dataType : 'json',
					success : function(result) {
						// kosong data di table
						$("#list-data").empty();
						// looping data dengan jQuery
						$.each(result,function(index, item) {
							if(item.isDelete==false){
							var dataRow = '<tr>'+ 
							'<td>'+ item.name+ '</td>'+ 
							'<td>'+ item.createdBy+ '</td>'+ 
							'<div class="dropdown">'+
							'<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
						    '<ul class="dropdown-menu">'+
						    	'<li id="btn-edit" value="'+item.id+'"><a>Edit</a></li>'+
						    	'<li id="btn-delete" value="'+item.id+'"><a>Delete</a></li>'+
						    '</ul>'+
						    '</div>'+
						'</td>'+
						'</tr>';
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
			// url ke api/test/
			url : '${contextName}/api/testtype/',
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
			url : '${contextName}/api/testtype/' + dataId,
			type : 'get',
			dataType : 'json',
			success : function(dataApi) {
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#name').val(dataApi.name);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#notes').val(dataApi.notes);
				$('#modal-data').find('#typeOfAnswer').val(dataApi.typeOfAnswer);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				$('#modal-data').find('#modifiedBy').val(dataApi.mmodifiedBy);
				$('#modal-data').find('#modifiedOn').val(dataApi.modifiedOn);
				$('#modal-data').find('#deletedBy').val(dataApi.deletedBy);
				$('#modal-data').find('#deletedOn').val(dataApi.deletedOn);
				$('#modal-data').find('#isDelete').val(dataApi.isDelete);
				console.log(dataApi);
			}
		});
	}
	
	function search(){
		var item = $('#search').val();
		$.ajax({
			url: '${contextName}/api/testtype/search/' + item,
			type: 'get',
			dataType: 'json',
			success : function(result){
				$('#list-data').empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
				var dataRow = '<tr>' +
					'<td>' + item.name + '</td>' +
					'<td>' + item.createdBy + '</td>' +
					'<td class = "col-md-1">' +
						'<div class="col-md-1">' +
					'<button class = "btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
					'<ul class= "dropdown-menu">' +
					'<li id="btn-edit" value="'+item.id+'"><a>Edit</a></li>'+
			    	'<li id="btn-delete" value="'+item.id+'"><a>Delete</a></li>'+
				    '</ul>'+
				    '</div>'+
					'</td>'+
					'</tr>';
					$("#list-data").append(dataRow);
					});
				console.log(result);
			}
		});
	}
	</script>