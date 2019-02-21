
<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>

<form action="#" method="get">
	<div class="input-group">
		<input type="text" name="searchData" class="form-control"
			placeholder="Search Menu..."> <span class="input-group-btn">
			<button type="submit" name="search" id="search-btn"
				class="btn btn-flat">
				<i class="fa fa-search"></i>
			</button>
		</span>
	</div>
</form>
<br>

<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">List Menu</h3>

		<div class="box-tools">
			<button type="button" id="btn-add" class="btn btn-success btn-sm">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	<div class="box-body">
		<form action="#" method="get">
			<div class="input-group">
				<input type="text" name="searchData" class="form-control"
					placeholder="Search Menu..."> <span class="input-group-btn">
					<button type="submit" name="search" id="search-btn"
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<br>
		<table class="table">
			<thead>
				<tr>
					<th>Code</th>
					<th>Title</th>
					<th>Menu Parent</th>
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
			url : '$(contextName)/menu/create',
			type : 'get',
			dataType : 'html',
			success : function(result) {
				//mengganti judul modal
				$("#modal-title").html("Add Menu");
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
					url : '${contextName}/api/menu/',
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
													+ item.title
													+ '</td>'
													+ '<td>'
													+ item.menuParent
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