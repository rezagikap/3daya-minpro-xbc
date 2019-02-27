
<%
	request.setAttribute("contextName", request.getServletContext().getContextPath());
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- form mulai -->
<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="tech[name]" placeholder="Name" id="name"/>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<textarea class="form-control" name="tech[notes]" placeholder="Notes" style="resize: none" id="notes" />
		</div>
	</div>
		 
		<input type="hidden" class="form-control" name="tech[createdBy]" value="1" id="createdBy" /> 
		<input type="hidden" class="form-control" name="tech[createdOn]"  id="createdOn" />
		<input type="hidden" class="form-control" name="tech[isDelete]" value="false" id="isDelete" />

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
					<th>NAME</th>
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