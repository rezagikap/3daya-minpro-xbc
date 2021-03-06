
<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>

<div class="box box-info">

	<div class="box-header">
		<h3 class="box-title">
			<b>BIODATA</b>
		</h3>
	</div>
	
	<div class="box-body">
		
		<div class="row">
			
			<div class="col-md-11">
				<div class="input-group col-md-4">
					<input type="text" name="search" id="search" class="form-control" placeholder="Search by name/majors">
					<span class="input-group-btn">
						<button type="submit" name="search" id="search-btn" class="btn btn-warning" onClick="search()">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
			</div>
			
			<div class="box-tools">
				<button type="button" id="btn-add" class="btn btn-warning btn-xm">
					<i class="fa fa-plus"></i>
				</button>
			</div>
		
		</div>
			
		<br>
		
		<table class="table">
			
			<thead>
				<tr>
					<th>NAME</th>
					<th>MAJORS</th>
					<th>GPA</th>
					<th>#</th>
				</tr>
			</thead>
			
			<tbody id="list-data">
			</tbody>
			
		</table>
		
	</div>
	
</div>

<!-- untuk modal dengan ukuran kecil-->
<div class="modal" id="modal-form">
	<div class="modal-dialog modal-lg" >
		<div class="box box-warning">
			<div class="box-header with-border bg-warning">
				<h3 class="box-title" id="modal-title">Form Input</h3>
			</div>
			<div class="box-body" id="modal-data"></div>
		</div>
	</div>
</div>

