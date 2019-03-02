<!-- Form Add Mulai // Reza Agika Putra // XBC-2-->
<form id="form-edit" class="form-horizontal">

	<div class="row">
	
		<div class="col-md-6">
			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Name</label> <input type="text"
						class="form-control" name="name" id="name" placeholder="Name" value="${get.name }" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Last Education</label> <input type="text"
						class="form-control" name="lastEducation" id="lastEducation" placeholder="Last Education" />
				</div>
			</div>
	
			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Educational Level</label> <input type="text"
						class="form-control" name="educationalLevel" id="educationalLevel" placeholder="Educational Level" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Graduation Year</label> <input type="text"
						class="form-control" name="graduationYear" id="graduationYear" placeholder="Graduation Year" />
				</div>
			</div>
	
			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Majors</label> <input type="text"
						class="form-control" name="majors" id="majors" placeholder="Majors" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">GPA</label> <input type="text"
						class="form-control" name="gpa" id="gpa" placeholder="GPA" />
				</div>
			</div>
		</div>
		
		<div class="col-md-6">
			
			<div class="form-group">
				<!--  <div class="col-md-12">-->
					<label class="control-label">Gender</label>
					<div class="col-md-12">
						<label class="radio-inline">
						<input type="radio" name="gender" id="gender" value="male"/>Male</label>
						<label class="radio-inline">
						<input type="radio" name="gender" id="gender" value="female"/>Female</label>
					</div>
				<!--  </div> -->
			</div>
			
			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Bootcamp Test Type</label>
					<select name="bootcampTestType" class="form-control" id="bootcampTestType">
						<option value="">-Choose Bootcamp Test Type-</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<div class="col-md-12">
							<label class="control-label">IQ</label>
							<input type="text" class="form-control" name="iq" id="iq" placeholder="IQ" />
						</div>
					</div>
					
					<div class="col-md-3">
						<div class="col-md-12">
							<label class="control-label">DU</label>
								<input type="text" class="form-control" name="du" id="du" placeholder="DU" />
						</div>
					</div>
					
					<div class="col-md-3">
						<div class="col-md-12">
							<label class="control-label">NL</label> <input type="text"
								class="form-control" name="nestedLogic" id="nestedLogic" placeholder="NL" />
						</div>
					</div>
					
					<div class="col-md-3">
						<div class="col-md-12">
							<label class="control-label">JT</label> <input type="text"
								class="form-control" name="joinTable" id="joinTable" placeholder="JT" />
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Arithmetic</label> <input type="text"
						class="form-control" name="arithmetic" id="arithmetic" placeholder="Arithmetic" />
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">TRO</label> <input type="text"
						class="form-control" name="tro" id="tro" placeholder="TRO" />
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-md-12">
					<label class="control-label">Interviewer</label> <input type="text"
						class="form-control" name="interviewer" id="interviewer" placeholder="Interviewer" />
				</div>
			</div>
			
		</div>
	
	</div>
	<div class="form-group">
		<div class="col-md-12">
			<label class="control-label">Notes</label>
			<textarea class="form-control" name="notes" id="notes" style="resize:none" rows="5" placeholder="Notes"></textarea>
		</div>
	</div>
	
	<input type="hidden" class="form-control" name="id"id="id"/>
	<input type="hidden" class="form-control" name="createdBy" value="1" />
	<input type="hidden" class="form-control" name="createdOn"id="createdOn" />
	<input type="hidden" class="form-control" name="modifiedBy" value="1" />
	<input type="hidden" class="form-control" name="modifiedOn"id="modifiedOn" />
	<input type="hidden" class="form-control" name="deletedBy" value="1" />
	<input type="hidden" class="form-control" name="deletedOn"id="deletedOn" />
	<input type="hidden" class="form-control" name="isDelete" value="false" />
	
	<div class="modal-footer">
		<button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		<button type="button" onClick="editData($('#form-edit'))" class="btn btn-warning">Save</button>
	</div>

</form>
<!-- Form Add Selesai // Reza Agika Putra // XBC-2-->