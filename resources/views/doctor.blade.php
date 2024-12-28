@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row mt-5">
            <div class="col-md-10 m-auto ">
                <div class="card">
                    <div class="card-header">
                        {{ __('language.DOCTORS') }}
                    </div>
                    <div class="card-body ">
                        <div class="d-flex align-items-center justify-content-between">
                            <a href="{{ route('createdoctor') }}"
                                class="btn btn-success mt-2">{{ __('language.CREATEDOCTORACCOUNT') }}</a>
                            <form action={{ route('searchdoc') }} method="get">
                                <div class="input-group">
                                    <input type="search" name="search" class="form-control">
                                    <span class="input-group-prepend">
                                        <button type="submit" class="btn btn-primary">Search</button>
                                    </span>
                                </div>
                            </form>
                        </div>
                        @if (session('message'))
                            <h4 class="alert alert-success mt-2">{{ session('message') }}</h4>
                        @endif

                        <table class="table table-dark mt-3">
                            <thead>
                                <tr>
                                    <td>{{ __('language.ID') }}</td>
                                    <td>{{ __('language.NAME') }}</td>
                                    <td>{{ __('language.DEPARTMENT') }}</td>
                                    <td>{{ __('language.CONSULTANCYFEES') }}</td>
                                    <td>{{ __('language.DAYS') }}</td>
                                    <td>{{ __('language.TIME') }}</td>
                                    <td>{{ __('language.PHONE') }}</td>
                                    <td>{{ __('language.ACTION') }}</td>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($data as $item)
                                    <tr>
                                        <td>{{ $item->id }}</td>
                                        <td>{{ $item->name }}</td>
                                        <td>{{ $item->department }}</td>
                                        <td>{{ $item->Consultancyfees }}</td>
                                        <td>{{ $item->days }}</td>
                                        <td>{{ $item->time }}</td>
                                        <td>{{ $item->phone }}</td>
                                        <td>
                                            <a href="{{ route('showdoctor', $item->id) }}" class="btn btn-success"><i
                                                    class="fa-solid fa-eye"></i></a>
                                            <a href="{{ route('editdoctor', $item->id) }}" class="btn btn-primary"><i
                                                    class="fa-solid fa-pen-to-square"></i></a>
                                            <a href="{{ route('deletedoctor', $item->id) }}" class="btn btn-danger"><i
                                                    class="fa-solid fa-trash"></i></a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        {{ $data->links() }} <!-- Display pagination links -->
                    </div>
                </div>
            </div>
        </div>
    @endsection
