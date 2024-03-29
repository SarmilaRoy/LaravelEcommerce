<div>

    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-6">
                                Add New Product
                            </div>
                            <div class="col-md-6">
                                <a href="{{ route('admin.products') }}" class="btn btn-success pull-right">All
                                    Product</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        @if (Session::has('msg'))
                            <div class="alert alert-success" role="alert">{{ Session::get('msg') }}</div>
                        @endif
                        <form class="form-horizontal" enctype="multipart/form-data" wire:submit.prevent="addProduct">
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Product Name</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Product Name" class="form-control input-md"
                                        wire:model="name" wire:keyup="generateSlug">
                                    @error('name')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Product Slug</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Product Slug" class="form-control input-md"
                                        wire:model="slug">
                                    @error('slug')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Short Description</label>
                                <div class="col-md-4" wire:ignore>
                                    <textarea class="form-control" id="short_description" placeholder="Short Description" wire:model="short_description"></textarea>
                                    @error('short_description')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel"> Description</label>
                                <div class="col-md-4" wire:ignore>
                                    <textarea class="form-control" id="description" placeholder="Description" wire:model="description"></textarea>
                                    @error('description')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Regular Price</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Regular Price" class="form-control input-md"
                                        wire:model="regular_price">
                                    @error('regular_price')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Sale Price</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Sale Price" class="form-control input-md"
                                        wire:model="sale_price">
                                    @error('sale_price')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">SKU</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="SKU" class="form-control input-md"
                                        wire:model="SKU">
                                    @error('SKU')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Stock</label>
                                <div class="col-md-4">
                                    <select class="form-control" wire:model="stock_status">
                                        <option value="instock">InStock</option>
                                        <option value="outofstock">Out of Stock</option>
                                    </select>
                                    @error('stock_status')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Featured</label>
                                <div class="col-md-4">
                                    <select class="form-control" wire:model="featured">
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                    @error('featured')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Quantity</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Quantity" class="form-control input-md"
                                        wire:model="quantity">
                                    @error('quantity')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Product Image</label>
                                <div class="col-md-4">
                                    <input type="file" class="input-file" wire:model="image">
                                    @if ($image)
                                        <img src="{{ $image->temporaryUrl() }}" width="120" />
                                    @endif
                                    @error('image')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Product Gallary</label>
                                <div class="col-md-4">
                                    <input type="file" class="input-file" wire:model="images" multiple>
                                    @if ($images)
                                        @foreach ($images as $image)
                                            <img src="{{ $image->temporaryUrl() }}" width="120" />
                                        @endforeach
                                    @endif
                                    @error('images')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Category</label>
                                <div class="col-md-4">
                                    <select class="form-control" wire:model="category_id"
                                        wire:change="changeSubCategory">
                                        <option value="">Select Category</option>
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                                        @endforeach
                                    </select>
                                    @error('category_id')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Sub Category</label>
                                <div class="col-md-4">
                                    <select class="form-control" wire:model="scategory_id">
                                        <option value="0">Select Sub Category</option>
                                        @foreach ($scategories as $scategory)
                                            <option value="{{ $scategory->id }}">{{ $scategory->name }}</option>
                                        @endforeach
                                    </select>
                                    @error('scategory_id')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Product Attribute</label>
                                <div class="col-md-4">
                                    <select class="form-control" wire:model="attr">
                                        <option value="0">Select Attribute</option>
                                        
                                        @foreach ($pattributes as $pattribute)
                                            <option selected="selected" value="{{ $pattribute->id }}">{{ $pattribute->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-1">
                                    
                                    <button type="button" class="btn btn-info"
                                        wire:click.prevent="add"><i class="fa fa-plus"></i></button>
                                </div>
                            </div>

                            @foreach ($inputs as $key => $value)
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">{{ $pattributes->where('id',$attribute_arr[$key])->first()->name }}</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="{{ $pattributes->where('id',$attribute_arr[$key])->first()->name }}" class="form-control input-md"
                                        wire:model="attribute_values.{{$value}}">
                                </div>
                                <div class="col-md-1">
                                    <button type="button" class="btn btn-danger btn-sm"
                                        wire:click.prevent="remove({{ $key }})"><i class="fa fa-close"></i></button>
                                </div>
                            </div>
                            @endforeach


                            <div class="form-group">
                                <label class="col-md-4 control-lebel"></label>
                                <div class="col-md-4">
                                    <button type="submit" class="btn btn-primary">Submit</button>
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
        $(function() {
            tinymce.init({
                selector: '#short_description',
                setup: function(editor) {
                    editor.on('Change', function(e) {
                        tinyMCE.triggerSave();
                        var sd_data = $('#short_description').val();
                        @this.set('short_description', sd_data);
                    });
                }
            });
            tinymce.init({
                selector: '#description',
                setup: function(editor) {
                    editor.on('Change', function(e) {
                        tinyMCE.triggerSave();
                        var d_data = $('#description').val();
                        @this.set('description', d_data);
                    });
                }
            });

        });
    </script>
@endpush
