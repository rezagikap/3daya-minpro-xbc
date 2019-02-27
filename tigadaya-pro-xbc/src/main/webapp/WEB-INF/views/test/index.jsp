<%request.setAttribute("contextName", request.getServletContext().getContextPath());%>
<div class="box box-info">
	<div class="box-header with-border">
		<h3 class="box-title">Test</h3>
		<div class="box-tools">
			<button type="button" class="btn btn-primary btn-sm" id="btn-add">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	<div class="box-tools col-md-12">
			<input type="text" name="search" id="search" placeholder="Search by name"/>
			<button class="btn btn-primary btn-sm" onclick="search()">
				<i class="fa fa-circle-o"></i>
			</button>
		</div>
	
	<div class="box-body">
		<table class="table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Created By</th>
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
		var d = new Date($.now());
		$.ajax({
			url : '${contextName}/test/create',
			type : 'get',
			dataType : 'html',
			success : function(result) {
				// mengganti judul modal
				$("#modal-title").html("TEST");
				// mengisi content dengan variable result
				$("#modal-data").html(result);
				// menampilkan modal pop up
				$("#modal-form").modal('show');
				$('#createdOn').val(d.getDate()+"-"+d.getMonth()+"-"+d.getFullYear()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
			}
		});
	});

	// method loadData
	function loadData() {
		$.ajax({
					// url ke api/test/
					url : '${contextName}/api/test/',
					type : 'get',
					// data type nya berupa JSON
					dataType : 'json',
					success : function(result) {
						// kosong data di table
						$("#list-data").empty();
						// looping data dengan jQuery
						$.each(result,function(index, item) {
							var dataRow = '<tr>'+ 
							'<td>'+ item.name+ '</td>'+ 
							'<td>'+ item.createdBy+ '</td>'+ 
							'<td class="col-md-1">'+
							'<div class="dropdown">'+
							'<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
						    '<ul class="dropdown-menu">'+
						    	'<li id="btn-edit" value="'+item.id+'"><a>Edit</a></li>'+
						    	'<li id="btn-delete" value="'+item.id+'"><a>Delete</a></li>'+
						    '</ul>'+
						    '</div>'+
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
			// url ke api/test/
			url : '${contextName}/api/test/',
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
			url : '${contextName}/api/test/' + dataId,
			type : 'get',
			dataType : 'json',
			success : function(dataApi) {
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#name').val(dataApi.name);
				$('#modal-data').find('#isBootcampTest').val(dataApi.isBootcampTest);
				$('#modal-data').find('#notes').val(dataApi.notes);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
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
			url: '${contextName}/api/test/search/' + item,
			type: 'get',
			dataType: 'json',
			success: function(result){
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
				var dataRow ='<tr>'+
					'<td>'+ item.name+'</td>'+
					'<td>'+ item.createdBy+ '</td>'+ 
					'<td class="col-md-1">'+
						'<div class="dropdown">'+
					'<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
				   	 '<ul class="dropdown-menu">'+
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
	
	// ketika btn-delete di click
	$('#list-data').on('click','#btn-delete', function(){
		var vid = $(this).val();
		$.ajax({
			url:'${contextName}/test/delete',
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
			// url ke api/test/
			url:'${contextName}/api/test/'+vid,
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

	// ketika btn-edit di click
	$('#list-data').on('click','#btn-edit', function(){
		var vid = $(this).val();
		var d = new Date($.now());
		$.ajax({
			url:'${contextName}/test/edit',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("EDIT");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-form").modal('show');
				
				// panggil method getData
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
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/test/
			url:'${contextName}/api/test/',
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
	
</script>