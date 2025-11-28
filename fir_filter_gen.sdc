###################################################################

# Created by write_sdc on Wed Apr 16 18:07:19 2025

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_operating_conditions -max ss0p72v25c -max_library                          \
saed14rvt_base_ss0p72v25c\
                         -min ff0p88v25c -min_library saed14rvt_base_ff0p88v25c
set_wire_load_mode top
set_wire_load_model -name 8000 -library saed14rvt_base_tt0p8v25c
set_max_fanout 200 [current_design]
set_max_capacitance 100 [current_design]
set_max_transition 0.5 [current_design]
create_clock [get_ports clk]  -name clock  -period 5  -waveform {0 2.5}
group_path -name INPUTS  -through [list [get_ports clk] [get_ports rst] [get_ports {x_in[15]}]         \
[get_ports {x_in[14]}] [get_ports {x_in[13]}] [get_ports {x_in[12]}]           \
[get_ports {x_in[11]}] [get_ports {x_in[10]}] [get_ports {x_in[9]}] [get_ports \
{x_in[8]}] [get_ports {x_in[7]}] [get_ports {x_in[6]}] [get_ports {x_in[5]}]   \
[get_ports {x_in[4]}] [get_ports {x_in[3]}] [get_ports {x_in[2]}] [get_ports   \
{x_in[1]}] [get_ports {x_in[0]}] [get_ports {h0[15]}] [get_ports {h0[14]}]     \
[get_ports {h0[13]}] [get_ports {h0[12]}] [get_ports {h0[11]}] [get_ports      \
{h0[10]}] [get_ports {h0[9]}] [get_ports {h0[8]}] [get_ports {h0[7]}]          \
[get_ports {h0[6]}] [get_ports {h0[5]}] [get_ports {h0[4]}] [get_ports         \
{h0[3]}] [get_ports {h0[2]}] [get_ports {h0[1]}] [get_ports {h0[0]}]           \
[get_ports {h1[15]}] [get_ports {h1[14]}] [get_ports {h1[13]}] [get_ports      \
{h1[12]}] [get_ports {h1[11]}] [get_ports {h1[10]}] [get_ports {h1[9]}]        \
[get_ports {h1[8]}] [get_ports {h1[7]}] [get_ports {h1[6]}] [get_ports         \
{h1[5]}] [get_ports {h1[4]}] [get_ports {h1[3]}] [get_ports {h1[2]}]           \
[get_ports {h1[1]}] [get_ports {h1[0]}] [get_ports {h2[15]}] [get_ports        \
{h2[14]}] [get_ports {h2[13]}] [get_ports {h2[12]}] [get_ports {h2[11]}]       \
[get_ports {h2[10]}] [get_ports {h2[9]}] [get_ports {h2[8]}] [get_ports        \
{h2[7]}] [get_ports {h2[6]}] [get_ports {h2[5]}] [get_ports {h2[4]}]           \
[get_ports {h2[3]}] [get_ports {h2[2]}] [get_ports {h2[1]}] [get_ports         \
{h2[0]}] [get_ports {h3[15]}] [get_ports {h3[14]}] [get_ports {h3[13]}]        \
[get_ports {h3[12]}] [get_ports {h3[11]}] [get_ports {h3[10]}] [get_ports      \
{h3[9]}] [get_ports {h3[8]}] [get_ports {h3[7]}] [get_ports {h3[6]}]           \
[get_ports {h3[5]}] [get_ports {h3[4]}] [get_ports {h3[3]}] [get_ports         \
{h3[2]}] [get_ports {h3[1]}] [get_ports {h3[0]}] [get_ports {h4[15]}]          \
[get_ports {h4[14]}] [get_ports {h4[13]}] [get_ports {h4[12]}] [get_ports      \
{h4[11]}] [get_ports {h4[10]}] [get_ports {h4[9]}] [get_ports {h4[8]}]         \
[get_ports {h4[7]}] [get_ports {h4[6]}] [get_ports {h4[5]}] [get_ports         \
{h4[4]}] [get_ports {h4[3]}] [get_ports {h4[2]}] [get_ports {h4[1]}]           \
[get_ports {h4[0]}] [get_ports {h5[15]}] [get_ports {h5[14]}] [get_ports       \
{h5[13]}] [get_ports {h5[12]}] [get_ports {h5[11]}] [get_ports {h5[10]}]       \
[get_ports {h5[9]}] [get_ports {h5[8]}] [get_ports {h5[7]}] [get_ports         \
{h5[6]}] [get_ports {h5[5]}] [get_ports {h5[4]}] [get_ports {h5[3]}]           \
[get_ports {h5[2]}] [get_ports {h5[1]}] [get_ports {h5[0]}] [get_ports         \
{h6[15]}] [get_ports {h6[14]}] [get_ports {h6[13]}] [get_ports {h6[12]}]       \
[get_ports {h6[11]}] [get_ports {h6[10]}] [get_ports {h6[9]}] [get_ports       \
{h6[8]}] [get_ports {h6[7]}] [get_ports {h6[6]}] [get_ports {h6[5]}]           \
[get_ports {h6[4]}] [get_ports {h6[3]}] [get_ports {h6[2]}] [get_ports         \
{h6[1]}] [get_ports {h6[0]}] [get_ports {h7[15]}] [get_ports {h7[14]}]         \
[get_ports {h7[13]}] [get_ports {h7[12]}] [get_ports {h7[11]}] [get_ports      \
{h7[10]}] [get_ports {h7[9]}] [get_ports {h7[8]}] [get_ports {h7[7]}]          \
[get_ports {h7[6]}] [get_ports {h7[5]}] [get_ports {h7[4]}] [get_ports         \
{h7[3]}] [get_ports {h7[2]}] [get_ports {h7[1]}] [get_ports {h7[0]}]           \
[get_ports {h8[15]}] [get_ports {h8[14]}] [get_ports {h8[13]}] [get_ports      \
{h8[12]}] [get_ports {h8[11]}] [get_ports {h8[10]}] [get_ports {h8[9]}]        \
[get_ports {h8[8]}] [get_ports {h8[7]}] [get_ports {h8[6]}] [get_ports         \
{h8[5]}] [get_ports {h8[4]}] [get_ports {h8[3]}] [get_ports {h8[2]}]           \
[get_ports {h8[1]}] [get_ports {h8[0]}] [get_ports {h9[15]}] [get_ports        \
{h9[14]}] [get_ports {h9[13]}] [get_ports {h9[12]}] [get_ports {h9[11]}]       \
[get_ports {h9[10]}] [get_ports {h9[9]}] [get_ports {h9[8]}] [get_ports        \
{h9[7]}] [get_ports {h9[6]}] [get_ports {h9[5]}] [get_ports {h9[4]}]           \
[get_ports {h9[3]}] [get_ports {h9[2]}] [get_ports {h9[1]}] [get_ports         \
{h9[0]}] [get_ports {h10[15]}] [get_ports {h10[14]}] [get_ports {h10[13]}]     \
[get_ports {h10[12]}] [get_ports {h10[11]}] [get_ports {h10[10]}] [get_ports   \
{h10[9]}] [get_ports {h10[8]}] [get_ports {h10[7]}] [get_ports {h10[6]}]       \
[get_ports {h10[5]}] [get_ports {h10[4]}] [get_ports {h10[3]}] [get_ports      \
{h10[2]}] [get_ports {h10[1]}] [get_ports {h10[0]}] [get_ports {h11[15]}]      \
[get_ports {h11[14]}] [get_ports {h11[13]}] [get_ports {h11[12]}] [get_ports   \
{h11[11]}] [get_ports {h11[10]}] [get_ports {h11[9]}] [get_ports {h11[8]}]     \
[get_ports {h11[7]}] [get_ports {h11[6]}] [get_ports {h11[5]}] [get_ports      \
{h11[4]}] [get_ports {h11[3]}] [get_ports {h11[2]}] [get_ports {h11[1]}]       \
[get_ports {h11[0]}] [get_ports {h12[15]}] [get_ports {h12[14]}] [get_ports    \
{h12[13]}] [get_ports {h12[12]}] [get_ports {h12[11]}] [get_ports {h12[10]}]   \
[get_ports {h12[9]}] [get_ports {h12[8]}] [get_ports {h12[7]}] [get_ports      \
{h12[6]}] [get_ports {h12[5]}] [get_ports {h12[4]}] [get_ports {h12[3]}]       \
[get_ports {h12[2]}] [get_ports {h12[1]}] [get_ports {h12[0]}] [get_ports      \
{h13[15]}] [get_ports {h13[14]}] [get_ports {h13[13]}] [get_ports {h13[12]}]   \
[get_ports {h13[11]}] [get_ports {h13[10]}] [get_ports {h13[9]}] [get_ports    \
{h13[8]}] [get_ports {h13[7]}] [get_ports {h13[6]}] [get_ports {h13[5]}]       \
[get_ports {h13[4]}] [get_ports {h13[3]}] [get_ports {h13[2]}] [get_ports      \
{h13[1]}] [get_ports {h13[0]}] [get_ports {h14[15]}] [get_ports {h14[14]}]     \
[get_ports {h14[13]}] [get_ports {h14[12]}] [get_ports {h14[11]}] [get_ports   \
{h14[10]}] [get_ports {h14[9]}] [get_ports {h14[8]}] [get_ports {h14[7]}]      \
[get_ports {h14[6]}] [get_ports {h14[5]}] [get_ports {h14[4]}] [get_ports      \
{h14[3]}] [get_ports {h14[2]}] [get_ports {h14[1]}] [get_ports {h14[0]}]       \
[get_ports {h15[15]}] [get_ports {h15[14]}] [get_ports {h15[13]}] [get_ports   \
{h15[12]}] [get_ports {h15[11]}] [get_ports {h15[10]}] [get_ports {h15[9]}]    \
[get_ports {h15[8]}] [get_ports {h15[7]}] [get_ports {h15[6]}] [get_ports      \
{h15[5]}] [get_ports {h15[4]}] [get_ports {h15[3]}] [get_ports {h15[2]}]       \
[get_ports {h15[1]}] [get_ports {h15[0]}]]
group_path -name OUTPUTS  -to [list [get_ports {y_out[31]}] [get_ports {y_out[30]}] [get_ports          \
{y_out[29]}] [get_ports {y_out[28]}] [get_ports {y_out[27]}] [get_ports        \
{y_out[26]}] [get_ports {y_out[25]}] [get_ports {y_out[24]}] [get_ports        \
{y_out[23]}] [get_ports {y_out[22]}] [get_ports {y_out[21]}] [get_ports        \
{y_out[20]}] [get_ports {y_out[19]}] [get_ports {y_out[18]}] [get_ports        \
{y_out[17]}] [get_ports {y_out[16]}] [get_ports {y_out[15]}] [get_ports        \
{y_out[14]}] [get_ports {y_out[13]}] [get_ports {y_out[12]}] [get_ports        \
{y_out[11]}] [get_ports {y_out[10]}] [get_ports {y_out[9]}] [get_ports         \
{y_out[8]}] [get_ports {y_out[7]}] [get_ports {y_out[6]}] [get_ports           \
{y_out[5]}] [get_ports {y_out[4]}] [get_ports {y_out[3]}] [get_ports           \
{y_out[2]}] [get_ports {y_out[1]}] [get_ports {y_out[0]}]]
set_input_delay -clock clock  1  [get_ports rst]
set_input_delay -clock clock  1  [get_ports {x_in[15]}]
set_input_delay -clock clock  1  [get_ports {x_in[14]}]
set_input_delay -clock clock  1  [get_ports {x_in[13]}]
set_input_delay -clock clock  1  [get_ports {x_in[12]}]
set_input_delay -clock clock  1  [get_ports {x_in[11]}]
set_input_delay -clock clock  1  [get_ports {x_in[10]}]
set_input_delay -clock clock  1  [get_ports {x_in[9]}]
set_input_delay -clock clock  1  [get_ports {x_in[8]}]
set_input_delay -clock clock  1  [get_ports {x_in[7]}]
set_input_delay -clock clock  1  [get_ports {x_in[6]}]
set_input_delay -clock clock  1  [get_ports {x_in[5]}]
set_input_delay -clock clock  1  [get_ports {x_in[4]}]
set_input_delay -clock clock  1  [get_ports {x_in[3]}]
set_input_delay -clock clock  1  [get_ports {x_in[2]}]
set_input_delay -clock clock  1  [get_ports {x_in[1]}]
set_input_delay -clock clock  1  [get_ports {x_in[0]}]
set_input_delay -clock clock  1  [get_ports {h0[15]}]
set_input_delay -clock clock  1  [get_ports {h0[14]}]
set_input_delay -clock clock  1  [get_ports {h0[13]}]
set_input_delay -clock clock  1  [get_ports {h0[12]}]
set_input_delay -clock clock  1  [get_ports {h0[11]}]
set_input_delay -clock clock  1  [get_ports {h0[10]}]
set_input_delay -clock clock  1  [get_ports {h0[9]}]
set_input_delay -clock clock  1  [get_ports {h0[8]}]
set_input_delay -clock clock  1  [get_ports {h0[7]}]
set_input_delay -clock clock  1  [get_ports {h0[6]}]
set_input_delay -clock clock  1  [get_ports {h0[5]}]
set_input_delay -clock clock  1  [get_ports {h0[4]}]
set_input_delay -clock clock  1  [get_ports {h0[3]}]
set_input_delay -clock clock  1  [get_ports {h0[2]}]
set_input_delay -clock clock  1  [get_ports {h0[1]}]
set_input_delay -clock clock  1  [get_ports {h0[0]}]
set_input_delay -clock clock  1  [get_ports {h1[15]}]
set_input_delay -clock clock  1  [get_ports {h1[14]}]
set_input_delay -clock clock  1  [get_ports {h1[13]}]
set_input_delay -clock clock  1  [get_ports {h1[12]}]
set_input_delay -clock clock  1  [get_ports {h1[11]}]
set_input_delay -clock clock  1  [get_ports {h1[10]}]
set_input_delay -clock clock  1  [get_ports {h1[9]}]
set_input_delay -clock clock  1  [get_ports {h1[8]}]
set_input_delay -clock clock  1  [get_ports {h1[7]}]
set_input_delay -clock clock  1  [get_ports {h1[6]}]
set_input_delay -clock clock  1  [get_ports {h1[5]}]
set_input_delay -clock clock  1  [get_ports {h1[4]}]
set_input_delay -clock clock  1  [get_ports {h1[3]}]
set_input_delay -clock clock  1  [get_ports {h1[2]}]
set_input_delay -clock clock  1  [get_ports {h1[1]}]
set_input_delay -clock clock  1  [get_ports {h1[0]}]
set_input_delay -clock clock  1  [get_ports {h2[15]}]
set_input_delay -clock clock  1  [get_ports {h2[14]}]
set_input_delay -clock clock  1  [get_ports {h2[13]}]
set_input_delay -clock clock  1  [get_ports {h2[12]}]
set_input_delay -clock clock  1  [get_ports {h2[11]}]
set_input_delay -clock clock  1  [get_ports {h2[10]}]
set_input_delay -clock clock  1  [get_ports {h2[9]}]
set_input_delay -clock clock  1  [get_ports {h2[8]}]
set_input_delay -clock clock  1  [get_ports {h2[7]}]
set_input_delay -clock clock  1  [get_ports {h2[6]}]
set_input_delay -clock clock  1  [get_ports {h2[5]}]
set_input_delay -clock clock  1  [get_ports {h2[4]}]
set_input_delay -clock clock  1  [get_ports {h2[3]}]
set_input_delay -clock clock  1  [get_ports {h2[2]}]
set_input_delay -clock clock  1  [get_ports {h2[1]}]
set_input_delay -clock clock  1  [get_ports {h2[0]}]
set_input_delay -clock clock  1  [get_ports {h3[15]}]
set_input_delay -clock clock  1  [get_ports {h3[14]}]
set_input_delay -clock clock  1  [get_ports {h3[13]}]
set_input_delay -clock clock  1  [get_ports {h3[12]}]
set_input_delay -clock clock  1  [get_ports {h3[11]}]
set_input_delay -clock clock  1  [get_ports {h3[10]}]
set_input_delay -clock clock  1  [get_ports {h3[9]}]
set_input_delay -clock clock  1  [get_ports {h3[8]}]
set_input_delay -clock clock  1  [get_ports {h3[7]}]
set_input_delay -clock clock  1  [get_ports {h3[6]}]
set_input_delay -clock clock  1  [get_ports {h3[5]}]
set_input_delay -clock clock  1  [get_ports {h3[4]}]
set_input_delay -clock clock  1  [get_ports {h3[3]}]
set_input_delay -clock clock  1  [get_ports {h3[2]}]
set_input_delay -clock clock  1  [get_ports {h3[1]}]
set_input_delay -clock clock  1  [get_ports {h3[0]}]
set_input_delay -clock clock  1  [get_ports {h4[15]}]
set_input_delay -clock clock  1  [get_ports {h4[14]}]
set_input_delay -clock clock  1  [get_ports {h4[13]}]
set_input_delay -clock clock  1  [get_ports {h4[12]}]
set_input_delay -clock clock  1  [get_ports {h4[11]}]
set_input_delay -clock clock  1  [get_ports {h4[10]}]
set_input_delay -clock clock  1  [get_ports {h4[9]}]
set_input_delay -clock clock  1  [get_ports {h4[8]}]
set_input_delay -clock clock  1  [get_ports {h4[7]}]
set_input_delay -clock clock  1  [get_ports {h4[6]}]
set_input_delay -clock clock  1  [get_ports {h4[5]}]
set_input_delay -clock clock  1  [get_ports {h4[4]}]
set_input_delay -clock clock  1  [get_ports {h4[3]}]
set_input_delay -clock clock  1  [get_ports {h4[2]}]
set_input_delay -clock clock  1  [get_ports {h4[1]}]
set_input_delay -clock clock  1  [get_ports {h4[0]}]
set_input_delay -clock clock  1  [get_ports {h5[15]}]
set_input_delay -clock clock  1  [get_ports {h5[14]}]
set_input_delay -clock clock  1  [get_ports {h5[13]}]
set_input_delay -clock clock  1  [get_ports {h5[12]}]
set_input_delay -clock clock  1  [get_ports {h5[11]}]
set_input_delay -clock clock  1  [get_ports {h5[10]}]
set_input_delay -clock clock  1  [get_ports {h5[9]}]
set_input_delay -clock clock  1  [get_ports {h5[8]}]
set_input_delay -clock clock  1  [get_ports {h5[7]}]
set_input_delay -clock clock  1  [get_ports {h5[6]}]
set_input_delay -clock clock  1  [get_ports {h5[5]}]
set_input_delay -clock clock  1  [get_ports {h5[4]}]
set_input_delay -clock clock  1  [get_ports {h5[3]}]
set_input_delay -clock clock  1  [get_ports {h5[2]}]
set_input_delay -clock clock  1  [get_ports {h5[1]}]
set_input_delay -clock clock  1  [get_ports {h5[0]}]
set_input_delay -clock clock  1  [get_ports {h6[15]}]
set_input_delay -clock clock  1  [get_ports {h6[14]}]
set_input_delay -clock clock  1  [get_ports {h6[13]}]
set_input_delay -clock clock  1  [get_ports {h6[12]}]
set_input_delay -clock clock  1  [get_ports {h6[11]}]
set_input_delay -clock clock  1  [get_ports {h6[10]}]
set_input_delay -clock clock  1  [get_ports {h6[9]}]
set_input_delay -clock clock  1  [get_ports {h6[8]}]
set_input_delay -clock clock  1  [get_ports {h6[7]}]
set_input_delay -clock clock  1  [get_ports {h6[6]}]
set_input_delay -clock clock  1  [get_ports {h6[5]}]
set_input_delay -clock clock  1  [get_ports {h6[4]}]
set_input_delay -clock clock  1  [get_ports {h6[3]}]
set_input_delay -clock clock  1  [get_ports {h6[2]}]
set_input_delay -clock clock  1  [get_ports {h6[1]}]
set_input_delay -clock clock  1  [get_ports {h6[0]}]
set_input_delay -clock clock  1  [get_ports {h7[15]}]
set_input_delay -clock clock  1  [get_ports {h7[14]}]
set_input_delay -clock clock  1  [get_ports {h7[13]}]
set_input_delay -clock clock  1  [get_ports {h7[12]}]
set_input_delay -clock clock  1  [get_ports {h7[11]}]
set_input_delay -clock clock  1  [get_ports {h7[10]}]
set_input_delay -clock clock  1  [get_ports {h7[9]}]
set_input_delay -clock clock  1  [get_ports {h7[8]}]
set_input_delay -clock clock  1  [get_ports {h7[7]}]
set_input_delay -clock clock  1  [get_ports {h7[6]}]
set_input_delay -clock clock  1  [get_ports {h7[5]}]
set_input_delay -clock clock  1  [get_ports {h7[4]}]
set_input_delay -clock clock  1  [get_ports {h7[3]}]
set_input_delay -clock clock  1  [get_ports {h7[2]}]
set_input_delay -clock clock  1  [get_ports {h7[1]}]
set_input_delay -clock clock  1  [get_ports {h7[0]}]
set_input_delay -clock clock  1  [get_ports {h8[15]}]
set_input_delay -clock clock  1  [get_ports {h8[14]}]
set_input_delay -clock clock  1  [get_ports {h8[13]}]
set_input_delay -clock clock  1  [get_ports {h8[12]}]
set_input_delay -clock clock  1  [get_ports {h8[11]}]
set_input_delay -clock clock  1  [get_ports {h8[10]}]
set_input_delay -clock clock  1  [get_ports {h8[9]}]
set_input_delay -clock clock  1  [get_ports {h8[8]}]
set_input_delay -clock clock  1  [get_ports {h8[7]}]
set_input_delay -clock clock  1  [get_ports {h8[6]}]
set_input_delay -clock clock  1  [get_ports {h8[5]}]
set_input_delay -clock clock  1  [get_ports {h8[4]}]
set_input_delay -clock clock  1  [get_ports {h8[3]}]
set_input_delay -clock clock  1  [get_ports {h8[2]}]
set_input_delay -clock clock  1  [get_ports {h8[1]}]
set_input_delay -clock clock  1  [get_ports {h8[0]}]
set_input_delay -clock clock  1  [get_ports {h9[15]}]
set_input_delay -clock clock  1  [get_ports {h9[14]}]
set_input_delay -clock clock  1  [get_ports {h9[13]}]
set_input_delay -clock clock  1  [get_ports {h9[12]}]
set_input_delay -clock clock  1  [get_ports {h9[11]}]
set_input_delay -clock clock  1  [get_ports {h9[10]}]
set_input_delay -clock clock  1  [get_ports {h9[9]}]
set_input_delay -clock clock  1  [get_ports {h9[8]}]
set_input_delay -clock clock  1  [get_ports {h9[7]}]
set_input_delay -clock clock  1  [get_ports {h9[6]}]
set_input_delay -clock clock  1  [get_ports {h9[5]}]
set_input_delay -clock clock  1  [get_ports {h9[4]}]
set_input_delay -clock clock  1  [get_ports {h9[3]}]
set_input_delay -clock clock  1  [get_ports {h9[2]}]
set_input_delay -clock clock  1  [get_ports {h9[1]}]
set_input_delay -clock clock  1  [get_ports {h9[0]}]
set_input_delay -clock clock  1  [get_ports {h10[15]}]
set_input_delay -clock clock  1  [get_ports {h10[14]}]
set_input_delay -clock clock  1  [get_ports {h10[13]}]
set_input_delay -clock clock  1  [get_ports {h10[12]}]
set_input_delay -clock clock  1  [get_ports {h10[11]}]
set_input_delay -clock clock  1  [get_ports {h10[10]}]
set_input_delay -clock clock  1  [get_ports {h10[9]}]
set_input_delay -clock clock  1  [get_ports {h10[8]}]
set_input_delay -clock clock  1  [get_ports {h10[7]}]
set_input_delay -clock clock  1  [get_ports {h10[6]}]
set_input_delay -clock clock  1  [get_ports {h10[5]}]
set_input_delay -clock clock  1  [get_ports {h10[4]}]
set_input_delay -clock clock  1  [get_ports {h10[3]}]
set_input_delay -clock clock  1  [get_ports {h10[2]}]
set_input_delay -clock clock  1  [get_ports {h10[1]}]
set_input_delay -clock clock  1  [get_ports {h10[0]}]
set_input_delay -clock clock  1  [get_ports {h11[15]}]
set_input_delay -clock clock  1  [get_ports {h11[14]}]
set_input_delay -clock clock  1  [get_ports {h11[13]}]
set_input_delay -clock clock  1  [get_ports {h11[12]}]
set_input_delay -clock clock  1  [get_ports {h11[11]}]
set_input_delay -clock clock  1  [get_ports {h11[10]}]
set_input_delay -clock clock  1  [get_ports {h11[9]}]
set_input_delay -clock clock  1  [get_ports {h11[8]}]
set_input_delay -clock clock  1  [get_ports {h11[7]}]
set_input_delay -clock clock  1  [get_ports {h11[6]}]
set_input_delay -clock clock  1  [get_ports {h11[5]}]
set_input_delay -clock clock  1  [get_ports {h11[4]}]
set_input_delay -clock clock  1  [get_ports {h11[3]}]
set_input_delay -clock clock  1  [get_ports {h11[2]}]
set_input_delay -clock clock  1  [get_ports {h11[1]}]
set_input_delay -clock clock  1  [get_ports {h11[0]}]
set_input_delay -clock clock  1  [get_ports {h12[15]}]
set_input_delay -clock clock  1  [get_ports {h12[14]}]
set_input_delay -clock clock  1  [get_ports {h12[13]}]
set_input_delay -clock clock  1  [get_ports {h12[12]}]
set_input_delay -clock clock  1  [get_ports {h12[11]}]
set_input_delay -clock clock  1  [get_ports {h12[10]}]
set_input_delay -clock clock  1  [get_ports {h12[9]}]
set_input_delay -clock clock  1  [get_ports {h12[8]}]
set_input_delay -clock clock  1  [get_ports {h12[7]}]
set_input_delay -clock clock  1  [get_ports {h12[6]}]
set_input_delay -clock clock  1  [get_ports {h12[5]}]
set_input_delay -clock clock  1  [get_ports {h12[4]}]
set_input_delay -clock clock  1  [get_ports {h12[3]}]
set_input_delay -clock clock  1  [get_ports {h12[2]}]
set_input_delay -clock clock  1  [get_ports {h12[1]}]
set_input_delay -clock clock  1  [get_ports {h12[0]}]
set_input_delay -clock clock  1  [get_ports {h13[15]}]
set_input_delay -clock clock  1  [get_ports {h13[14]}]
set_input_delay -clock clock  1  [get_ports {h13[13]}]
set_input_delay -clock clock  1  [get_ports {h13[12]}]
set_input_delay -clock clock  1  [get_ports {h13[11]}]
set_input_delay -clock clock  1  [get_ports {h13[10]}]
set_input_delay -clock clock  1  [get_ports {h13[9]}]
set_input_delay -clock clock  1  [get_ports {h13[8]}]
set_input_delay -clock clock  1  [get_ports {h13[7]}]
set_input_delay -clock clock  1  [get_ports {h13[6]}]
set_input_delay -clock clock  1  [get_ports {h13[5]}]
set_input_delay -clock clock  1  [get_ports {h13[4]}]
set_input_delay -clock clock  1  [get_ports {h13[3]}]
set_input_delay -clock clock  1  [get_ports {h13[2]}]
set_input_delay -clock clock  1  [get_ports {h13[1]}]
set_input_delay -clock clock  1  [get_ports {h13[0]}]
set_input_delay -clock clock  1  [get_ports {h14[15]}]
set_input_delay -clock clock  1  [get_ports {h14[14]}]
set_input_delay -clock clock  1  [get_ports {h14[13]}]
set_input_delay -clock clock  1  [get_ports {h14[12]}]
set_input_delay -clock clock  1  [get_ports {h14[11]}]
set_input_delay -clock clock  1  [get_ports {h14[10]}]
set_input_delay -clock clock  1  [get_ports {h14[9]}]
set_input_delay -clock clock  1  [get_ports {h14[8]}]
set_input_delay -clock clock  1  [get_ports {h14[7]}]
set_input_delay -clock clock  1  [get_ports {h14[6]}]
set_input_delay -clock clock  1  [get_ports {h14[5]}]
set_input_delay -clock clock  1  [get_ports {h14[4]}]
set_input_delay -clock clock  1  [get_ports {h14[3]}]
set_input_delay -clock clock  1  [get_ports {h14[2]}]
set_input_delay -clock clock  1  [get_ports {h14[1]}]
set_input_delay -clock clock  1  [get_ports {h14[0]}]
set_input_delay -clock clock  1  [get_ports {h15[15]}]
set_input_delay -clock clock  1  [get_ports {h15[14]}]
set_input_delay -clock clock  1  [get_ports {h15[13]}]
set_input_delay -clock clock  1  [get_ports {h15[12]}]
set_input_delay -clock clock  1  [get_ports {h15[11]}]
set_input_delay -clock clock  1  [get_ports {h15[10]}]
set_input_delay -clock clock  1  [get_ports {h15[9]}]
set_input_delay -clock clock  1  [get_ports {h15[8]}]
set_input_delay -clock clock  1  [get_ports {h15[7]}]
set_input_delay -clock clock  1  [get_ports {h15[6]}]
set_input_delay -clock clock  1  [get_ports {h15[5]}]
set_input_delay -clock clock  1  [get_ports {h15[4]}]
set_input_delay -clock clock  1  [get_ports {h15[3]}]
set_input_delay -clock clock  1  [get_ports {h15[2]}]
set_input_delay -clock clock  1  [get_ports {h15[1]}]
set_input_delay -clock clock  1  [get_ports {h15[0]}]
set_output_delay -clock clock  1  [get_ports {y_out[31]}]
set_output_delay -clock clock  1  [get_ports {y_out[30]}]
set_output_delay -clock clock  1  [get_ports {y_out[29]}]
set_output_delay -clock clock  1  [get_ports {y_out[28]}]
set_output_delay -clock clock  1  [get_ports {y_out[27]}]
set_output_delay -clock clock  1  [get_ports {y_out[26]}]
set_output_delay -clock clock  1  [get_ports {y_out[25]}]
set_output_delay -clock clock  1  [get_ports {y_out[24]}]
set_output_delay -clock clock  1  [get_ports {y_out[23]}]
set_output_delay -clock clock  1  [get_ports {y_out[22]}]
set_output_delay -clock clock  1  [get_ports {y_out[21]}]
set_output_delay -clock clock  1  [get_ports {y_out[20]}]
set_output_delay -clock clock  1  [get_ports {y_out[19]}]
set_output_delay -clock clock  1  [get_ports {y_out[18]}]
set_output_delay -clock clock  1  [get_ports {y_out[17]}]
set_output_delay -clock clock  1  [get_ports {y_out[16]}]
set_output_delay -clock clock  1  [get_ports {y_out[15]}]
set_output_delay -clock clock  1  [get_ports {y_out[14]}]
set_output_delay -clock clock  1  [get_ports {y_out[13]}]
set_output_delay -clock clock  1  [get_ports {y_out[12]}]
set_output_delay -clock clock  1  [get_ports {y_out[11]}]
set_output_delay -clock clock  1  [get_ports {y_out[10]}]
set_output_delay -clock clock  1  [get_ports {y_out[9]}]
set_output_delay -clock clock  1  [get_ports {y_out[8]}]
set_output_delay -clock clock  1  [get_ports {y_out[7]}]
set_output_delay -clock clock  1  [get_ports {y_out[6]}]
set_output_delay -clock clock  1  [get_ports {y_out[5]}]
set_output_delay -clock clock  1  [get_ports {y_out[4]}]
set_output_delay -clock clock  1  [get_ports {y_out[3]}]
set_output_delay -clock clock  1  [get_ports {y_out[2]}]
set_output_delay -clock clock  1  [get_ports {y_out[1]}]
set_output_delay -clock clock  1  [get_ports {y_out[0]}]
