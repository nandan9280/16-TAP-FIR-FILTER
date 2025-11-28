set DESIGN_REF_PATH "/home/synopsys/installs/LIBRARIES/SAED14nm_EDK_08_2024/"

set SEARCH_PATH      " ./ \
          ${DESIGN_REF_PATH} "

set LINK_LIBRARY_FILES    "* \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_RVT/liberty/nldm/base/saed14rvt_base_tt0p8v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_RVT/liberty/nldm/base/saed14rvt_base_ss0p72v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_RVT/liberty/nldm/base/saed14rvt_base_ff0p88v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_HVT/liberty/nldm/base/saed14hvt_base_tt0p8v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_HVT/liberty/nldm/base/saed14hvt_base_ss0p72v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_HVT/liberty/nldm/base/saed14hvt_base_ff0p88v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_LVT/liberty/nldm/base/saed14lvt_base_tt0p8v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_LVT/liberty/nldm/base/saed14lvt_base_ss0p72v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_LVT/liberty/nldm/base/saed14lvt_base_ff0p88v25c.db \
${DESIGN_REF_PATH}//SAED14nm_EDK_SRAM/liberty/nldm/saed14sram_tt0p8v25c.db \
${DESIGN_REF_PATH}//SAED14nm_EDK_SRAM/liberty/nldm/saed14sram_ss0p72v25c.db \
${DESIGN_REF_PATH}//SAED14nm_EDK_SRAM/liberty/nldm/saed14sram_ff0p88v25c.db"


set TARGET_LIBRARY_FILES   "\
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_RVT/liberty/nldm/base/saed14rvt_base_tt0p8v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_RVT/liberty/nldm/base/saed14rvt_base_ss0p72v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_RVT/liberty/nldm/base/saed14rvt_base_ff0p88v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_HVT/liberty/nldm/base/saed14hvt_base_tt0p8v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_HVT/liberty/nldm/base/saed14hvt_base_ss0p72v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_HVT/liberty/nldm/base/saed14hvt_base_ff0p88v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_LVT/liberty/nldm/base/saed14lvt_base_tt0p8v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_LVT/liberty/nldm/base/saed14lvt_base_ss0p72v25c.db \
${DESIGN_REF_PATH}/SAED14nm_EDK_STD_LVT/liberty/nldm/base/saed14lvt_base_ff0p88v25c.db \
${DESIGN_REF_PATH}//SAED14nm_EDK_SRAM/liberty/nldm/saed14sram_tt0p8v25c.db \
${DESIGN_REF_PATH}//SAED14nm_EDK_SRAM/liberty/nldm/saed14sram_ss0p72v25c.db \
${DESIGN_REF_PATH}//SAED14nm_EDK_SRAM/liberty/nldm/saed14sram_ff0p88v25c.db"

######################################################################
# Logical Library Settings
######################################################################
set_app_var search_path "$SEARCH_PATH"
set_app_var target_library "$TARGET_LIBRARY_FILES"
set_app_var link_library " $LINK_LIBRARY_FILES "

read_file -format verilog ./fir_filter_netlist.v
current_design fir_filter_16_tap
link

source ./fir_filter_gen.sdc
check_timing

#set_max_transition 0.1 [current_design]
#set_max_capacitance 100 [current_design]
#set_max_fanout 200 [current_design]

update_timing -full

report_timing
report_timing -delay_type min
report_analysis_coverage

catch {file mkdir report}
report_timing -from [all_inputs] -max_paths 20 -to [all_registers -data_pins]  > report/timing.rpt
report_timing -from [all_register -clock_pins] -max_paths 20 -to [all_registers -data_pins] > report/su.timing.rpt
report_timing -from [all_register -clock_pins] -max_paths 20 -to [all_registers -data_pins] -delay_type min > report/hold.timing.rpt
report_timing -from [all_registers -clock_pins] -max_paths 20 -to [all_outputs] >> report/timing.rpt
report_timing -from [all_inputs] -to [all_outputs] -max_paths 20 >> report/timing.rpt
report_timing -from [all_registers -clock_pins] -to [all_registers -data_pins] -delay_type max  >> report/timing.rpt
report_timing -from [all_registers -clock_pins] -to [all_registers -data_pins] -delay_type min  >> report/timing.rpt


report_timing -transition_time -capacitance -nets -input_pins -from [all_registers -clock_pins] -to [all_registers -data_pins]  > report/timing.tran.cap.rpt




