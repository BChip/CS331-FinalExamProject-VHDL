
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Sonar -dir "/home/waqas/CS331-FinalExamProject-VHDL/Sonar/planAhead_run_1" -part xc3s100evq100-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Spartan-3e.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Counter.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Trigger_generator.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Distance_calculation.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {BCD_converter.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Range_Sensor.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {lcd_controller.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {TopDesign.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top TopDesign $srcset
add_files [list {Spartan-3e.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s100evq100-5
