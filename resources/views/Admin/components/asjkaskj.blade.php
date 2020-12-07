<td></td>
<td><select class="form-control SUP medicine" id="medicine" name="medicine" required>
		<option value="">Select Medicine</option>
		@foreach($medicines as $medicine)
		<option value="{{ $medicine->id }}">
		    {{ $medicine->name }} ( {{ $medicine->barcode}} )
		</option>
		@endforeach
	</select>
</td>
<td>
	<input class="Expiry text-center form-control"type="date" title=""value=""style="width: ; border: hidden;">
</td>
<td>
	<input class="Batch text-center form-control" type="text" title=""value=""style="width: ; bor der: hidden;">
</td>
<td>
	<input class="iTEmQty text-center form-control" type="float" title="" value="" min="0" style="width: ; bor der: hidden;">
</td>
<td>
	<input class="iTEmQty text-center form-control" type="float" title="" value="" min="0" style="width: ; bor der: hidden;">
</td>
<td></td>
<td>
	<a class="btn btn-danger btn-xs ibtnDel"> <i class="fa fa-remove"></i></a>
</td>