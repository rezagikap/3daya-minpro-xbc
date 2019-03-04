<!-- form mulai -->
<form id="form-create" class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<input type="text" class="form-control" name="name" minlength="5" required="" arial-required="true" placeholder="Name" required id="name"/>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-1"></label>
		<div class="col-md-10">
			<textarea  class="form-control" name="notes" minlength="5" required="" arial-required="true" placeholder="Notes" style="resize:none" required id="notes"/>
		</div>
	</div>
	<input type="hidden" class="form-control" name="createdBy" value="1"/>
	
	<input type="hidden" class="form-control" name="createdOn" id="createdOn"/>
	
	<input type="hidden" class="form-control" name="isDelete" value="false"/>
	
	<div class="modal-footer">
		<button type="button" class="btn btn-warning" style = "position:relative;right:160px;top:2px;" data-dismiss="modal">CANCEL</button>
		<button type="button" onClick="addData($('#form-create'))" class="btn btn-warning" style = "position:relative;right:35px;top:2px;">SAVE</button>
	</div>
</form>
<!-- Form Selesai -->

<script>
$("#form-create").validate({
	rules:{
		name:{
			required: true,
			minlength:5
		},
		notes:{
			required: true,
			minlength:5
		},
		message:{
			name:{
				required: "done",
				minlength:"done"
			},
			notes:{
				required :"done",
				minlength:"done"
			}
		}
	}
});
	
</script>