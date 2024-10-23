<div class="sidebar">
    <div class="sidebar-inner">
        <div class="sidebar-logo">
            <a href="{{ setRoute('admin.dashboard') }}" class="sidebar-main-logo">
                <img src="{{ get_logo($basic_settings) }}" data-white_img="{{ get_logo($basic_settings,'white') }}"
                data-dark_img="{{ get_logo($basic_settings,'dark') }}" alt="logo">
            </a>
            <button class="sidebar-menu-bar">
                <i class="fas fa-exchange-alt"></i>
            </button>
        </div>
        <div class="sidebar-user-area">
            <div class="sidebar-user-thumb">
                <a href="{{ setRoute('admin.profile.index') }}"><img src="{{ get_image(Auth::user()->image,'admin-profile','profile') }}" alt="user"></a>
            </div>
            <div class="sidebar-user-content">
                <h6 class="title">{{ Auth::user()->fullname }}</h6>
                <span class="sub-title">{{ Auth::user()->getRolesString() }}</span>
            </div>
        </div>
        @php
            $current_route = Route::currentRouteName();
        @endphp
        <div class="sidebar-menu-wrapper">
            <ul class="sidebar-menu">

                @include('admin.components.side-nav.link',[
                    'route'     => 'admin.dashboard',
                    'title'     => __("Dashboard"),
                    'icon'      => "menu-icon las la-rocket",
                ])
                
                {{-- Section Default --}}
                @include('admin.components.side-nav.link-group',[
                    'group_title'       => __("Default"),
                    'group_links'       => [
                        [
                            'title'     => __("Setup Currency"),
                            'route'     => "admin.currency.index",
                            'icon'      => "menu-icon las la-coins",
                        ],
                        [
                            'title'     => __("Fees & Charges"),
                            'route'     => "admin.trx.settings.index",
                            'icon'      => "menu-icon las la-wallet",
                        ],
                        [
                            'title'     => __("Hospital Departments"),
                            'route'     => "admin.hospital.departments.index",
                            'icon'      => "menu-icon las la-coins",
                        ],
                        [
                            'title'     => __("Hospital Branch"),
                            'route'     => "admin.hospital.branch.index",
                            'icon'      => "menu-icon las la-code-branch",
                        ],
                        [
                            'title'     => __("Doctors"),
                            'route'     => "admin.doctor.care.index",
                            'icon'      => "menu-icon las la-user-nurse",
                        ],
                        [
                            'title'     => __("Investigation"),
                            'route'     => "admin.investigation.index",
                            'icon'      => "menu-icon lab la-searchengin",
                        ],
                        [
                            'title'     => __("Health Package"),
                            'route'     => "admin.health.package.index",
                            'icon'      => "menu-icon las la-briefcase-medical",
                        ],
                        [
                            'title'     => __("Subscribers"),
                            'route'     => "admin.subscriber.index",
                            'icon'      => "menu-icon las la-bell",
                        ],
                        [
                            'title'     => __("Contact Messages"),
                            'route'     => "admin.contact.index",
                            'icon'      => "menu-icon las la-sms",
                        ],

                    ]
                ])
                @include('admin.components.side-nav.link-group',[
                    'group_title'       => __("Booking Details"),
                    'group_links'       => [
                        
                        [
                            'title'     => __("Appointments"),
                            'route'     => "admin.booking.index",
                            'icon'      => "menu-icon las la-calendar-check",
                        ],
                        [
                            'title'     => __("Home Service"),
                            'route'     => "admin.home.service.index",
                            'icon'      => "menu-icon las la-home",
                        ],
                        

                    ]
                ])
                {{-- Interface Panel --}}
                @include('admin.components.side-nav.link-group',[
                    'group_title'       => __("Interface Panel"),
                    'group_links'       => [
                        'dropdown'      => [
                            [
                                'title'     => __("User Care"),
                                'icon'      => "menu-icon las la-user-edit",
                                'links'     => [
                                    [
                                        'title'     => __("Active Users"),
                                        'route'     => "admin.users.active",
                                    ],
                                    [
                                        'title'     => __("Email Unverified"),
                                        'route'     => "admin.users.email.unverified",
                                    ],
                                    [
                                        'title'     => __("All Users"),
                                        'route'     => "admin.users.index",
                                    ],
                                    [
                                        'title'     => __("Email To Users"),
                                        'route'     => "admin.users.email.users",
                                    ],
                                    [
                                        'title'     => __("Banned Users"),
                                        'route'     => "admin.users.banned",
                                    ]
                                ],
                            ],
                            [
                                'title'             => __("Admin Care"),
                                'icon'              => "menu-icon las la-user-shield",
                                'links'     => [
                                    [
                                        'title'     => __("All Admin"),
                                        'route'     => "admin.admins.index",
                                    ],
                                    [
                                        'title'     => __("Admin Role"),
                                        'route'     => "admin.admins.role.index",
                                    ],
                                    [
                                        'title'     => __("Role Permission"),
                                        'route'     => "admin.admins.role.permission.index", 
                                    ],
                                    [
                                        'title'     => __("Email To Admin"),
                                        'route'     => "admin.admins.email.admins",
                                    ]
                                ],
                            ],
                        ],

                    ]
                ])

                {{-- Section Settings --}}
                @include('admin.components.side-nav.link-group',[
                    'group_title'       => __("Settings"),
                    'group_links'       => [
                        'dropdown'      => [
                            [
                                'title'     => __("Web Settings"),
                                'icon'      => "menu-icon lab la-safari",
                                'links'     => [
                                    [
                                        'title'     => __("Basic Settings"),
                                        'route'     => "admin.web.settings.basic.settings",
                                    ],
                                    [
                                        'title'     => __("Image Assets"),
                                        'route'     => "admin.web.settings.image.assets",
                                    ],
                                    [
                                        'title'     => __("Setup SEO"),
                                        'route'     => "admin.web.settings.setup.seo", 
                                    ]
                                ],
                            ],
                            [
                                'title'             => __("App Settings"),
                                'icon'              => "menu-icon las la-mobile",
                                'links'     => [
                                    [
                                        'title'     => __("Splash Screen"),
                                        'route'     => "admin.app.settings.splash.screen",
                                    ],
                                    [
                                        'title'     => __("Onboard Screen"),
                                        'route'     => "admin.app.settings.onboard.screens",
                                    ],
                                    [
                                        'title'     => __("App URLs"),
                                        'route'     => "admin.app.settings.urls", 
                                    ],
                                ],
                            ],
                        ],
                    ]
                ])
                
                @include('admin.components.side-nav.link',[
                    'route'     => 'admin.languages.index',
                    'title'     => __("Languages"),
                    'icon'      => "menu-icon las la-language",
                ])

                {{-- Verification Center --}}
                @include('admin.components.side-nav.link-group',[
                    'group_title'       => __("Verification Center"),
                    'group_links'       => [
                        'dropdown'      => [
                            [
                                'title'     => __("Setup Email"),
                                'icon'      => "menu-icon las la-envelope-open-text",
                                'links'     => [
                                    [
                                        'title'     => __("Email Method"),
                                        'route'     => "admin.setup.email.config",
                                    ],
                                ],
                            ]
                        ],

                    ]
                ])
                @if (admin_permission_by_name("admin.setup.sections.section"))
                    <li class="sidebar-menu-header">{{ __("Setup Web Content") }}</li>
                    @php
                        $current_url = URL::current();

                        $setup_section_childs  = [
                            setRoute('admin.setup.sections.section','banner'),
                            setRoute('admin.setup.sections.section','about-section'),
                            setRoute('admin.setup.sections.section','faq-section'),
                            setRoute('admin.setup.sections.section','testimonial-section'),
                            setRoute('admin.setup.sections.section','how-its-work-section'),
                            setRoute('admin.setup.sections.section','web-journal-section'),
                            setRoute('admin.setup.sections.section','footer-section'),
                            setRoute('admin.setup.sections.section','news-letter-section'),
                            setRoute('admin.setup.sections.section','contact-section'),
                            setRoute('admin.setup.sections.section','login-section'),
                            setRoute('admin.setup.sections.section','register-section'),
                            
                        ];
                    @endphp

                    <li class="sidebar-menu-item sidebar-dropdown @if (in_array($current_url,$setup_section_childs)) active @endif">
                        <a href="javascript:void(0)">
                            <i class="menu-icon las la-terminal"></i>
                            <span class="menu-title">{{ __('Setup Section') }}</span>
                        </a>
                        <ul class="sidebar-submenu">
                            <li class="sidebar-menu-item">
                                <a href="{{ setRoute('admin.setup.sections.section','banner') }}" class="nav-link @if ($current_url == setRoute('admin.setup.sections.section','banner')) active @endif">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">{{ __("Banner Section") }}</span>
                                </a>
                                <a href="{{ setRoute('admin.setup.sections.section','about-section') }}" class="nav-link @if ($current_url == setRoute('admin.setup.sections.section','about-section')) active @endif">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">{{ __('About Section') }}</span>
                                </a>
                                <a href="{{ setRoute('admin.setup.sections.section','faq-section') }}" class="nav-link @if($current_url == setRoute('admin.setup.sections.section','faq-section')) active @endif">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title"> {{ __('Faq Section') }} </span>
                                </a>
                                <a href="{{ setRoute('admin.setup.sections.section','testimonial-section') }}" class="nav-link @if($current_url == setRoute('admin.setup.sections.section','testimonial-section')) active @endif">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title"> {{ __('Testimonial Section') }} </span>
                                </a>
                                <a href="{{ setRoute('admin.setup.sections.section','how-its-work-section') }}" class="nav-link @if($current_url == setRoute('admin.setup.sections.section','how-its-work-section')) active @endif">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title"> {{ __('How Its Work Section') }} </span>
                                </a>
                                <a href="{{ setRoute('admin.setup.sections.section','web-journal-section') }}" class="nav-link @if($current_url == setRoute('admin.setup.sections.section','web-journal-section')) active @endif">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title"> {{ __('Web Journal Section') }} </span>
                                </a>
                                
                                <a href="{{ setRoute('admin.setup.sections.section','footer-section') }}" class="nav-link @if($current_url == setRoute('admin.setup.sections.section','footer-section')) active @endif">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title"> {{ __('Footer Section') }} </span>
                                </a>
                                <a href="{{ setRoute('admin.setup.sections.section','news-letter-section') }}" class="nav-link @if($current_url == setRoute('admin.setup.sections.section','news-letter-section')) active @endif">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title"> {{ __('News Letter Section') }} </span>
                                </a>
                                <a href="{{ setRoute('admin.setup.sections.section','contact-section') }}" class="nav-link @if($current_url == setRoute('admin.setup.sections.section','contact-section')) active @endif">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title"> {{ __('Contact Section') }} </span>
                                </a> 
                                <a href="{{ setRoute('admin.setup.sections.section','login-section') }}" class="nav-link @if($current_url == setRoute('admin.setup.sections.section','login-section')) active @endif">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title"> {{ __('Login Section') }} </span>
                                </a> 
                                <a href="{{ setRoute('admin.setup.sections.section','register-section') }}" class="nav-link @if($current_url == setRoute('admin.setup.sections.section','register-section')) active @endif">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title"> {{ __('Register Section') }} </span>
                                </a> 
                            </li>
                        </ul>
                    </li>
                @endif

                @include('admin.components.side-nav.link',[
                    'route'     => 'admin.setup.pages.index',
                    'title'     => __("Setup Pages"),
                    'icon'      => "menu-icon las la-file-alt",
                ])

                @include('admin.components.side-nav.link',[
                    'route'     => 'admin.extensions.index',
                    'title'     => __("Extensions"),
                    'icon'      => "menu-icon las la-puzzle-piece",
                ])

                @include('admin.components.side-nav.link',[
                    'route'     => 'admin.useful.links.index',
                    'title'     => __("Useful Links"),
                    'icon'      => "menu-icon las la-link",
                ])
                @if (admin_permission_by_name("admin.payment.gateway.view"))
                    <li class="sidebar-menu-header">{{ __("Payment Methods") }}</li>
                    @php
                        $payment_add_money_childs  = [
                            setRoute('admin.payment.gateway.view',['payment-method','automatic']),
                            setRoute('admin.payment.gateway.view',['payment-method','manual']),
                        ]
                    @endphp
                    <li class="sidebar-menu-item sidebar-dropdown @if (in_array($current_url,$payment_add_money_childs)) active @endif">
                        <a href="javascript:void(0)">
                            <i class="menu-icon las la-funnel-dollar"></i>
                            <span class="menu-title">{{ __("Payment Method") }}</span>
                        </a>
                        <ul class="sidebar-submenu">
                            <li class="sidebar-menu-item">
                                <a href="{{ setRoute('admin.payment.gateway.view',['payment-method','automatic']) }}" class="nav-link @if ($current_url == setRoute('admin.payment.gateway.view',['payment-method','automatic'])) active @endif">
                                    <i class="menu-icon las la-ellipsis-h"></i>
                                    <span class="menu-title">{{ __("Automatic") }}</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                @endif
                {{-- Notifications --}}
                @include('admin.components.side-nav.link-group',[
                    'group_title'       => __("Notification"),
                    'group_links'       => [
                        'dropdown'      => [
                            [
                                'title'     => __("Push Notification"),
                                'icon'      => "menu-icon las la-bell",
                                'links'     => [
                                    [
                                        'title'     => __("Setup Notification"),
                                        'route'     => "admin.push.notification.config",
                                    ],
                                    [
                                        'title'     => __("Send Notification"),
                                        'route'     => "admin.push.notification.index",
                                    ]
                                ],
                            ]
                        ],

                    ]
                ])

                @php
                    $bonus_routes = [
                        'admin.cookie.index',
                        'admin.server.info.index',
                        'admin.cache.clear',
                    ];
                @endphp 

                @if (admin_permission_by_name_array($bonus_routes))   
                    <li class="sidebar-menu-header">{{ __("Bonus") }}</li>
                @endif

                @include('admin.components.side-nav.link',[
                    'route'     => 'admin.cookie.index',
                    'title'     => __("GDPR Cookie"),
                    'icon'      => "menu-icon las la-cookie-bite",
                ])

                @include('admin.components.side-nav.link',[
                    'route'     => 'admin.server.info.index',
                    'title'     => __("Server Info"),
                    'icon'      => "menu-icon las la-sitemap",
                ])

                @include('admin.components.side-nav.link',[
                    'route'     => 'admin.cache.clear',
                    'title'     => __("Clear Cache"),
                    'icon'      => "menu-icon las la-broom",
                ])
            </ul>
        </div>
    </div>
</div>
