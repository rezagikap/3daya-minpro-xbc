<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>
<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">LIST USER</h3>
		<div class="box-tools">
			<button type="button" id="btn-add" class="btn btn-primary btn-sm">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	<div class="box-body">
		<table class="table">
			<thead>
				<tr>
					<th>Username</th>
					<th>Role</th>
					<th>E-mail</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody id="list-data">

			</tbody>
		</table>
	</div>
</div>

<div class="modal" id="modal-trainer">
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
$(function(){
	// memanggil method loadData;
	loadData();
});
function loadData(){
		$ajax({
			url:'${contextName}/api/user/',
			type: 'get',
			dataType:'json',
			success: function (result){
				$("#list-data").empty();
				$each(result, function(index, item){
					var dataRow='<tr>'+
					'<td>'+item.username+'</td>'+
					'<td>'+item.role+'</td>'+
					'<td>'+item.email+'</td>'+
					'<td class="col-md-1">'+
					'<button type="button" class="btn btn-edit btn-warning btn-xs" value="'+ item.id +'"><i class="fa fa-edit"></i></button> '+
					'<button type="button" class="btn btn-detail btn-success btn-xs" value="'+ item.id +'"><i class="fa fa-eye"></i></button> '+
					'<button type="button" class="btn btn-delete btn-danger btn-xs" value="'+ item.id +'"><i class="fa fa-trash"></i></button> '+
				'</td>'+
				'</tr>';
			$("#list-data").append(dataRow);
			});
			console.log(result);
		}
	}):
}

//ketika button add di click
$("#btn-add").click(function(){
	$.ajax({
		url:'${contextName}/user/create',
		type:'get',
		dataType:'html',
		success : function(result){
			//mengganti judul modal
			$("#modal-title").html("Add New User");
			//mengisi content dengan variable result
			$("#modal-data").html(result);
			//menampilkan modal pop up
			$("#modal-trainer").modal('show');
		}
	});
});
</script>