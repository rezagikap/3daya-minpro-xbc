<!-- form mulai -->
<form id="form-delete" class="form-horizontal">

	<br>
	<h3>
		<center>
			<b>Are you sure to delete this data ?</b>
		</center>
	</h3>
	<br><br>

	<input type="hidden" class="form-control" name="id"id="id" />
	<input type="hidden" class="form-control" name="name"id="name" />
	<input type="hidden" class="form-control" name="gender"id="gender" />
	<input type="hidden" class="form-control" name="lastEducation"id="lastEducation" />
	<input type="hidden" class="form-control" name="graduationYear"id="graduationYear" />
	<input type="hidden" class="form-control" name="educationalLevel"id="educationalLevel" />
	<input type="hidden" class="form-control" name="majors"id="majors" />
	<input type="hidden" class="form-control" name="gpa"id="gpa" />
	<input type="hidden" class="form-control" name="bootcampTestType"id="bootcampTestType" />
	<input type="hidden" class="form-control" name="iq"id="iq" />
	<input type="hidden" class="form-control" name="du"id="du" />
	<input type="hidden" class="form-control" name="arithmetic"id="arithmetic" />
	<input type="hidden" class="form-control" name="nestedLogic"id="nestedLogic" />
	<input type="hidden" class="form-control" name="joinTable"id="joinTable" />
	<input type="hidden" class="form-control" name="tro"id="tro" />
	<input type="hidden" class="form-control" name="notes"id="notes" />
	<input type="hidden" class="form-control" name="interviewer"id="interviewer" />
	<input type="hidden" class="form-control" name="createdBy" id="createdBy"/>
	<input type="hidden" class="form-control" name="createdOn"id="createdOn" />
	<input type="hidden" class="form-control" name="modifiedBy" id="modifiedBy"/>
	<input type="hidden" class="form-control" name="modifiedOn"id="modifiedOn" />
	<input type="hidden" class="form-control" name="deletedBy" id="deletedBy"/>
	<input type="hidden" class="form-control" name="deletedOn"id="deletedOn" />
	<input type="hidden" class="form-control" name="isDelete" id="isDelete" value=true/>
	
	<div class="modal-footer">
		<button type="button" class="btn btn-danger pull-left"
			data-dismiss="modal">No</button>
		<button type="button" class="btn btn-success"
			onClick="deleteData($('#form-delete'))">Yes</button>
	</div>
</form>
<!-- Form Selesai -->