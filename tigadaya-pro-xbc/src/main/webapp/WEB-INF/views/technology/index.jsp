<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">TECHNOLOGY</h3>
		<div class="box-tools">
			<button type="button" id="btn-add" class="btn btn-primary btn-sm">
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
					<th>NAME</th>
					<th>CREATED BY</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody id="list-data">
			</tbody>
		</table>		
	</div>
</div>

<div class="modal" id="modal-trainer">
	<div class="modal-dialog modal-lg">
		<div class="box box-success">
			<div class="box-header with-border">
				<h3 class="box-title" id="modal-title">Form Input</h3>
			</div>
			<div class="box-body" id="modal-data">
				
			</div>
		</div>
	</div>
</div>

<div class="modal" id="modal-tech">
	<div class="modal-dialog">
		<div class="box box-success">
			<div class="box-header with-border">
				<h3 class="box-title" id="modal-title">Form Input</h3>
			</div>
			<div class="box-body" id="modal-data1">
				
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
	
	//ketika button add di click maka muncul pop up form add
	//ajax di dalem jquery
	$("#btn-add").click(function(){
		var d = new Date($.now());
		$.ajax({
			url:'${contextName}/technology/create',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("TRAINER");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-trainer").modal('show');
				$('#createdOn').val(d.getDate()+"-"+d.getMonth()+"-"+d.getFullYear()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
			}
		});
	});
	
	// menambahkan fungsi pop up trainer
	function AddTrainer($form){
		$("#modal-tech").modal('show');

	}
	
	// method untuk add data
	function addData($form){
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/technology/
			url:'${contextName}/api/technology/',
			type:'post',
			// data type berupa JSON
			dataType:'json',
			// mengirim parameter data
			data:JSON.stringify(dataForm),
			// mime type 
			contentType: 'application/json',
			success : function(result){
				//menutup modal
				$("#modal-trainer").modal('hide');
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
			url:'${contextName}/api/technology/',
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(result){
				//kosong data di table
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
					var dataRow ='<tr>'+
						'<td>'+ item.name+'</td>'+
						'<td>'+ item.createdBy+'</td>'+
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
	
	// function get data 
	function getData(dataId){
		// panggil API
		$.ajax({
			// url ke api/category/
			url:'${contextName}/api/technology/'+dataId,
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(dataApi){
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#name').val(dataApi.name);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#notes').val(dataApi.notes);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				$('#modal-data').find('#isDelete').val(dataApi.isDelete);
				
				console.log(dataApi);
			}
		});
	}
	
	function search(){
		var item = $('#search').val();
		$.ajax({
			url: '${contextName}/api/technology/search/' + item,
			type: 'get',
			dataType: 'json',
			success: function(result){
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
				var dataRow ='<tr>'+
					'<td>'+ item.name+'</td>'+
					'<td>'+ item.createdBy+'</td>'+
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
	
	
	
	
	//btn-edit di click
	$('#list-data').on('click','#btn-edit', function(){
		var vid = $(this).val();
		$.ajax({
			url:'${contextName}/technology/edit',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("EDIT");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-trainer").modal('show');
				//panggil method
				getData(vid);
			}
		});
	});
	
	// method untuk edit data
	function editData($form){
		// memangil method getFormData dari file
		// resources/dist/js/map-dagang-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/technology/
			url:'${contextName}/api/technology/',
			type:'put',
			// data type berupa JSON
			dataType:'json',
			// mengirim parameter data
			data:JSON.stringify(dataForm),
			// mime type 
			contentType: 'application/json',
			success : function(result){
				//menutup modal
				$("#modal-trainer").modal('hide');
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
			url:'${contextName}/technology/delete',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("DELETE");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-trainer").modal('show');
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
			// url ke api/technology/
			url:'${contextName}/api/technology/'+vid,
			// method http di controller
			type:'delete',
			// data type berupa JSON
			dataType:'json',
			// jika sukses
			success : function(result){
				//menutup modal
				$("#modal-trainer").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
				console.log(result);
			}
		});
	}
	</script>