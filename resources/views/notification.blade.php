@extends('layouts.app')
@section('content')
    <div class="container">
            <div class="row mt-5">
                <div class="col-md-8 m-auto ">
                    <div class="card">
                        <div class="card-header">
                            <div class="text-center">
                                {{$data}}
                                {{ __('language.NOTIFICATION') }}
                            </div>
                        </div>
                        <div class="card-body ">
                            @if (session('message'))
                                <h4 class="alert alert-success">{{ session('message') }}</h4>
                            @endif
                            <table class="table table-dark ">
                                <thead>
                                    <tr>
                                        <td>{{ __('language.MESSAGE') }}</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($result as $item)
                                        <tr>
                                            <td>{{ $item->message }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            {{ $result->links() }} <!-- Display pagination links -->
                        </div>
                    </div>
                </div>
            </div>
    </div>
@endsection