<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">List Class</h3>
	</div>
	
	<div class="box-header col-md-12">
			<input type="text" name="search" id="search"
				placeholder="Search by batch" />
			<button class="margin col-md-0.5 btn btn-warning btn-xm"
				onClick="search()">
				<i class="fa fa-circle-o"></i>
			</button>
		</div>
		
	<div class="box-body">
		<table class="table">
			<thead>
				<tr>
					<th>BATCH</th>
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
	// method yang pertama dipanggil saat page diload
	$(function() {
		// memanggil method load data
		loadData();
	});
	//method loadData
	function loadData() {
		$
				.ajax({
					// url ke api/role/
					url : '${contextName}/api/class/',
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
													+ item.batchId
													+ '</td>'
													+ '<td class="col-md-1">'
													+ '<div class="dropdown">'
													+ '<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'
													+ '<ul class="dropdown-menu">'
													+ '<li id="btn-delete" value="'+ item.id +'"><a>Delete</a></li> '
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
		$.ajax({
			url : '${contextName}/api/class/' + dataId,
			type : 'get',
			dataType : 'json',
			success : function(dataApi) {
				$('#modal-data').find('#id').val(dataApi.id);
				$('#modal-data').find('#batchId').val(dataApi.batchId);
				$('#modal-data').find('#biodataId').val(dataApi.biodataId);
				$('#modal-data').find('#createdBy').val(dataApi.createdBy);
				$('#modal-data').find('#createdOn').val(dataApi.createdOn);
				console.log(dataApi);
			}
		});
	}
	//btn-delete di click
	$('#list-data').on('click', '#btn-delete', function() {
		var vid = $(this).val();
		$.ajax({
			url : '${contextName}/class/delete',
			type : 'get',
			dataType : 'html',
			success : function(result) {
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
	function deleteData($form) {
		// memangil method getFormData dari file
		var vid = $form.find("#id").val();
		$.ajax({
			// url ke api/trainer/
			url : '${contextName}/api/class/' + vid,
			// method http di controller
			type : 'delete',
			// data type berupa JSON
			dataType : 'json',
			// jika sukses
			success : function(result) {
				//menutup modal
				$("#modal-form").modal('hide');
				// panggil method load data, untuk melihat data terbaru
				loadData();
				console.log(result);
			}
		});
	}
	
	function search(){
		var item = $('#search').val();
		$.ajax({
			url: '${contextName}/api/class/search/' + item,
			type: 'get',
			dataType: 'json',
			success: function(result){
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
					var dataRow = '<tr>'
						+ '<td>'
						+ item.batchId
						+ '</td>'
						+ '<td class="col-md-1">'
						+ '<div class="dropdown">'
						+ '<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-align-justify"></i><span class="caret"></span></button>'
						+ '<ul class="dropdown-menu">'
						+ '<li id="btn-delete" value="'+ item.id +'"><a>Delete</a></li> '
						+ '</ul>' + '</div>'
						+ '</td>' + '</tr>';
					$("#list-data").append(dataRow);
				});
				console.log(result);
			}
		});
	}
	
</script>