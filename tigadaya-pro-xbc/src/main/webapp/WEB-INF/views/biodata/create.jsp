<!-- Form Add Mulai // Reza Agika Putra // XBC-2-->
<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<div class="col-md-12">
			<label class="control-label">Name</label> <input type="text"
				class="form-control" name="name" placeholder="Name" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-12">
			<label class="control-label">Last Education</label> <input type="text"
				class="form-control" name="lastEducation" placeholder="Last Education" />
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-md-12">
			<label class="control-label">Educational Level</label> <input type="text"
				class="form-control" name="educationalLevel" placeholder="Educational Level" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-12">
			<label class="control-label">Graduation Year</label> <input type="text"
				class="form-control" name="graduationYear" placeholder="graduationYear" />
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-md-12">
			<label class="control-label">Majors</label> <input type="text"
				class="form-control" name="majors" placeholder="Majors" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-12">
			<label class="control-label">GPA</label> <input type="text"
				class="form-control" name="gpa" placeholder="GPA" />
		</div>
	</div>
	
	<!-- untuk data yang tidak perlu diinput secara manual -->
	<input type="hidden" class="form-control" name="gender" id="gender" />
	<input type="hidden" class="form-control" name="bootcampTestType" value="1" />
	<input type="hidden" class="form-control" name="iq" id="iq" />
	<input type="hidden" class="form-control" name="du" id="du" />
	<input type="hidden" class="form-control" name="arithmetic" id="arithmetic" />
	<input type="hidden" class="form-control" name="nestedLogic" id="nestedLogic"  />
	<input type="hidden" class="form-control" name="joinTable" id="joinTable"  />
	<input type="hidden" class="form-control" name="tro" id="tro" />
	<input type="hidden" class="form-control" name="notes" id="notes" />
	<input type="hidden" class="form-control" name="interviewer" id="interviewer" />
	<input type="hidden" class="form-control" name="createdBy" id="createdBy" value=1  />
	<input type="hidden" class="form-control" name="createdOn" id="createdOn" />
	<input type="hidden" class="form-control" name="modifiedBy" id="modifiedBy" />
	<input type="hidden" class="form-control" name="modifiedOn" id="modifiedOn" />
	<input type="hidden" class="form-control" name="deletedBy" id="deletedBy" />
	<input type="hidden" class="form-control" name="deletedOn" id="deletedOn" />
	<input type="hidden" class="form-control" name="isDelete" id="isDelete" value="true" />
	
	<!-- untuk footer berupa tombol save dan cancel -->
	<div class="modal-footer">
		<button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		<button type="button" class="btn btn-warning" onClick="addData($('#form-create'))">	Save</button>
	</div>
	
</form>
<!-- Form Add Selesai // Reza Agika Putra // XBC-2-->