<script>
	//method yang pertama kali dipanggil saat page di load
	$(function() {
		// memanggil method loadData;
		loadData();
	});
	
	//method loadData
	function loadData() {
		$.ajax({
			// url ke api/menu/
			url : '${contextName}/api/biodata/',
			type : 'get',
			// data type berupa JSON
			dataType : 'json',
			success : function(result) {
				//kosong data di table
				$("#list-data").empty();
				
					$.each(result, function(index, item) {
							if(item.isDelete==false){
								var dataRow = '<tr>'
									+ '<td class="col-md-3">'
									+ item.name
									+ '</td>'
									+ '<td class="col-md-4">'
									+ item.majors
									+ '</td>'
									+ '<td class="col-md-4">'
									+ item.gpa
									+ '</td>'
									+ '<td class="col-md-1">'
									+ '<div class="dropdown">'
									+ '<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'
									+ '<ul class="dropdown-menu">'
									+	'<li id="btn-edit" value="'+item.id+'"><a>Edit</a></li>'
									+	'<li id="btn-delete" value="'+item.id+'"><a>Delete</a></li>'
									+ '</ul>'
									+ '</div>'
									+ '</td>' + '</tr>';
									$("#list-data").append(dataRow); //munculkan tabel di list data	
							}
					});	
				
				// looping data dengan jQuery
							
				// menampilkan data ke console => F12
				console.log(result);
			}
		});
	}
	
	//method loadData
	function search() {
		var cari=$('#search').val();
		$.ajax({
			// url ke api/menu/
			url : '${contextName}/api/biodata/search/'+cari,
			type : 'get',
			// data type berupa JSON
			dataType : 'json',
			success : function(result) {
				//kosong data di table
				$("#list-data").empty();
				
					$.each(result, function(index, item) {
						if(item.isDelete==false){
							var dataRow = '<tr>'
								+ '<td class="col-md-3">'
								+ item.name
								+ '</td>'
								+ '<td class="col-md-4">'
								+ item.majors
								+ '</td>'
								+ '<td class="col-md-4">'
								+ item.gpa
								+ '</td>'
								+ '<td class="col-md-1">'
								+ '<div class="dropdown">'
								+ '<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'
								+ '<ul class="dropdown-menu">'
								+	'<li id="btn-edit" value="'+item.id+'"><a>Edit</a></li>'
								+	'<li id="btn-delete" value="'+item.id+'"><a>Delete</a></li>'
								+ '</ul>'
								+ '</div>'
								+ '</td>' + '</tr>';
								$("#list-data").append(dataRow); //munculkan tabel di list data	
						}
					});	
							
				// menampilkan data ke console => F12
				console.log(result);
			}
		});
	}
	
	function loadBootcampTestType($form,$selected){
		$.ajax({
			//url ke api/bootcamptesttype
			url:'${contextName}/api/bootcamptesttype/',
			type:'get',
			dataType:'json',
			success: function(result){
				$form.find('#bootcampTestType').empty();
				$form.find('#bootcampTestType').append('<option value="">-Choose Bootcamp Test Type-</option>');
				//looping data
				$.each(result, function(index, item){
					if ($selected==item.id){
						$form.find('#bootcampTestType').append('<option value="'+item.id+'" selected="selected">'+item.name+'</option>');
					} else {
						$form.find('#bootcampTestType').append('<option value="'+item.id+'">'+item.name+'</option>');
					}
				});
			}
		});
	}
	
	// function get data 
	function getData(dataId){
		// panggil API
		$.ajax({
			// url ke api/menu/
			url:'${contextName}/api/biodata/'+dataId,
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(dataApi){
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#name').val(dataApi.name);
				$('#modal-data').find('#gender').val(dataApi.gender);
				$('#modal-data').find('#lastEducation').val(dataApi.lastEducation);
				$('#modal-data').find('#educationalLevel').val(dataApi.educationalLevel);
				$('#modal-data').find('#graduationYear').val(dataApi.graduationYear);
				$('#modal-data').find('#majors').val(dataApi.majors);
				$('#modal-data').find('#gpa').val(dataApi.gpa);
				$('#modal-data').find('#bootcampTestType').val(dataApi.bootcampTestType);
				$('#modal-data').find('#iq').val(dataApi.iq);
				$('#modal-data').find('#du').val(dataApi.du);
				$('#modal-data').find('#arithmetic').val(dataApi.arithmetic);
				$('#modal-data').find('#nestedLogic').val(dataApi.nestedLogic);
				$('#modal-data').find('#joinTable').val(dataApi.joinTable);
				$('#modal-data').find('#tro').val(dataApi.tro);
				$('#modal-data').find('#notes').val(dataApi.notes);
				$('#modal-data').find('#interviewer').val(dataApi.interviewer);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				$('#modal-data').find('#modifiedBy').val(dataApi.modifiedBy);
				$('#modal-data').find('#modifiedOn').val(dataApi.modifiedOn);
				$('#modal-data').find('#deletedBy').val(dataApi.deletedBy);
				$('#modal-data').find('#deletedOn').val(dataApi.deletedOn);
				$('#modal-data').find('#isDelete').val(dataApi.isDelete);
				loadBootcampTestType($("#modal-data"),dataApi.bootcampTestType);
				console.log(dataApi);
			}
		});
	}
	
	//ketika button add di click
	$('#btn-add').click(function() {
		var d = new Date($.now());
		$.ajax({
			url : '${contextName}/biodata/create',
			type : 'get',
			dataType : 'html',
			success : function(result) {
				//mengganti judul modal
				$("#modal-title").html("ADD BIODATA");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-form").modal('show');
				$('#createdOn').val(d.getDate()+"-"+d.getMonth()+"-"+d.getFullYear()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
				loadBootcampTestType($("#modal-data"));
			}
		});
	});
	
	// method untuk add data
	function addData($form){
		//memangil method getFormData dari file
		//resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/menu/
			url:'${contextName}/api/biodata/',
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
	}
	
	//btn-edit di click
	$('#list-data').on('click','#btn-edit', function(){
		var vid = $(this).val();
		var d = new Date($.now());
		$.ajax({
			url:'${contextName}/biodata/edit',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("EDIT BIODATA");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-form").modal('show');
				//panggil method
				getData(vid);
				$('#modifiedOn').val(d.getDate() + "-" + d.getMonth() + "-"+ d.getFullYear() + " " + d.getHours()+ ":" + d.getMinutes() + ":"+ d.getSeconds());
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
			url:'${contextName}/api/biodata/',
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
	$('#list-data').on('click','#btn-delete', function(){
		var vid = $(this).val();
		var d = new Date($.now());
		$.ajax({
			url:'${contextName}/biodata/delete',
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
				$('#deletedOn').val(d.getDate() + "-" + (d.getMonth()+1) + "-"+ d.getFullYear() + " " + d.getHours()+ ":" + d.getMinutes() + ":"+ d.getSeconds());
			}
		});
	});
	
	//delete
	function deleteData($form) {
		// memangil method getFormData dari file
		var vid = $form.find("#id").val();
		var nm=$form.find('#name').val();
		var gdr=$form.find('#gender').val();
		var ld=$form.find('#lastEducation').val();
		var gy=$form.find('#graduationYear').val();
		var el=$form.find('#educationalLevel').val();
		var mj=$form.find('#majors').val();
		var gp=$form.find('#gpa').val();
		var btt = $form.find("#bootcampTestType").val();
		var iqq=$form.find('#iq').val();
		var duu=$form.find('#du').val();
		var art=$form.find('#arithmetic').val();
		var nl=$form.find('#nestedLogic').val();
		var jt=$form.find('#joinTable').val();
		var tr=$form.find('#tro').val();
		var no=$form.find('#notes').val();
		var iv=$form.find('#interviewer').val();
		var creBy=$form.find('#createdBy').val();
		var creOn=$form.find('#createdOn').val();
		var modBy=$form.find('#modifiedBy').val();
		var modOn=$form.find('#modifiedOn').val();
		var delBy=$form.find('#deletedBy').val();
		var delOn=$form.find('#deletedOn').val();
		//var isDelete=$form.find('#isDelete').val();
		$.ajax({
			// url ke api/user/
			url : '${contextName}/api/biodata/delete/',
			// method http di controller
			type : 'put',
			// data type berupa JSON
			dataType : 'json',
			//
			data:'{"id":'
				+ vid 
				+ ',"name":"' 
				+ nm 
				+ '","gender":"' 
				+ gdr 
				+ '","lastEducation":"' 
				+ ld 
				+ '","graduationYear":"' 
				+ gy 
				+ '","educationalLevel":"' 
				+ el 
				+ '","majors":"' 
				+ mj 
				+ '","gpa":"' 
				+ gp 
				+ '","bootcampTestType":"' 
				+ btt 
				+ '","iq":"' 
				+ iqq 
				+ '","du":"' 
				+ duu 
				+ '","arithmetic":"' 
				+ art 
				+ '","nestedLogic":"' 
				+ nl 
				+ '","joinTable":"' 
				+ jt 
				+ '","tro":"' 
				+ tr 
				+ '","notes":"' 
				+ no 
				+ '","interviewer":"' 
				+ iv 
				+ '","createdBy":"' 
				+ creBy 
				+ '","createdOn":"' 
				+ creOn 
				+ '","modifiedBy":"' 
				+ modBy 
				+ '","modifiedOn":"' 
				+ modOn 
				+ '","deletedBy":"' 
				+ delBy
				+ '","deletedOn":"' 
				+ delOn
				+ '","isDelete": true}',
			contentType: 'application/json',
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

</script>