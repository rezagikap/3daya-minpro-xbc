<%request.setAttribute("contextName", request.getServletContext().getContextPath());%>

<div class="box box-info">
	
	<div class="box-header">
		<h3 class="box-title">
			<b>IDLE NEWS</b>
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
					<th>Title</th>
					<th>Category</th>
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
				<h3 class="box-title" id="modal-title">Form Input</h3>
			</div>
			<div class="box-body" id="modal-data"></div>
		</div>
	</div>
</div>


<script>

	// method yang pertama kali dipanggil saat page di load
	$(function() {
		// memanggil method loadData;
		loadData();
	});

	//ketika button add di click
	$("#btn-add").click(function() {
				var d = new Date($.now());
				$.ajax({
					url : '${contextName}/idle-news/create',
					type : 'get',
					dataType : 'html',
					success : function(result) {
						//mengganti judul modal
						$("#modal-title").html("Add New idle-news");
						//mengisi content dengan variable result
						$("#modal-data").html(result);
						//menampilkan modal pop up
						$("#modal-form").modal('show');
						$('#createdOn').val(d.getDate() + "-"
								+ d.getMonth() + "-"
								+ d.getFullYear() + " " 
								+ d.getHours()	+ ":" 
								+ d.getMinutes() + ":"
								+ d.getSeconds());
								loadCategory($("#modal-data"));
					}
				});
			});
	
	// method untuk add data
	function addData($form) {
		// memangil method getFormData dari file
		// resources/dist/js/map-form-objet.js
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/idle-news/
			url : '${contextName}/api/idle-news/',
			type : 'post',
			// data type berupa JSON
			dataType : 'json',
			// mengirim parameter data
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
	
	
	// function get data 
	function getData(dataId) {
		// panggil API
		$.ajax({
			// url ke api/idle-news/
			url : '${contextName}/api/idle-news/' + dataId,
			type : 'get',
			// data type berupa JSON
			dataType : 'json',
			success : function(dataApi) {
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#title').val(dataApi.title);
				$('#modal-data').find('#categoryId').val(dataApi.categoryId);
				$('#modal-data').find('#content').val(dataApi.content);
				//$('#modal-data').find('#isPublish').val(dataApi.isPublish);
				//$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				//$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				//$('#modal-data').find('#modifiedBy').val(dataApi.modifiedBy);
				//$('#modal-data').find('#modifiedOn').val(dataApi.modifiedOn);
				//$('#modal-data').find('#deletedBy').val(dataApi.deletedBy);
				//$('#modal-data').find('#deletedOn').val(dataApi.deletedOn);
				//$('#modal-data').find('#isDelete').val(dataApi.isDelete);

				console.log(dataApi);
			}
		});
	}

	//method loadData
	function loadData() {
		$.ajax({
					// url ke api/idle-news/
					url : '${contextName}/api/idle-news/',
					type : 'get',
					// data type berupa JSON
					dataType : 'json',
					success : function(result) {
						//kosong data di table
						$("#list-data").empty();
						// looping data dengan jQuery
						$.each(result,function(index, item) {
							var dataRow = '<tr>'
								+ '<td>'+ item.title+ '</td>'
								+ '<td>'+ item.categoryId+ '</td>'
								+ '<td class="col-md-1">'+ '<div class="dropdown">'+ '<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'+ '<ul class="dropdown-menu">'
								+ '<li id="btn-edit" value="'+item.id+'"><a>Edit</a></li>'
								+ '<li id="btn-delete" value="'+item.id+'"><a>Publish</a></li>'
								+ '<li id="btn-delete" value="'+item.id+'"><a>Share To Email</a></li>'
								+ '<li id="btn-delete" value="'+item.id+'"><a>Delete</a></li>'
								+ '</ul>'
								+ '</div>'
								+ '</td>' 
								+ '</tr>';
						$("#list-data").append(dataRow);
										});
						// menampilkan data ke console => F12
						console.log(result);
					}
				});
	}

	

	

	// ketika btn-delete di click
	$('#list-data').on('click','#btn-delete', function() {
				var vid = $(this).val();
				var d = new Date($.now());
				$.ajax({
					url : '${contextName}/idle-news/delete',
					type : 'get',
					dataType : 'html',
					success : function(result) {
						//mengganti judul modal
						$("#modal-title").html("Delete");
						//mengisi content dengan variable result
						$("#modal-data").html(result);
						//menampilkan modal pop up
						$("#modal-form").modal('show');
						//panggil method
						getData(vid);
						$('#deletedOn').val(
								d.getDate() + "-" 
								+ d.getMonth() + "-"
								+ d.getFullYear() + " " 
								+ d.getHours()+ ":" 
								+ d.getMinutes() + ":"
								+ d.getSeconds());
					}
				});
			});

	// method untuk delete data
	function deleteData($form) {
		// memangil method getFormData dari file
		var vid = $form.find("#id").val();
		$.ajax({
			// url ke api/category/
			url : '${contextName}/api/idle-news/' + vid,
			// method http di controller
			type : 'delete',
			// data type berupa JSON
			dataType : 'json',
			// jika sukses
			success : function(result) {
				//menutup modal
				$("#modal-form").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData(); //digunakan untuk merefresh listnya
				console.log(result);//digunakan untuk menampilkan data di console

			}
		});

	}

	// ketidak btn-edit di click
	//menjalankan on click pada footer di edit

	$('#list-data').on('click','#btn-edit',function() {
				var vid = $(this).val();
				var d = new Date($.now());
				$.ajax({
					url : '${contextName}/idle-news/edit',
					type : 'get',
					dataType : 'html',
					success : function(result) {
						//mengganti judul modal
						$("#modal-title").html("Edit Data idle-news");
						//mengisi content dengan variable result
						$("#modal-data").html(result);
						//menampilkan modal pop up
						$("#modal-form").modal('show');
						// panggil method getData
						getData(vid);
						$('#modifiedOn').val(d.getDate() + "-"
										+ d.getMonth() + "-"
										+ d.getFullYear() + " "
										+ d.getHours()+ ":" 
										+ d.getMinutes() + ":"
										+ d.getSeconds());
						loadCategory($("#modal-data"));
						// panggil method getData
						getData(vid);
						
					}
				});
			});

	// method untuk edit data
	function editData($form) {
		// memangil method getFormData dari file
		//var vid = $form.find("#form-edit").val();
		var dataForm = getFormData($form);
		$.ajax({
			// url ke api/category/
			url : '${contextName}/api/idle-news/',
			// method http di controller
			type : 'put',
			// data type berupa JSON
			dataType : 'json',
			data : JSON.stringify(dataForm),
			//mime type
			contentType : 'application/json',
			// jika sukses
			success : function(result) {
				//menutup modal
				$("#modal-form").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData(); //digunakan untuk merefresh listnya
			}
		});
		console.log(dataForm);//digunakan untuk menampilkan data di console

	}
	
	function search(){
		var item = $('#search').val();
		$.ajax({
			url: '${contextName}/api/idle-news/search/' + item,
			type: 'get',
			dataType: 'json',
			success: function(result){
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
				var dataRow ='<tr>'
					+ '<td>'+ item.categoryId+ '</td>'
					+'<td>'+ item.title+'</td>'
					+'<td class="col-md-1">'
					+'<div class="dropdown">'
					+'<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'
					+'<ul class="dropdown-menu">'
					+'<li id="btn-edit" value="'+item.id+'"><a>Edit</a></li>'
					+ '<li id="btn-delete" value="'+item.id+'"><a>Publish</a></li>'
					+ '<li id="btn-delete" value="'+item.id+'"><a>Share To Email</a></li>'
					+'<li id="btn-delete" value="'+item.id+'"><a>Delete</a></li>'+'</ul>'+ '</div>'
					+'</td>'
					+'</tr>';
					$("#list-data").append(dataRow);
					});
				console.log(result);
			}
		});
	}
	
	//ketika button drop down choose category di click
	function loadCategory($form, $selected){
		$.ajax({ 
			url : '${contextName}/api/category/',
			type : 'get',
			dataType : 'html',
			success : function(result) {
				//empty data first
				$form.find("#categoryId").empty();
				$form.find("#categoryId").append('<option value="">=Select Category=</option>');
				//looping data
				$.each(result,function(index, item){
					if ($selected == item.id) {
						$form.find("#categoryId").append('<option value="'+item.id'"selected="selected">'+item.code+' - '+ item.name +'</option>');
					}else{
						$form.find("#categoryId").append('<option value="'+item.id'">'+item.code+' - '+ item.name +'</option>');
					}
						
					});
				}
		});	
	}
				
		
</script>