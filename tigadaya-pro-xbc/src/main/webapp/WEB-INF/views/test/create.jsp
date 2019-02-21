<% request.setAttribute("contextName", request.getServletContext().getContextPath()); %>
<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-md-2"> NAME</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" placeholder="Name"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-md-2"> CREATED BY</label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="createdBy" placeholder="Created By"/>
		</div>
	</div>
	
	<div class="modal-footer">
		<button type="button" onClick="addData($('#form-create'))" class="btn btn-primary"><i class="fa fa-save"></i></button>
		<button type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-reply"></i></button>
	</div>

</form>