<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Change Password
                    </div>

                    <div class="panel-body">
                        @if (Session::has('pass_change_msg'))
                        <div class="alert alert-success" role="alert">{{ Session::get('pass_change_msg') }}</div>
                            
                        @endif

                        @if (Session::has('pass_error'))
                        <div class="alert alert-danger" role="alert">{{ Session::get('pass_error') }}</div>
                            
                        @endif

                        <form class="form-horizontal" wire:submit.prevent="chagePassword">
                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Current Password</label>
                                <div class="col-md-4">
                                    <input type="password" name="current_password" placeholder="Current Password"
                                        class="form-control input-md" wire:model="current_password">
                                    @error('current_password')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-lebel">New Password</label>
                                <div class="col-md-4">
                                    <input type="password" name="password" placeholder="New Password"
                                        class="form-control input-md" wire:model="password">
                                    @error('password')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-lebel">Confirm Password</label>
                                <div class="col-md-4">
                                    <input type="password" name="password_confirmation" placeholder="Confirm Password"
                                        class="form-control input-md" wire:model="password_confirmation">
                                    @error('password_confirmation')
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
