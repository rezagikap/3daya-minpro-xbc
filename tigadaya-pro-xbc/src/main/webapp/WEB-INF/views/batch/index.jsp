<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<div class = "box box-info">
	<div class = "box-header">
		<h3 class = "box-title">BATCH</h3>
	</div>
	<div class = "box-body">
	<div class="row">
		<div class="col-md-11">
			<div class="input-group col-md-5">
				<input type="text" name="search" id="search" class="form-control"
					placeholder="Search by username/email" /> <span class="input-group-btn">
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
	
		<table class="table">
			<thead>
				<tr>
					<th>TECHNOLOGY</th>
					<th>NAME</th>
					<th>TRAINER</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody id="list-data">
			</tbody>
		</table>		
	</div>
</div>
<!-- Untuk memunculkan pop-up -->
<div class = "modal" id = "modal-form-large">
	<div class = "modal-dialog modal-lg">
		<div class = "box box-success">
			<div class = "box-header with-border">
				<h3 class = "box-title" id = "modal-title-large"></h3>
			</div>
			<div class = "box-body" id = "modal-data-large">
			</div>
		</div>
	</div>
</div>

<!-- tempat menulis javascript -->
<script>
	//method yang pertama kali di panggil saat di page load
	$(function(){
		// memanggil method loadData
		loadData();
	});
	
	// method loadData
	function loadData(){
		$.ajax({
			// untuk meng-link api/batch/
			url : '${contextName}/api/batch/',
			// type berupa get
			type : 'get',
			// data type berupa JSON
			dataType : 'json',
			success : function(result){
				// pertama-tama kosong data di table
				$("#list-data").empty();
				// looping data dengan JQuery
				$.each(result, function(index, item){
					var dataRow ='<tr>'+
					'<td>'+ item.technologyId +'</td>'+
					'<td>'+ item.name+'</td>'+
					'<td>'+ item.trainerId+'</td>'+
					'<td class = "col-md-1">'+
					'<div class = "dropdown">'+
						'<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
						'<ul class = "dropdown-menu">'+
							'<li id = "btn-edit" value = "'+item.id+'"><a>Edit</a></li>'+
							'<li id = "btn-partcipant" value = ""><a>Add Participant</a></li>'+
							'<li id = "btn-test" value = ""><a>Setup Test</a></li>'+
						'</ul>' +
					'</div>' +
					'</td>' +
					'</tr>';
				$("#list-data").append(dataRow);
				});
				console.log(result);
			}
		});
	}
	
	//method search
	function search(){
		var item = $('#search').val();
		$.ajax({
			url : '${contextName}/api/batch/search/'+item,
			type : 'get',
			dataType : 'json',
			success : function(result){
				$('#list-data').empty();
				$.each(result, function(index, item){
					var dataRow ='<tr>'+
					'<td>'+ item.technologyId +'</td>'+
					'<td>'+ item.name+'</td>'+
					'<td>'+ item.trainer.name+'</td>'+
					'<td class = "col-md-1">'+
					'<div class = "dropdown">'+
						'<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
						'<ul class = "dropdown-menu">'+
							'<li id = "btn-edit" value = "'+item.id+'"><a>Edit</a></li>'+
							'<li id = "btn-partcipant" value = "'+item.id+'"><a>Add Participant</a></li>'+
							'<li id = "btn-test" value = "'+item.id+'"><a>Setup Test</a></li>'+
						'</ul>' +
					'</div>' +
					'</td>' +
					'</tr>';
				$("#list-data").append(dataRow);
				});
			}
		});
	}
	
	//loadTrainer
	function loadTrainer($form, $selected){
		$.ajax({
			url : '${contextName}/api/trainer/',
			type : 'get',
			dataType : 'json',
			success : function(result){
				$form.find("#trainerId").empty();
				$form.find("#trainerId").append('<option value = "">-Choose Trainer-</option>');
				//looping data
				$.each(result, function(index, item){
					if ($selected == item.id){
						$form.find("#trainerId").append('<option value ="'+item.id+'" selected="selected">'+item.name+'</option>');
					}else{
						$form.find("#trainerId").append('<option value = "'+item.id+'">'+item.name+'</option>');
					}
				});
			}
		});
	}
	
	//loadBootcampType
	function loadBootcampType($form, $selected){
		$.ajax({
			url : '${contextName}/api/bootcamptype/',
			type : 'get',
			dataType : 'json',
			success : function(result){
				$form.find("#bootcampTypeId").empty();
				$form.find("#bootcampTypeId").append('<option value = "">-Choose Bootcamp Type-</option>');
				//looping data
				$.each(result, function(index, item){
					if ($selected == item.id){
						$form.find("#bootcampTypeId").append('<option value = "'+item.id+'" selected="selected">'+item.name+'</option>');
					} else {
						$form.find("#bootcampTypeId").append('<option value = "'+item.id+'">'+item.name+'</option');
					}
				});
			}
		});
	}
	
	//ketika btn-add di klik
	$("#btn-add").click(function(){
		var d = new Date($.now());
		$.ajax({
			url : '${contextName}/batch/create',
			type : 'get',
			dataType : 'html',
			success : function(result){
				$('#modal-title-large').html("BATCH");
				$('#modal-data-large').html(result);
				$('#modal-form-large').modal('show');
				$('#createdOn').val(
						d.getDate() + "-" + d.getMonth() + "-"
						+ d.getFullYear() + " " + d.getHours()
						+ ":" + d.getMinutes() + ":"
						+ d.getSeconds());
				loadTrainer($("#modal-data-large"));
				loadBootcampType($("#modal-data-large"));
			}
		});
	});
	
	function addData($form){
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			url : '${contextName}/api/batch/',
			type : 'post',
			dataType : 'json',
			data : JSON.stringify(dataForm),
			contentType : 'application/json',
			success : function(result){
				$('#modal-form-large').modal('hide');
				loadData();	
			}
		});
	}
	
	function getData(dataId){
		$.ajax({
			url : '${contextName}/api/batch/'+dataId,
			type : 'get',
			dataType : 'json',
			success : function(dataApi){
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#technologyId').val(dataApi.techologyId);
				$('#modal-data').find('#trainerId').val(dataApi.trainerId);
				$('#modal-data').find('#name').val(dataApi.name);
				$('#modal-data').find('#periodFrom').val(dataApi.periodFrom);
				$('#modal-data').find('#periodTo').val(dataApi.periodTo);
				$('#modal-data').find('#roomId').val(dataApi.roomId);
				$('#modal-data').find('#bootcampTypeId').val(dataApi.bootcampTypeId);
				$('#modal-data').find('#notes').val(dataApi.notes);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				$('#modal-data').find('#isDelete').val(dataApi.isDelete);
			}
		});
	}
	
	//ketika btn-edit di klik
	$('#list-data').on('click', '#btn-edit', function() {
		var vid = $(this).val();
		$.ajax({
			url : '${contextName}/batch/edit',
			type : 'get',
			dataType : 'html',
			success : function(result) {
				//mengganti judul modal
				$("#modal-title-large").html("EDIT DATA");
				//menggisi content dengan variable result
				$("#modal-data-large").html(result);
				//menampilkan modal pop up
				$("#modal-form-large").modal('show');
				//panggil Trainer
				loadTrainer($("#modal-data"));
				loadBootcampType($("#modal-data"));
				getData(vid);
			}
		});
	});
	
	//method untuk edit data 
	function editData($form){
		//memanggil method getFormData dari file 
		//resources/dist/js/map-form-object.js
		var dataForm = getFormData($form);
		$.ajax({
			//url ke api/batch/
			url : '${contextName}/api/batch/',
			type: 'put',
			//data type berupa JSON
			dataType:'json',
			//mengirim parameter data 
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
	
	function search(){
		var item = $('#search').val();
		$.ajax({
			url: '${contextName}/api/batch/search/' + item,
			type: 'get',
			dataType: 'json',
			success: function(result){
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
					var dataRow = '<tr>'
						+ '<td>'
						+ item.technologyId
						+ '</td>'
						+ '<td>'
						+ item.name
						+ '</td>'
						+ '<td class="col-md-1">'
						'<div class = "dropdown">'+
						'<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+
						'<ul class = "dropdown-menu">'+
							'<li id = "btn-edit" value = "'+item.id+'"><a>Edit</a></li>'+
							'<li id = "btn-partcipant" value = "'+item.id+'"><a>Add Participant</a></li>'+
							'<li id = "btn-test" value = "'+item.id+'"><a>Setup Test</a></li>'+
						'</ul>' +'</div>' 
						+ '</td>' + '</tr>';
					$("#list-data").append(dataRow);
				});
				console.log(result);
			}
		});
	}
			
		
</script>