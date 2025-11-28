set PERIOD  5.0
set INPUT_DELAY  1.0
set OUTPUT_DELAY  1.0
set CLOCK_LATENCY 1.5
set MIN_IO_DELAY 1.0
set MAX_TRANSITION 0.5

## CLOCK BASICS
create_clock -name "clock" -period $PERIOD [get_ports clk]
set_clock_latency $CLOCK_LATENCY [get_clocks clk]
set_clock_uncertainty 0.3 [get_clocks clk]
set_clock_transition 0.4 [get_clocks clk]

## GROUPING
group_path  -name CLOCK\
            -to clk\
            -weight 1

group_path  -name INPUTS\
            -through [all_inputs]\
            -weight 1

group_path  -name OUTPUTS\
            -to [all_outputs]\
            -weight 1

## IN/OUT
set INPUTPORTS [remove_from_collection [all_inputs] [get_ports clk]]
set OUTPUTPORTS [all_outputs]
  
set_input_delay -clock "clock" -max $INPUT_DELAY $INPUTPORTS 
set_output_delay -clock "clock" -max $OUTPUT_DELAY $OUTPUTPORTS
set_input_delay -clock "clock" -min $MIN_IO_DELAY $INPUTPORTS 
set_output_delay -clock "clock" -min $MIN_IO_DELAY $OUTPUTPORTS

## DRC
set_max_transition $MAX_TRANSITION [current_design]
set_max_capacitance 100 [current_design]
set_max_fanout 200 [current_design]

#set REFLIB saed14rvt_base_tt0p8v25c
#set BUFFER "SAEDRVT14_BUF_4"
#set BUF_IN_PIN "A"
#set BUF_OUT_PIN "X"

#set_load [expr 10 * [load_of $REFLIB/$BUFFER/$BUF_IN_PIN]] [all_outputs]

#set_driving_cell -library $REFLIB -lib_cell $BUFFER -pin $BUF_OUT_PIN $INPUTPORTS

#set_driving_cell -library $REFLIB \
                 -lib_cell $BUFFER \
                 -pin $BUF_OUT_PIN [all_inputs]




