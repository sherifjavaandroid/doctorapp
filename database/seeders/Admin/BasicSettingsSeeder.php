<?php

namespace Database\Seeders\Admin;

use App\Models\Admin\BasicSettings;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BasicSettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            'site_name'         => "ADoctor",
            'site_title'        => "Hospital Doctor Booking",
            'base_color'        => "#1bbde4",
            'otp_exp_seconds'   => "3600",
            'timezone'          => "Asia/Dhaka",
            'user_registration'  => 1,
            'email_verification' => 1,
            'agree_policy'       => 1,
            'broadcast_config'  => [
                "method"        => "pusher", 
                "app_id"        => "1574360", 
                "primary_key"   => "971ccaa6176db78407bf", 
                "secret_key"    => "a30a6f1a61b97eb8225a", 
                "cluster"       => "ap2" 
            ],
            'push_notification_config'  => [
                "method"                => "pusher", 
                "instance_id"           => "fd7360fa-4df7-43b9-b1b5-5a40002250a1", 
                "primary_key"           => "6EEDE8A79C61800340A87C89887AD14533A712E3AA087203423BF01569B13845"
            ],
            'kyc_verification'  => true,
            'mail_config'       => [
                "method" => "smtp", 
                "host" => "",
                "port" => "465", 
                "encryption" => "ssl",
                "username" => "",
                "password" => "",
                "from" => "", 
                "app_name" => "ADoctor",
            ],
           
            'site_logo_dark'    => 'seeder/web_logo.png',
            'site_logo'         => 'seeder/web_logo.png',
            'site_fav_dark'     => 'seeder/fav_icon.png',
            'site_fav'          => 'seeder/fav_icon.png',
            'web_version'       => '1.4.0',
        ];
        BasicSettings::truncate();
        BasicSettings::firstOrCreate($data);
    }
}
