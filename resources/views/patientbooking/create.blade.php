@extends("layouts.app")
@section('content')

<div class="container">
    <div class="row">
        <div class="col-md-10 m-auto">
            <form enctype="multipart/form-data" method="post" action="{{route('savebooking')}}">
                @csrf
                <input type="hidden" name="doctor" class="form-control mb-4" value={{$result->name}}>
                <input type="hidden" name="doctoremail" class="form-control mb-4" value={{$result->email}}>
                <input type="hidden" name="department" class="form-control mb-4" value={{$result->department}}>
                <input type="hidden" name="consultancyfees" class="form-control mb-4" value={{$result->Consultancyfees}}>
                <input type="hidden"  name="patientemail" class="form-control mb-4" value="{{Auth::user()->email}}">
               
                <label>{{__('language.NAME')}}</label>
                <input type="text" name="patientname" class="form-control mb-4">
                @error('patientname')
                 <div class="alert alert-danger">{{ $message }}</div>
                @enderror


                <label>{{__('language.AGE')}}</label>
                <input type="text" name="patientage" class="form-control mb-4">
                @error('patientage')
                 <div class="alert alert-danger">{{ $message }}</div>
                @enderror

                <label>{{__('language.PHONE')}}</label>
                <input type="text" name="patientphone" class="form-control mb-4">
                @error('patientphone')
                 <div class="alert alert-danger">{{ $message }}</div>
                @enderror

                <input type="hidden" name="days" class="form-control mb-4" value={{$result->days}}>
                <input type="hidden" name="time" class="form-control mb-4" value={{$result->time}}>
              
                <input type="submit" value='{{__('language.BOOKANAPPOINTMENT')}}' class="form-control btn btn-success">

            </form>
        </div>
    </div>
</div>

@endsection
