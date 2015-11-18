# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir F:/adnans_lab7/adnans_lab7.cache/wt [current_project]
set_property parent.project_path F:/adnans_lab7/adnans_lab7.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  F:/adnans_lab7/adnans_lab7.srcs/sources_1/imports/Lab7/kcpsm6.v
  F:/adnans_lab7/software/software.v
  F:/adnans_lab7/adnans_lab7.srcs/sources_1/imports/Lab7/tutorial.v
}
read_xdc F:/adnans_lab7/adnans_lab7.srcs/constrs_1/imports/Lab7/tutorial.xdc
set_property used_in_implementation false [get_files F:/adnans_lab7/adnans_lab7.srcs/constrs_1/imports/Lab7/tutorial.xdc]

synth_design -top tutorial -part xc7a35tcpg236-1
write_checkpoint -noxdef tutorial.dcp
catch { report_utilization -file tutorial_utilization_synth.rpt -pb tutorial_utilization_synth.pb }
