<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="data" items="${mp }">
	<tr>
		<td class="col-md-3">${data.code }</td>
		<td class="col-md-4">${data.title }</td>
		<td class="col-md-4">${data.parents.title }</td>
		<td class="col-md-1">
			<div class="dropdown">
				<button class="btn btn-warning dropdown-toggle" type="button"
					data-toggle="dropdown">
					<i class="fa fa-align-justify"></i><span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li id="btn-edit" value="${data.id}"><a>Edit</a></li>
					<li id="btn-delete" value="${data.id}"><a>Delete</a></li>
				</ul>
			</div>
		</td>
	<tr>
</c:forEach>

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
//function get data 
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

//btn-edit di click
$('#btn-edit').click(function() {
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

//method untuk edit data
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
</script>