<% request.setAttribute("contextName", request.getServletContext().getContextPath());%>
<div class="box box-info">
	<div class="box-header with-border">
		<h3 class="box-title">BOOTCAMP TES TYPE</h3>
		<div class="box-tools">
			<button type="button" class="btn btn-primary btn-sm" id="btn-add">
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
		// method pertama saat load
		$(function() {
			// memanggil methoad load data
			loadData();
		});
			
		$("#btn-add").click(function() {
			var d = new Date($.now());
			$.ajax({
				url : '${contextName}/bootcamptesttype/create',
				type : 'get',
				dataType : 'html',
				success : function(result){
					// mengganti judul modal
					$("#modal-title").html("BOOTCAMP TES TYPE");
					// mengisi content dengan variable result
					$("#modal-data").html(result);
					// menampilkan modal pop up
					$("#modal-form").modal('show');
					$('#createdOn').val(d.getDate()+"-"+d.getMonth()+"-"+d.getFullYear()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
				}
			});
		});
		
		// method loadData
		function loadData(){
			$.ajax({
				// url ke api/bootcamptesttype/
				url : '${contextName}/api/bootcamptesttype/',
				type : 'get',
				dataType : 'json',
				success : function(result){
					// kosong data di table
					$("#list-data").empty();
					// looping data dengan jQuery
					$.each(result, function(index, item){
						var dataRow = '<tr>'+ 
						'<td>'+ item.name+ '</td>'+ 
						'<td>'+ item.createdBy+ '</td>'+ 
						'<td class="col-md-1">'+ 
						'<button type="button" class="btn btn-edit btn-warning btn-sm" value="'+ item.id +'"><i class="fa fa-align-justify"></i></button> '+
						'</td>' +
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
				// url ke api/bootcamptesttype/
				url : '${contextName}/api/bootcamptesttype/',
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
				url : '${contextName}/api/bootcamptesttype/' + dataId,
				type : 'get',
				dataType : 'json',
				success : function(dataApi) {
					$('#modal-data').find('#id').val(dataApi.id);
					$('#modal-data').find('#name').val(dataApi.name);
					$('#modal-data').find('#createdBy').val(dataApi.createdBy);

					console.log(dataApi);
				}
			});
		}
		
		
		
		
</script>