
@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row mt-5">
            <div class="col-md-10 m-auto ">
                <div class="card">
                    <div class="card-header">
                        {{ __('language.PATIENTS') }}
                    </div>
                    <div class="card-body ">
                    <div class="d-flex align-items-center justify-content-between">
                        <a href="{{ route('createpatient') }}"
                            class="btn btn-success mt-2">{{ __('language.CREATENEWPATIENT') }}</a>
                        <form action={{ route('searchpatient') }} method="get">
                            <div class="input-group">
                                <input type="search" name="search" class="form-control">
                                <span class="input-group-prepend">
                                    <button type="submit" class="btn btn-primary">{{ __('language.SEARCH') }}</button>
                                </span>
                            </div>
                        </form>
                    </div>
                        @if (session('message'))
                            <h4 class="alert alert-success">{{ session('message') }}</h4>
                        @endif
                        @if ($data->total() > 0)
                            <table class="table table-dark mt-3">
                                <thead>
                                    <tr>
                                        <td>{{ __('language.ID') }}</td>
                                        <td>{{ __('language.NAME') }}</td>
                                        <td>{{ __('language.GENDER') }}</td>
                                        <td>{{ __('language.AGE') }}</td>
                                        <td>{{ __('language.MEDICALHISTORY') }}</td>
                                        <td>{{ __('language.PHONE') }}</td>
                                        <td>{{ __('language.EMAIL') }}</td>
                                        <td>{{ __('language.ADDRESS') }}</td>
                                        <td>{{ __('language.ACTION') }}</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($data as $item)
                                        <tr>
                                            <td>{{ $item->id }}</td>
                                            <td>{{ $item->name }}</td>
                                            <td>{{ $item->gender }}</td>
                                            <td>{{ $item->age }}</td>
                                            <td>{{ $item->medicalhistory }}</td>
                                            <td>{{ $item->phone }}</td>
                                            <td>{{ $item->email }}</td>
                                            <td>{{ $item->address }}</td>
                                            <td>
                                                <a href="{{ route('editpatient', $item->id) }}" class="btn btn-primary"><i
                                                        class="fa-solid fa-pen-to-square"></i></a>
                                                <a href="{{ route('deletepatient', $item->id) }}" class="btn btn-danger"><i
                                                        class="fa-solid fa-trash"></i></a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            {{ $data->links() }}
                        @else
                            <p class="mt-3"> {{ __('language.PATIENTNOTREGISTERD') }}</p>
                        @endif
                    </div>
                </div>
            </div>
        @endsection
