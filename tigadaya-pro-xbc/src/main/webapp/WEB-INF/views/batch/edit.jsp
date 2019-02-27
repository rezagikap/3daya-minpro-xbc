<!-- Form Mulai -->
<form id ="form-create" class = "form-horizontal">
	<div class = "box-body">
		<div class = "row">
			<div class = "col-md-6">
				<div class = form-group>
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10">
						<input type ="text" class = "form-control" name = "name" id = "name" placeholder ="Name"/>
					</div>
				</div>
				<div class = "form-group">
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10">
						<input type = "text" class = "form-control" name = technologyId id = "technologyId" placeholder = "Technology"/>
					</div>
				</div>
				<div class = "form-group">
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10">
						<input type = "date" class = "form-control" name = "periodTo" id = "periodTo" placeholder = "Period To"/>
					</div>
				</div>
				<div class = "form-group">
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10"></div>
						<input type = "text" class = "form-control" name = "bootcampTypeId" id = "bootcampTypeId" placeholder = "Bootcamp Type"/>
				</div>
			</div>
			<div class = "col-md-6">
				<div class = "form-group">
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10">
						<input type = "text" class = "form-control" name = "roomId" id ="roomId" placeholder = "Room"/>
					</div>
				</div>
				<div class = "form-group">
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10">
						<input type = "text" class = "form-control" name = "trainerId" id="trainerId" placeholder = "Trainer"/>
					</div>
				</div>
				<div class = "form-group">
					<label class = "control-label col-md-1"></label>
					<div class = "col-md-10">
						<textarea rows = "2" class = "form-control" name = "notes" id = "notes" placeholder = "Notes" style = "resize:none"></textarea>
					</div>
				</div>
			</div>
		</div>
		
		<input type = "hidden" class = "form-control" name = "id" id = "id"/>
		<input type = "hidden" class = "form-control" name = "createdBy" id ="createdBy"/>
		<input type = "hidden" class = "form-control" name = "createdOn" id ="createdOn"/>
		<input type = "hidden" class = "form-control" name = "isDelete" id = "isDelete"/>
	</div>
</form>
<!-- Form Selesai -->