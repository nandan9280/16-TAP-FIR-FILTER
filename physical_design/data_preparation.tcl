
####### Setting Up Target & Link Libraries #############
source ./common_setup.tcl

####### Creating library of the block ########

set link_library  $LINK_LIBRARY_FILES_CLG
set target_library $TARGET_LIBRARY_FILES_CLG

create_lib -ref_libs $NDM_REFERENCE_LIB_DIRS_CLG -technology $TECH_FILE ./lib

#read netlist
read_verilog ./fir_filter_netlist.v

#set current design -top level module name
current_design fir_filter_16_tap

#linking library + netlist
link

save_lib -as post_import_design

#defining attributes for metal layers -- HVH (preferable) or VHV 
define_user_attribute -type string -name routing_direction -classes routing_rule

#for horizontal 
set_attribute -objects [get_layers {M1 M3 M5 M7 M9}] -name routing_direction -value horizontal

#for vertical
set_attribute -objects [get_layers {M2 M4 M6 M8 MRDL}] -name routing_direction -value vertical

#reading TLU+ file ---max file
read_parasitic_tech -tlup $TLUPLUS_MAX_FILE -layermap $MAP_FILE -name worst_para

#min file
read_parasitic_tech -tlup $TLUPLUS_MIN_FILE -layermap $MAP_FILE -name best_para

#reading the .sdc f
source -e -v ./mcmm.tcl

save_block -as import_done

save_lib








