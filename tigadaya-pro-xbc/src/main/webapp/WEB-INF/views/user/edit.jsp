<!-- form mulai -->
<form id="form-edit" class="form-horizontal">
	<!-- id -->
	<input type="hidden" name="id" id="id" />

	<!-- Role Id -->
	<div class="form-group">
		<div class="col-md-10">
			<select name="po[roleId]" id="roleId" class="form-control">
				<option value="1">Choose Role</option>
			</select>
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-8">
			<input type="text" class="form-control" name="email" id="email" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-8">
			<input type="text" class="form-control" name="username" id="username" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-8">
			<input type="text" class="form-control" name="password" id="password"/>
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-8"> Mobile Flag
			<label class= "radio-inline"> <input type="radio" name="mobileFlag"
				value="Pria">True
			</label> <label class="radio-inline"> <input type="radio" name="mobileFlag"
				value="Wanita">False
			</label>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-md-8">
			<input type="text" class="form-control" name="mobileToken" id="mobileToken" placeholder="Mobile Token"/>
		</div>
	</div>

	<div class="modal-footer">
		<button type="button" class="btn btn-success pull-left"
			onClick="editData($('#form-edit'))">Update</button>
		<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
	</div>
</form>
<!-- Form Selesai -->