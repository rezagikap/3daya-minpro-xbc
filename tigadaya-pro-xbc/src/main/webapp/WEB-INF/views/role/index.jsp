<%request.setAttribute("contextName", request.getServletContext().getContextPath());%>

	<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">List Role</h3>
		<div class="box-tools">
			<button type="button" id="btn-add" class="btn btn-success btn-sm">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	<div class="box-body">
		<table class="table">
			<thead>
				<tr>
					<th>Code</th>
					<th>Name</th>		
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
	$(function(){
		// memanggil method loadData;
		loadData();
	});
	
	//ketika button add di click
	$("#btn-add").click(function(){
		$.ajax({
			url:'${contextName}/role/create',
			type:'get',
			dataType:'html',
			success : function(result){
				//mengganti judul modal
				$("#modal-title").html("Add New role");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-form").modal('show');
			}
		});
	});
	
	//method loadData
	function loadData(){
		$.ajax({
			// url ke api/role/
			url:'${contextName}/api/role/',
			type:'get',
			// data type berupa JSON
			dataType:'json',
			success : function(result){
				//kosong data di table
				$("#list-data").empty();
				// looping data dengan jQuery
				$.each(result, function(index, item){
					var dataRow ='<tr>'+
						'<td>'+ item.code +'</td>'+
						'<td>'+ item.name+'</td>'+
						'<td class="col-md-1">'+
						'<div class="dropdown">'+
							'<button type="button" class="btn btn-primary dropdown-toggle"><i class="fa fa-edit"></i><span class="caret"></button> '+
							'<ul class="dropdown-menu">'+
								'<li><a href="#">Edit</a></li>'+
								'<li><a href="#">Delete</a></li>'+
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
	
	
</script>