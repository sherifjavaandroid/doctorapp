@if (admin_permission_by_name("admin.hospital.branch.store"))
    <div id="add-hospital-branch" class="mfp-hide large">
        <div class="modal-data">
            <div class="modal-header px-0">
                <h5 class="modal-title">{{ __("Add Hospital Branch") }}</h5>
            </div>
            <div class="modal-form-data">
                <form class="card-form" action="{{ setRoute('admin.hospital.branch.store') }}" method="POST">
                    @csrf
                    <div class="row mb-10-none">
                        <div class="col-xl-12 col-lg-12 form-group">
                            @include('admin.components.form.input',[
                                'label'         => "Name*",
                                'name'          => "name",
                                'data_limit'    => 150,
                                'placeholder'   => "Write Name...",
                                'value'         => old('name'),
                            ])
                        </div>
                        <div class="col-xl-12 col-lg-12 form-group">
                            @include('admin.components.button.form-btn',[
                                'class'         => "w-100 btn-loading",
                                'permission'    => "admin.hospital.branch.store",
                                'text'          => "Add",
                            ])
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    @push("script")

    @endpush
@endif