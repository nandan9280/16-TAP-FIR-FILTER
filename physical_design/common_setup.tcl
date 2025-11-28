set_host_options -max_cores 4

puts "RM-Info: Running script [info script]\n"

set DESIGN_NAME  "fir_filtera_16_tap"  ;#  The name of the top-level design

## Point to the new 14nm SAED libs
set DESIGN_REF_PATH "/home/synopsys/installs/LIBRARIES/SAED14nm_EDK_08_2024/"
set DESIGN_REF_PATH1 "/home/synopsys/installs/LIBRARIES/SAED14nm_EDK_08_2024/"

set DESIGN_REF_TECH_PATH  "/home/synopsys/installs/LIBRARIES/SAED14nm_EDK_08_2024/SAED14nm_EDK_TECH_DATA"

set HIERARCHICAL_DESIGNS           "" ;# List of hierarchical block design names "DesignA DesignB" ...
set HIERARCHICAL_CELLS             "" ;# List of hierarchical block cell instance names "u_DesignA u_DesignB" ...


#clock_gating
set LINK_LIBRARY_FILES_CLG   "* \
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

#clock_gating
set TARGET_LIBRARY_FILES_CLG    " \
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
${DESIGN_REF_PATH}//SAED14nm_EDK_SRAM/liberty/nldmChipTop/saed14sram_ss0p72v25c.db \
${DESIGN_REF_PATH}//SAED14nm_EDK_SRAM/liberty/nldm/saed14sram_ff0p88v25c.db"

set NDM_REFERENCE_LIB_DIRS_CLG  " \
     ${DESIGN_REF_PATH}/SAED14nm_EDK_STD_HVT/ndm/saed14hvt_base_frame_timing.ndm \
	 ${DESIGN_REF_PATH}/SAED14nm_EDK_STD_RVT/ndm/saed14rvt_base_frame_timing.ndm \
	 ${DESIGN_REF_PATH}/SAED14nm_EDK_STD_LVT/ndm/saed14lvt_base_frame_timing.ndm \
	 ${DESIGN_REF_PATH}/SAED14nm_EDK_SRAM/ndm/saed14sram_frame_timing.ndm "
	
set MW_REFERENCE_CONTROL_FILE     ""  ;#  Reference Control file to define the MW ref libs

set TECH_FILE                     "${DESIGN_REF_PATH}/SAED14nm_EDK_TECH_DATA/tf/saed14nm_1p9m.tf"  ;#  Milkyway technology file
set MAP_FILE                      "${DESIGN_REF_PATH}/SAED14nm_EDK_TECH_DATA/map/saed14nm_tf_itf_tluplus.map"  ;#  Mapping file for TLUplus
set TLUPLUS_MAX_FILE              "${DESIGN_REF_PATH}/SAED14nm_EDK_TECH_DATA/tlup/saed14nm_1p9m_Cmax.tlup"  ;#  Max TLUplus file
set TLUPLUS_MIN_FILE              "${DESIGN_REF_PATH}/SAED14nm_EDK_TECH_DATA/tlup/saed14nm_1p9m_Cmin.tlup"  ;#  Min TLUplus file


set NDM_POWER_NET                "VDD" ;#
set NDM_POWER_PORT               "VDD" ;#
set NDM_GROUND_NET               "VSS" ;#
set NDM_GROUND_PORT              "VSS" ;#

set MIN_ROUTING_LAYER            "M2"   ;# Min routing layer
set MAX_ROUTING_LAYER            "M7"   ;# Max routing layer


puts "RM-Info: Completed script [info script]\n"





