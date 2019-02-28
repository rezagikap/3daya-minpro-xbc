
<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- form mulai -->
<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="tech[name]" placeholder="Name"/>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<textarea class="form-control" name="tech[notes]" placeholder="Notes" style="resize: none" />
		</div>
	</div>
		 
		
	<br>


	<hr width="80%" color="red">

	<br>
	<button type="button" class="btn btn-warning"
		style="position: relative; left: 435px;" onClick="addTrainer()" id="btn-trainer">+TRAINER</button>
		<br><br>

	<div class="box-body">
		<table class="control-table col-md-10" border="1">
		<div class="col-md-1">
			<thead>
				<tr>
					<th style="position: relative; left: 17px;"> NAME</th>
					<th class="col-md-1">#</th>
				</tr>
			</thead>
			<tbody id="list-train">
			</tbody>
		</table>
	</div>
	<br> <br>



	<div class="modal-footer">
		<button type="button" class="btn btn-warning"
			style="position: relative; right: 160px;" data-dismiss="modal">CANCEL</button>
		<button type="button" onClick="addData($('#form-create'))" class="btn btn-warning" style="position: relative; right: 35px;">SAVE</button>
	</div>
</form>
<!-- Form Selesai -->

<script>
	$("#btn-trainer").click(function() {
		$.ajax({
			url : '${contextName}/technology/trainer',
			type : 'get',
			dataType : 'html',
			success : function(hasil) {
				//mengganti judul modal
				$("#modal-title1").html("TRAINER");
				//mengisi content dengan variable result
				$("#modal-datrain").html(hasil);
				//menampilkan modal pop up
				$("#modal-tech").modal('show');
				loadTrainer($("#modal-datrain"), 0);


			}
		});
	});

	// load data untuk choose trainer dropdown
	function loadTrainer($form, $selected) {
		$.ajax({
			// url ke api/trainer/
			url : '${contextName}/api/trainer/',
			type : 'get',
			// data type berupa JSON
			dataType : 'json',
			success : function(result) {
				// empty data first
				$form.find("#trainerId").empty();
				$form.find("#trainerId").append(
						'<option value="">-Choose Trainer-</option>');
				// looping data
				$.each(result, function(index, item) {
					if(item.isDelete==false){
					if ($selected == item.id) {
						$form.find("#trainerId").append(
								'<option value="'+ item.id +'" selected="selected">'+ item.name + '</option>');
					} else {
						$form.find("#trainerId").append(
								'<option value="'+ item.id +'"> ' + item.name+ '</option>');
					}
					}
				});
			}
		});
	}

	function addTrainer($tech) {
		var id = $tech.find('#trainerId').val();
		var name = $tech.find('#trainerId option:selected').text();
		//alert('test'+ id + name); membuat alert
		var d = new Date($.now());
		var dataRow = '<tr>'
				+ '<td>'
				+ '<input type="hidden" name="tt[][trainerId]" value="'+id+'" class="form-control trainerId"/>'
				+ '<input type="text" name="tt[][trainerName]" value="'+ name +'" class="form-control name"/>'
				+ '<td><button type="button" class="btn btn-remove btn-sm btn-danger" ><i class="fa fa-trash"></i></button></td>'
		'</td>' + '</tr>';
		// add data to list-detail
		$('#list-train').append(dataRow);
		// hide modal
		
		$("#modal-tech").modal('hide');

	}

	//remove button
	$('#list-train').on('click', '.btn-remove', function() {
		$(this).closest('tr').remove();
	});

	
</script>