
<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">CATEGORY</h3>
</div>
		<div class="box-header col-md-12">
			<input type="text" name="search" id="search"
				placeholder="Search by code/name" />
			<button class="margin col-md-0.5 btn btn-warning btn-xm"
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
						<th>CODE</th>
						<th>NAME</th>
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
					<h3 class="box-title" id="modal-title">ADD DATA</h3>
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
		// ketika btn-add di klik
		$("#btn-add").click(
				function() {
					var d = new Date($.now());
					$.ajax({
						url : '${contextName}/category/create',
						type : 'get',
						dataType : 'html',
						success : function(result) {
							$('#modal-title').html('ADD DATA');
							$('#modal-data').html(result);
							$('#modal-form').modal('show');
							$('#createdOn').val(
									d.getDate() + "-" + d.getMonth() + "-"
											+ d.getFullYear() + " "
											+ d.getHours() + ":"
											+ d.getMinutes() + ":"
											+ d.getSeconds());
						}
					});
				});
		// method untuk add data
		function addData($form) {
			// memangil method getFormData dari file
			// resources/dist/js/map-form-objet.js
			var dataForm = getFormData($form);
			$.ajax({
				// url ke api/trainer/
				url : '${contextName}/api/category/',
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
		// ketika btn-edit di click
		$('#list-data').on('click', '#btn-edit', function() { //panggil id btn edit
			var vid = $(this).val();
			$.ajax({
				url : '${contextName}/category/edit',
				type : 'get',
				dataType : 'html',
				success : function(result) {
					//mengganti judul modal
					$("#modal-title").html("EDIT DATA");
					//mengisi content dengan variable result
					$("#modal-data").html(result);
					//menampilkan modal pop up
					$("#modal-form").modal('show');
					// panggil method getData
					getData(vid);
				}
			});
		});
		//method untuk edit data
		function editData($form) {
			var dataForm = getFormData($form);
			$.ajax({
				//url ke api/category/
				url : '${contextName}/api/category/',
				type : 'put',
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
		//ketika btn delete diklik
		$('#list-data').on('click', '#btn-delete', function() { //panggil id btn delete
			var vid = $(this).val();
			$.ajax({
				url : '${contextName}/category/delete',
				type : 'get',
				dataType : 'html',
				success : function(result) {
					$('#modal-title').html("DELETE");
					$('#modal-data').html(result);
					$('#modal-form').modal('show');
					getData(vid);
				}
			});
		});
		function deleteData($form) {
			var vid = $form.find("#id").val();
			$.ajax({
				url : '${contextName}/api/category/' + vid,
				type : 'delete',
				dataType : 'json',
				success : function(result) {
					$("#modal-form").modal('hide');
					loadData();
					console.log(result);
				}
			});
		}
		//method loadData
		function loadData() {
			$
					.ajax({
						// url ke api/category/
						url : '${contextName}/api/category/',
						type : 'get',
						// data type berupa JSON
						dataType : 'json',
						success : function(result) {
							//kosong data di table
							$("#list-data").empty();
							// looping data dengan jQuery
							$
									.each(
											result,
											function(index, item) {
												var dataRow = '<tr>'
														+ '<td>'
														+ item.code
														+ '</td>'
														+ '<td>'
														+ item.name
														+ '</td>'
														+ '<td class="col-md-1">'
														+ '<div class="dropdown">'
														+ '<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'
														+ '<ul class="dropdown-menu">'
														+ '<li id="btn-edit" value="'+item.id+'"><a>Edit</a></li>'
														+ '<li id="btn-delete" value="'+item.id+'"><a>Delete</a></li>'
														+ '</ul>' + '</div>'
														+ '</td>' + '</tr>';
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
					$('#modal-data').find('#description').val(
							dataApi.description);
					$('#modal-data').find('#createdBy').val(dataApi.createdBy);
					$('#modal-data').find('#createdOn').val(dataApi.createdOn);
					$('#modal-data').find('#isDelete').val(dataApi.isDelete);
					console.log(dataApi);
				}
			});
		}
		function search(){
			var item = $('#search').val();
			$.ajax({
				url: '${contextName}/api/category/search/' + item,
				type: 'get',
				dataType: 'json',
				success: function(result){
					$("#list-data").empty();
					// looping data dengan jQuery
					$.each(result, function(index, item){
					var dataRow ='<tr>'+
						'<td>'+ item.code+'</td>'+
						'<td>'+ item.name+'</td>'+
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
		
	</script>