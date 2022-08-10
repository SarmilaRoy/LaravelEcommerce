<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Setting
                    </div>

                    <div class="panel-body">
                        @if (Session::has('msg'))
                        <div class="alert alert-success" role="alert">{{ Session::get('msg') }}</div>
                            
                        @endif
                        <form class="form-horizontal"  wire:submit.prevent="saveSetting">
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Email</label>
                                <div class="col-md-4">
                                    <input type="email" placeholder="Email"
                                        class="form-control input-md" wire:model="email">
                                        @error('email')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Phone</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Phone"
                                        class="form-control input-md" wire:model="phone">
                                        @error('phone')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Phone2</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Phone2"
                                        class="form-control input-md" wire:model="phone2">
                                        @error('phone2')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Address</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Address"
                                        class="form-control input-md" wire:model="address">
                                        @error('address')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Map</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Map"
                                        class="form-control input-md" wire:model="map">
                                        @error('map')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Twiter</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Twiter"
                                        class="form-control input-md" wire:model="twiter">
                                        @error('twiter')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Facebook</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Twiter"
                                        class="form-control input-md" wire:model="facebook">
                                        @error('facebook')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Pinterest</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Pinterest"
                                        class="form-control input-md" wire:model="pinterest">
                                        @error('pinterest')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Instagram</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Instagram"
                                        class="form-control input-md" wire:model="instagram">
                                        @error('instagram')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Youtube</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Youtube"
                                        class="form-control input-md" wire:model="youtube">
                                        @error('youtube')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

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
