<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
			url : '${contextName}/menu/list',
			type : 'get',
			// data type berupa JSON
			dataType : 'html',
			success : function(result) {
				//kosong data di table
				$("#list-data").html(result);
				
			}
		});
	}
	
	
	//method SEARCH
	function search() {
		var cari=$('#search').val();
		$.ajax({
			// url ke api/menu/
			url : '${contextName}/menu/search/'+cari,
			type : 'get',
			// data type berupa JSON
			dataType : 'html',
			success : function(result) {
				//kosong data di table
				$("#list-data").html(result);
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
		$('#isDelete').val("true");
		var dataForm = getFormData($form);
		
		$.ajax({
			// url ke api/user/
			url : '${contextName}/api/menu/',
			// method http di controller
			type : 'put',
			// data type berupa JSON
			dataType : 'json',
			//
			data:JSON.stringify(dataForm),
			contentType: 'application/json',
			// jika sukses
			success : function(result) {
				//menutup modal
				$("#modal-form").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
				
			}
			
		});	
		console.log(dataForm);
	}
</script>

