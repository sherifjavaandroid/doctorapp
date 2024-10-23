@php
    $default_lang_code   = language_const()::NOT_REMOVABLE;
    $system_default_lang = get_default_language_code();
    $languages_for_js_use = $languages->toJson();
@endphp

@extends('admin.layouts.master')

@push('css')
    <link rel="stylesheet" href="{{ asset('public/backend/css/fontawesome-iconpicker.min.css') }}">
    <style>
        .fileholder {
            min-height: 374px !important;
        }

        .fileholder-files-view-wrp.accept-single-file .fileholder-single-file-view,.fileholder-files-view-wrp.fileholder-perview-single .fileholder-single-file-view{
            height: 330px !important;
        }
    </style>
@endpush

@section('page-title')
    @include('admin.components.page-title',['title' => __($page_title)])
@endsection

@section('breadcrumb')
    @include('admin.components.breadcrumb',['breadcrumbs' => [
        [
            'name'  => __("Dashboard"),
            'url'   => setRoute("admin.dashboard"),
        ]
    ], 'active' => __("Banner Section")])
@endsection

@section('content')
    <div class="table-area mt-15">
        <div class="table-wrapper">
            <div class="table-header justify-content-end">
                <div class="table-btn-area">
                    <a href="#slider-add" class="btn--base modal-btn"><i class="fas fa-plus me-1"></i> {{ __("Add Slider") }}</a>
                </div>
            </div>
            <div class="table-responsive">
                <table class="custom-table">
                    <thead>
                        <tr>
                            <th></th>
                            <th>{{ __("Heading") }}</th>
                            <th>{{ __("Status") }}</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($data->value->items ?? [] as $key => $item)
                            <tr data-item="{{ json_encode($item) }}">
                                <td>
                                    <ul class="user-list">
                                        <li><img src=" {{ get_image($item->image ?? "","site-section") ?? ""}} " alt="product"></li>
                                    </ul>
                                </td>
                                <td> {{ $item->language->$system_default_lang->heading ?? "" }} </td>
                                <td>
                                    @include('admin.components.form.switcher',[
                                        'name'        => 'banner_status',
                                        'value'       => $item->status,
                                        'options'     => [__('Enable') => 1, __('Disable') => 0],
                                        'onload'      => true,
                                        'data_target' => $item->id,
                                        'permission'  => "admin.setup.sections.banner.status.update",
                                    ])
                                </td>
                                <td>
                                    <button class="btn btn--base edit-modal-button"><i class="las la-pencil-alt"></i></button>
                                    <button class="btn btn--base btn--danger delete-modal-button" ><i class="las la-trash-alt"></i></button>
                                </td>
                            </tr>
                        @empty
                            @include('admin.components.alerts.empty',['colspan' => 4])
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('admin.components.modals.site-section.add-slider-item')

    <div id="slider-edit" class="mfp-hide large">
        <div class="modal-data">
            <div class="modal-header px-0">
                <h5 class="modal-title">{{ __("Edit Slider") }}</h5>
            </div>
            <div class="modal-form-data">
                <form class="modal-form" method="POST" action="{{ setRoute('admin.setup.sections.section.item.update',$slug) }}" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="target" value="{{ old('target') }}">
                    <div class="row mb-10-none mt-3">
                        <div class="language-tab">
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    @foreach ($languages as $item)
                                        <button class="nav-link @if (get_default_language_code() == $item->code) active @endif" id="modal-{{$item->name}}-tab" data-bs-toggle="tab" data-bs-target="#modal-{{$item->name}}" type="button" role="tab" aria-controls="modal-{{ $item->name }}" aria-selected="true">{{ $item->name }}</button>
                                    @endforeach
    
                                </div>
                            </nav>
                            <div class="tab-content" id="nav-tabContent">
                                @foreach ($languages as $item)
                                    @php
                                        $lang_code = $item->code;
                                    @endphp
                                    <div class="tab-pane @if (get_default_language_code() == $item->code) fade show active @endif" id="modal-{{ $item->name }}" role="tabpanel" aria-labelledby="modal-{{$item->name}}-tab">
                                        <div class="form-group">
                                            @include('admin.components.form.input',[
                                                'label'     => __("Heading"),
                                                'name'      => $lang_code . "_heading_edit",
                                                'value'     => old($lang_code . "_heading_edit",$data->value->language->$lang_code->heading ?? "")
                                            ])
                                        </div>
                                        <div class="form-group">
                                            @include('admin.components.form.input',[
                                                'label'     => __("Sub Heading"),
                                                'name'      => $lang_code . "_sub_heading_edit",
                                                'value'     => old($lang_code . "_sub_heading_edit",$data->value->language->$lang_code->sub_heading ?? "")
                                            ])
                                        </div> 
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="form-group">
                            @include('admin.components.form.input-file',[
                                'label'             => __("Image"),
                                'name'              => "image",
                                'class'             => "file-holder",
                                'old_files_path'    => files_asset_path("site-section"),
                                'old_files'         => old("old_image"),
                            ])  
                        </div>
                        <div class="col-xl-12 col-lg-12 form-group d-flex align-items-center justify-content-between mt-4">
                            <button type="button" class="btn btn--danger modal-close">{{ __("Cancel") }}</button>
                            <button type="submit" class="btn btn--base">{{ __("Update") }}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


@endsection
@push('script')

    <script>
        openModalWhenError("slider-add","#slider-add");
        openModalWhenError("slider-edit","#slider-edit");

        var default_language = "{{ $default_lang_code }}";
        var system_default_language = "{{ $system_default_lang }}";
        var languages = "{{ $languages_for_js_use }}";
        languages = JSON.parse(languages.replace(/&quot;/g,'"'));

        $(".edit-modal-button").click(function(){
            var oldData   = JSON.parse($(this).parents("tr").attr("data-item"));
            var editModal = $("#slider-edit");

            // console.log(oldData);

            editModal.find("form").first().find("input[name=target]").val(oldData.id);
            editModal.find("input[name="+default_language+"_heading_edit]").val(oldData.language[default_language].heading);
            editModal.find("input[name="+default_language+"_sub_heading_edit]").val(oldData.language[default_language].sub_heading);
            
            $.each(languages,function(index,item){
                editModal.find("input[name="+item.code+"_heading_edit]").val((oldData.language[item.code] == undefined ) ? '' : oldData.language[item.code].heading);
                editModal.find("input[name="+item.code+"_sub_heading_edit]").val((oldData.language[item.code] == undefined ) ? '' : oldData.language[item.code].sub_heading);
            });
           
            editModal.find("input[name=image]").attr("data-preview-name",oldData.image);
            fileHolderPreviewReInit("#slider-edit input[name=image]");
           
            openModalBySelector("#slider-edit");

        });


        $(".delete-modal-button").click(function(){
            var oldData        = JSON.parse($(this).parents("tr").attr("data-item"));
            var actionRoute    = "{{ setRoute('admin.setup.sections.section.item.delete',$slug) }}";
            var target         = oldData.id;
            var message        = `Are you sure to <strong>delete</strong> banner?`;

            openDeleteModal(actionRoute,target,message);
        });
        
        $(document).ready(function(){
            // Switcher
            switcherAjax("{{ setRoute('admin.setup.sections.banner.status.update',$slug) }}");
        })
        
    </script>
   
@endpush