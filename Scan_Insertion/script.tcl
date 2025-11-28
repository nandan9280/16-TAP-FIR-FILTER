set_host_options -max_cores 4

set DESIGN_REF_PATH "/home/synopsys/installs/LIBRARIES/SAED14nm_EDK_08_2024/"

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


set link_library  $LINK_LIBRARY_FILES 
set target_library $TARGET_LIBRARY_FILES

analyze -library WORK -format verilog {./RTL/fir_filter_16_tap.v \
                                       ./RTL/booth_multiplier_16x16.v \
                                       ./RTL/ripple_carry_adder.v \
                                       ./RTL/full_adder.v \
                                       ./RTL/half_adder.v }

read_file -format verilog {./RTL/fir_filter_16_tap.v}

check_design
link
source -echo ./fir_filter.sdc
check_timing

set auto_wire_load_selection false
set_wire_load_model -name "8000"
set_wire_load_mode top

set_operating_conditions -min ff0p88v25c -max ss0p72v25c

set_leakage_optimization true
set_dynamic_optimization true

set_fix_multiple_port_nets -all -buffer_constants [get_designs fir_filter_16_tap]
compile -exact_map

catch {file mkdir report}
change_names -rules verilog -verbose -hier
report_clock_gating > ./report/clock_gating.rpt
report_power > ./report/power.rpt
report_area > ./report/area.rpt
report_timing > ./report/timing.rpt
report_qor > ./report/qor.rpt
report_utilization > ./report/utilization.rpt
report_violations > ./report/violations.rpt
report_drc > ./report/drc.rpt      


write -f verilog -h -out   ./fir_filter_netlist.v
write -f ddc -h -out       ./fir_filter.ddc
write_sdc ./fir_filter_gen.sdc





