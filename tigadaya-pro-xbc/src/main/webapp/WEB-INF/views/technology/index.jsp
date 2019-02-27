<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">TECHNOLOGY</h3>
	</div>
	
	<div class="box-header col-md-12">
			<input type="text" name="search" id="search"
				placeholder="Search by name" />
			<button class="btn btn-warning btn-xm"
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

<div class="modal" id="modal-technology">
	<div class="modal-dialog">
		<div class="box box-success">
			<div class="box-header with-border">
				<h3 class="box-title" id="modal-title">Form Input</h3>
			</div>
			<div class="box-body" id="modal-datech">
				
			</div>
		</div>
	</div>
</div>

<div class="modal" id="modal-tech">
	<div class="modal-dialog">
		<div class="box box-success">
			<div class="box-header with-border">
				<h3 class="box-title" id="modal-title1">Form Input</h3>
			</div>
			<div class="box-body" id="modal-datrain">
				
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
						'<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
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
	
	// function get data technology
	function getData(dataId){
		// panggil API
		$.ajax({
			// url ke api/category/
			url:'${contextName}/api/technology/'+dataId,
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(dataApi){
				$('#modal-datech').find('#id').val(dataApi.id);
				$('#modal-datech').find('#name').val(dataApi.name);
				$('#modal-datech').find('#name').val(dataApi.name);
				$('#modal-datech').find('#createdBy').val(dataApi.createdBy);
				$('#modal-datech').find('#notes').val(dataApi.notes);
				$('#modal-datech').find('#createdOn').val(dataApi.createdOn);
				$('#modal-datech').find('#isDelete').val(dataApi.isDelete);
				
				console.log(dataApi);
			}
		});
	}
	
	//function get data trainer
	function getDataTr(dataId) {
		$.ajax({
			url:'${contextName}/api/techtrainer/'+dataId,
			type:'get',
			dataType:'json',
			success:function(dataApi){
				$('#modal-datrain').find('#id').val(dataApi.id);
				$('#modal-datrain').find('#technologyId').val(dataApi.technologyId);
				$('#modal-datrain').find('#trainerId').val(dataApi.trainerId);
				$('#modal-datrain').find('#createdBy').val(dataApi.createdBy);
				$('#modal-datrain').find('#createdOn').val(dataApi.createdOn);
				
				console.log(dataApi);
			}
		});
	}
	
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
				$("#modal-title").html("TECHNOLOGY");
				//mengisi content dengan variable result
				$("#modal-datech").html(result);
				//menampilkan modal pop up
				$("#modal-technology").modal('show');
				$('#createdOn').val(d.getDate()+"-"+d.getMonth()+"-"+d.getFullYear()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
			}
		});
	});
	
	
	// method untuk add data
	function addData($form){
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = $form.serializeJSON();
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
				$("#modal-technology").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
			}
		});
		console.log(dataForm);
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
					'<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
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
				$("#modal-datech").html(result);
				//menampilkan modal pop up
				$("#modal-technology").modal('show');
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
				$("#modal-tech").modal('hide');
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
				$("#modal-datech").html(result);
				//menampilkan modal pop up
				$("#modal-technology").modal('show');
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
				$("#modal-technology").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
				console.log(result);
			}
		});
	}
	
	
	</script>