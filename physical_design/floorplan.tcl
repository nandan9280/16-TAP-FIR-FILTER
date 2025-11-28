# SANITY CHECK
#
check_netlist
check_timing
report_design_mismatch -verbose

############## create  shape of Block and proceed with next steps #########################

initialize_floorplan -core_utilization 0.6 -side_ratio {6 3} -core_offset {1}

# PLACE PINS
#set_block_pin_constraints -self -allowed_layers {M3 M4} -sides 2
#place_pins -self

#setting pin locations and direction  2=out,,4=in, 1=inout(if available)
set_block_pin_constraints -self -allowed_layers {M3 M4} -sides 2
place_pins -ports [get_ports -filter direction==out]
set_block_pin_constraints -self -allowed_layers {M3 M4} -sides 4
place_pins -ports [get_ports -filter direction==in]

#Use below command only if INOUT port is available
#set_block_pin_constraints -self -allowed_layers {M3 M4} -sides 1
#place_pins -ports [get_ports -filter direction==inout]
#set_individual_pin_constraints -allowed_layers {3 4} -location {0 244} -pin_spacing_distance 0.608 -ports [get_ports -filter direction==inout]
#place_pins -ports [get_ports -filter direction==inout]

set_app_option -name time.disable_recovery_removal_checks -value false
set_app_option -name time.disable_case_analysis -value false

# fix the ports
set_attribute [get_ports *] physical_status fixed
get_attribute [get_ports *] is_fixed

# Creating KEEPOUT MARGIN   for all MACRO {Left,Top, right, bottom}
#create_keepout_margin -type hard -outer {1.52 1.672 1.52 1.672} [get_cells -physical_context -filter design_type==macro]

#fix the macros
set_attribute [get_cells -physical_context -filter design_type==macro] physical_status fixed
get_attribute [get_cells -physical_context -filter design_type==macro] is_fixed

#ADD END CAP cells
#set_boundary_cell_rules -top_boundary_cells saed14rvt_tt0p8v125c/SAEDRVT14_CAPT2 -bottom_boundary_cells saed14rvt_tt0p8v125c/SAEDRVT14_CAPB2 -right_boundary_cell saed14rvt_tt0p8v125c/SAEDRVT14_CAPBIN13 -left_boundary_cell saed14rvt_tt0p8v125c/SAEDRVT14_CAPBTAP6 -prefix endcap

set_boundary_cell_rules -top_boundary_cell saed14rvt_base_frame_timing/SAEDRVT14_CAPTIN13 -bottom_boundary_cell saed14rvt_base_frame_timing/SAEDRVT14_CAPTIN13 -right_boundary_cell saed14rvt_base_frame_timing/SAEDRVT14_CAPTIN13 -left_boundary_cell saed14rvt_base_frame_timing/SAEDRVT14_CAPTIN13  -prefix endcap

#set_boundary_cell_rules -right_boundary_cell saed14rvt_base_frame_timing/SAEDRVT14_CAPTIN13 -left_boundary_cell saed14rvt_base_frame_timing/SAEDRVT14_CAPTIN13 -prefix endcap

compile_targeted_boundary_cells -target_objects [get_voltage_areas]

#Add  TAP CELLS
create_tap_cells -lib_cell saed14rvt_base_frame_timing/SAEDRVT14_CAPTTAPP6 -distance 20 -skip_fixed_cells
#
#to check their legality location
check_legality -cells [get_cells bound*]
check_legality -cells [get_cells tap*]

save_block -as floorplan_done -f
# 
# ---------Power Plan script starts------------

## create the PG nets
create_net -power VDD
create_net -ground VSS

## Create the ports
create_port -direction inout VDD
create_port -direction inout VSS

## Making Logical Connections
connect_pg_net -net VDD [get_ports VDD]
connect_pg_net -net VSS [get_ports VSS]

connect_pg_net -net VDD [get_pins */VDD]
connect_pg_net -net VSS [get_pins */VSS]

## Making Logical Connections
connect_pg_net -net VDD [get_pins -hierarchical "*/VDD"]
connect_pg_net -net VSS [get_pins -hierarchical "*/VSS"]

## Setting up the attribute for TIE cells
set_attribute [get_lib_cells */*TIE*] dont_touch false
set_lib_cell_purpose -include optimization [get_lib_cells */*TIE*]

### creating PG Rails
create_pg_mesh_pattern P_top_two -layers { { {horizontal_layer: M9} {width: 0.12} {spacing: interleaving} {pitch: 4.8} {offset: 1.6} {trim : true} } { {vertical_layer: M8}   {width: 0.12} {spacing: interleaving} {pitch: 4.8} {offset: 1.6}  {trim : true} } }
 set_pg_strategy S_default_vddvss -core -pattern   { {name: P_top_two} {nets:{VSS VDD}} } -extension { {{stop:design_boundary_and_generate_pin}} }
 compile_pg -strategies {S_default_vddvss}

 #### Creating Standard cell rails
 create_pg_std_cell_conn_pattern std_rail_conn1 -rail_width 0.094 -layers M1
 set_pg_strategy  std_rail_1 -pattern {{name : std_rail_conn1} {nets: "VDD VSS"}} -core
 compile_pg -strategies std_rail_1

 #### Creation of Vias b/w rails and PG straps
 #create_pg_vias -nets {VDD VSS} -from_layers M1 -to_layers M9 -drc no_check
 
 # Check physical Connectivity of PG nets
 check_pg_connectivity
 
 #Check for DRC errors in the design,
 check_pg_drc

 ### saving block
 save_block -as powerplan_done -f


#To remove Power routes if you have any issue while building powerplan use all below cmds.

#remove_pg_strategies -all
#remove_pg_patterns -all
#remove_pg_regions -all
#remove_pg_via_master_rules -all
#remove_pg_strategy_via_rules -all
#remove_routes -net_types {power ground}
#remove_routes -net_types {VDD VSS}
#remove_routes -net_types {power ground} -ring -stripe -macro_pin_connect -lib_cell_pin_connect
