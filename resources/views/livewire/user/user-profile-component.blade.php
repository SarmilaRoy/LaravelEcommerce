<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Profile
                </div>
                <div class="panel-body">
                    <div class="col-md-4">
                        @if ($user->profile->image)
                        <img src="{{ asset('assets/images/profile') }}/{{ $user->profile->image }}" width="100%">
                        @else
                        <img src="{{ asset('assets/images/profile/female.png') }}" width="100%">
                        @endif
                    </div>
                    <div class="col-md-8">
                        <p><b>Name: </b>{{ $user->name }}</p>
                        <p><b>Email: </b>{{ $user->email }}</p>
                        <p><b>Phone: </b>{{ $user->mobile }}</p>
                        <hr>
                        <p><b>Line1: </b>{{ $user->line1 }}</p>
                        <p><b>Line2: </b>{{ $user->line2 }}</p>
                        <p><b>City: </b>{{ $user->city }}</p>
                        <p><b>Province: </b>{{ $user->province }}</p>
                        <p><b>Country: </b>{{ $user->country }}</p>
                        <p><b>Zipcode: </b>{{ $user->zipcode }}</p>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
