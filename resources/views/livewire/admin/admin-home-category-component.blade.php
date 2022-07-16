<div>

    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Manage Home Categories
                    </div>
                    <div class="panel-body">
                        @if (Session::has('msg'))
                        <div class="alert alert-success" role="alert">{{ Session::get('msg') }}</div>
                            
                        @endif
                        <form class="form-horizontal"  wire:submit.prevent="updateHomeCategory">
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Choose Categories</label>
                                <div class="col-md-4" wire:ignore>
                                   <select class="sel_categories form-control" name="categories[]" multiple="multiple" wire:model="selected_categories">
                                    <option value="">Select Category</option>
                                       @foreach ($categories as $category)
                                           <option value="{{ $category->id }}">{{ $category->name }}</option>
                                       @endforeach
                                   </select>
                                </div>
                            </div>
                            <div class="form-group">
                                    <label class="col-md-4 control-lebel">No of Products</label>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control input-md" wire:model="numberofproducts">
                                    </div>
                            </div>
                          
                            <div class="form-group">
                                <label class="col-md-4 control-lebel"></label>
                                <div class="col-md-4">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </div>
                        </form>
                     
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>

@push('scripts')
<script>
    $(document).ready(function(){

        $('.sel_categories').select2();
        $('.sel_categories').on('change',function(e){
            var data=$('.sel_categories').select2("val");
            @this.set('selected_categories',data)
        });
    });
</script>
    
@endpush
