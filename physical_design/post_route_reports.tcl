# Generate reports

catch {file mkdir report}
report_drc -summary > ./report/final_drc_summary.rpt
report_drc > ./report/final_drc_full.rpt

report_timing -max_paths 100 -delay_type max -path_type full -significant_digits 4 > ./report/final_setup_timing.rpt
report_timing -max_paths 100 -delay_type min -path_type full -significant_digits 4 > ./report/final_hold_timing.rpt

report_qor -summary > ./report/final_qor_summary.rpt
report_qor > ./report/final_qor_full.rpt

create_utilization_configuration -scope block core_utilization -include {all}
report_utilization -config core_utilization > ./report/final_utilization.rpt

report_power > ./report/final_power.rpt

report_net_fanout > ./report/final_net_fanout.rpt
report_via > ./report/final_via_summary.rpt
report_violations -all > ./report/final_violations.rpt