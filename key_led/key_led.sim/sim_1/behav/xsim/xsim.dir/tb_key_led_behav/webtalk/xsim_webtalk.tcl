webtalk_init -webtalk_dir /home/yveswong/key_led/key_led.sim/sim_1/behav/xsim/xsim.dir/tb_key_led_behav/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Tue Apr 18 17:49:16 2023" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "XSIM v2018.3 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2405991" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "LIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "xsim_vivado" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "453451eb-89fe-4f74-b344-0138b49167de" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "d22833cdf23445cc9804133d1e22fb5a" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "40" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Pop" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Pop!_OS 22.04 LTS" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i5-1035G1 CPU @ 1.00GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "3300.000 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "7.000 GB" -context "user_environment"
webtalk_register_client -client xsim
webtalk_add_data -client xsim -key Command -value "xsim" -context "xsim\\command_line_options"
webtalk_add_data -client xsim -key trace_waveform -value "true" -context "xsim\\usage"
webtalk_add_data -client xsim -key runtime -value "11 us" -context "xsim\\usage"
webtalk_add_data -client xsim -key iteration -value "1" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Time -value "0.04_sec" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Memory -value "114788_KB" -context "xsim\\usage"
webtalk_transmit -clientid 641385572 -regid "" -xml /home/yveswong/key_led/key_led.sim/sim_1/behav/xsim/xsim.dir/tb_key_led_behav/webtalk/usage_statistics_ext_xsim.xml -html /home/yveswong/key_led/key_led.sim/sim_1/behav/xsim/xsim.dir/tb_key_led_behav/webtalk/usage_statistics_ext_xsim.html -wdm /home/yveswong/key_led/key_led.sim/sim_1/behav/xsim/xsim.dir/tb_key_led_behav/webtalk/usage_statistics_ext_xsim.wdm -intro "<H3>XSIM Usage Report</H3><BR>"
webtalk_terminate
