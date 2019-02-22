
<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>

<form action="#" method="get">	
</form>
<br>

<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">List Class</h3>
	</div>
	<div class="box-body">
		<div class="box-tools col-md-12">
			<input type="input" name="search" id="search"/>
			<button type="button" class="btn btn-primary btn-sm" id="btn-search">
				<i class="fa fa-circle"></i>
			</button>
		</div>
		<br>
		<table class="table">
			<thead>
				<tr>
					<th>Batch</th>
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
	//method yang pertama kali dipanggil saat page di load
	$(function() {
		// memanggil method loadData;
		loadData();
	});

	//ketika button add di click
	$('#btn-add').click(function() {
		$.ajax({
			url : '$(contextName)/class/create',
			type : 'get',
			dataType : 'html',
			success : function(result) {
				//mengganti judul modal
				$("#modal-title").html("Add Class");
				//mengisi content dengan variable result
				$("#modal-data").html(result);
				//menampilkan modal pop up
				$("#modal-form").modal('show');
			}
		});
	});

	//method loadData
	function loadData() {
		$
				.ajax({
					// url ke api/package/
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
													+ '<td>'
													+ item.name
													+ '</td>'
													+ '<td class="col-md-1">'
													+ '<button type="button" class="btn btn-edit btn-warning btn-xs" value="'+ item.id +'"><i class="fa fa-edit"></i></button> '
													+ '<button type="button" class="btn btn-delete btn-danger btn-xs" value="'+ item.id +'"><i class="fa fa-trash"></i></button> '
													+ '</td>' + '</tr>';
											$("#list-data").append(dataRow); //munculkan tabel di list data
										});
						// menampilkan data ke console => F12
						console.log(result);
					}
				});
	}
</script>