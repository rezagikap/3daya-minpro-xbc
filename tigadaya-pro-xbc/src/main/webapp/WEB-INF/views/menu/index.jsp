<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>

<div class="box box-info">

	<div class="box-header">
		<h3 class="box-title">
			<b>MENU</b>
		</h3>
	</div>
	
	<div class="box-body">
		
		<div class="row">
			
			<div class="col-md-11">
				<div class="input-group col-md-4">
					<input type="text" name="search" id="search" class="form-control" placeholder="Search by title">
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
					<th>CODE</th>
					<th>TITLE</th>
					<th>MENU PARENT</th>
					<th>#</th>
				</tr>
			</thead>
			
			<tbody id="list-data">
			</tbody>
			
		</table>
		
	</div>
	
</div>

<!-- untuk modal dengan ukuran besar-->
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
			url : '${contextName}/api/menu/',
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
							+ item.code
							+ '</td>'
							+ '<td class="col-md-4">'
							+ item.title
							+ '</td>'
							+ '<td class="col-md-4">'
							+ item.menuParent
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
				alert(mp);
				console.log(result);
				
			}
		});
	}
	
	//method SEARCH
	function search() {
		var cari=$('#search').val();
		$.ajax({
			// url ke api/menu/
			url : '${contextName}/api/menu/search/'+cari,
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
							+ item.code
							+ '</td>'
							+ '<td class="col-md-4">'
							+ item.title
							+ '</td>'
							+ '<td class="col-md-4">'
							+ item.menuParent
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
	
	//ketika button add di click
	$('#btn-add').click(function() {
		var d = new Date($.now());
		$.ajax({
			url : '${contextName}/menu/create',
			type : 'get',
			dataType : 'html',
			success : function(result) {
				//mengganti judul modal
				$("#modal-title").html("ADD MENU");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-form").modal('show');
				$('#createdOn').val(d.getDate()+"-"+(d.getMonth()+1)+"-"+d.getFullYear()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
				loadMenu($("#modal-data"));
			}
		});
	});
	
	function loadMenu($form, $selected){
		$.ajax({
			// url ke api/menu/
			url:'${contextName}/api/menu/',
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(result){
				// empty data first
				$form.find("#menuParent").empty();
				$form.find("#menuParent").append('<option value="">-Choose Menu Parent-</option>');
				// looping data
				$.each(result, function(index, item){
					if ($selected==item.id) {
						$form.find("#menuParent").append('<option value="'+ item.id +'" selected="selected">'+ item.title +'</option>');
					} else {
						$form.find("#menuParent").append('<option value="'+ item.id +'">'+ item.title +'</option>');
					}
					
				});
			}
		});
	}
	
	// method untuk add data
	function addData($form){
		//memangil method getFormData dari file
		//resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/menu/
			url:'${contextName}/api/menu/',
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
	
	//btn-edit di click
	$('#list-data').on('click','#btn-edit', function(){
		var vid = $(this).val();
		var d = new Date($.now());
		$.ajax({
			url:'${contextName}/menu/edit',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("EDIT");
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
	
	// function get data 
	function getData(dataId){
		// panggil API
		$.ajax({
			// url ke api/menu/
			url:'${contextName}/api/menu/'+dataId,
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(dataApi){
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#code').val(dataApi.code);
				$('#modal-data').find('#title').val(dataApi.title);
				$('#modal-data').find('#description').val(dataApi.description);
				$('#modal-data').find('#imageUrl').val(dataApi.imageUrl);
				$('#modal-data').find('#menuOrder').val(dataApi.menuOrder);
				$('#modal-data').find('#menuParent').val(dataApi.menuParent);
				$('#modal-data').find('#menuUrl').val(dataApi.menuUrl);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				$('#modal-data').find('#modifiedBy').val(dataApi.modifiedBy);
				$('#modal-data').find('#modifiedOn').val(dataApi.modifiedOn);
				$('#modal-data').find('#deletedBy').val(dataApi.deletedBy);
				$('#modal-data').find('#deletedOn').val(dataApi.deletedOn);
				$('#modal-data').find('#isDelete').val(dataApi.isDelete);
				loadMenu($("#modal-data"),dataApi.id);
				console.log(dataApi);
				
			}
		});
	}
	
	//function getMenuParent(dataId){
	//	$.ajax({
	//		url: '${contextName}/api/menu/'+dataId,
	//		type:'get',
	//		dataType:'json',
	//	})
	//}
	
	// method untuk edit data
	function editData($form){
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/test/
			url:'${contextName}/api/menu/',
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
			url:'${contextName}/menu/delete',
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
		var cd=$form.find('#code').val();
		var ttl=$form.find('#title').val();
		var desc=$form.find('#description').val();
		var irl=$form.find('#imageUrl').val();
		var mord=$form.find('#menuOrder').val();
		var mp=$form.find('#menuParent').val();
		var mu=$form.find('#menuUrl').val();
		var creBy=$form.find('#createdBy').val();
		var creOn=$form.find('#createdOn').val();
		var modBy=$form.find('#modifiedBy').val();
		var modOn=$form.find('#modifiedOn').val();
		var delBy=$form.find('#deletedBy').val();
		var delOn=$form.find('#deletedOn').val();
		//var isDelete=$form.find('#isDelete').val();
		$.ajax({
			// url ke api/user/
			url : '${contextName}/api/menu/delete/',
			// method http di controller
			type : 'put',
			// data type berupa JSON
			dataType : 'json',
			//
			data:'{"id":'
				+ vid 
				+ ',"code":"' 
				+ cd 
				+ '","title":"' 
				+ ttl 
				+ '","description":"' 
				+ desc 
				+ '","imageUrl":"' 
				+ irl 
				+ '","menuOrder":"' 
				+ mord 
				+ '","menuParent":"' 
				+ mp 
				+ '","menuUrl":"' 
				+ mu 
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

