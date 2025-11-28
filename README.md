# 16-TAP FIR FILTER

ASIC implementation of a 16-tap FIR (Finite Impulse Response) low-pass filter, taken all the way from RTL to signoff using a standard industrial flow (synthesis → scan insertion → physical design → timing signoff).

---

## 1. Overview

This project implements a **16-tap FIR filter** in Verilog and runs it through a **complete ASIC flow** using Synopsys tools and the **SAED14 nm** technology files.  
The flow covers:

- RTL design (filter datapath + arithmetic building blocks)
- Logic synthesis
- Scan insertion and DFT reports
- Physical design (floorplan → place → CTS → route)
- Static timing analysis (setup/hold)
- Final signoff reports and logs

All scripts are included so the full flow can be rerun in a Synopsys environment.

---

## 2. FIR Filter Architecture

High-level datapath:

- 16-tap FIR filter with a MAC-style structure  
- Uses:
  - `booth_multiplier_16x16.v` – signed 16×16 Booth multiplier  
  - `ripple_carry_adder.v` + `full_adder.v` / `half_adder.v` – addition tree
- Designed as a **synchronous, fully-registered** filter for ASIC implementation.

(You can update this section with exact word length, coefficient format, and filter specs.)

---

## 3. ASIC Flow Summary

The project is organized to follow a typical Synopsys-based flow:

1. **RTL → Gate-Level Netlist (Design Compiler)**  
   - Reads RTL (`RTL/`) and constraint files (`fir_filter.sdc`, `fir_filter_gen.sdc`).  
   - Generates `fir_filter_netlist.v` and synthesis reports in `report/`.

2. **Scan Insertion / DFT**  
   - Uses gate-level netlist as input.  
   - Inserts scan chains and generates testability reports under `Scan_Insertion/`.

3. **Physical Design (ICC2)**  
   - Imports the scan-inserted netlist and constraints.  
   - Runs:
     - Floorplanning & power planning
     - Placement
     - Clock tree synthesis (CTS)
     - Routing

4. **Static Timing Analysis (PrimeTime)**  
   - Uses final routed netlist and extracted parasitics.  
   - Setup/hold timing reports are stored under `PrimeTime/report/`.

5. **Outputs / Plots**  
   - Figures (waveforms, layout screenshots, timing plots, etc.) are stored in `outputs/` for documentation.

---

## 4. Repository Structure

```text
RTL/
  booth_multiplier_16x16.v     # 16×16 Booth multiplier
  fir_filter_16_tap.v          # Top-level FIR filter
  full_adder.v
  half_adder.v
  ripple_carry_adder.v

Scan_Insertion/
  RTL/                         # Scan-ready RTL copies
  fir_filter.ddc
  fir_filter.sdc
  fir_filter_gen.sdc
  fir_filter_netlist.v
  report/                      # DFT, area, power, timing reports
  script.tcl                   # Scan insertion script

physical_design/
  common_setup.tcl
  data_preparation.tcl
  floorplan.tcl
  placement.tcl
  cts.tcl
  route.tcl
  mcmm.tcl
  post_route_reports.tcl
  report/                      # DRC, timing, log files

PrimeTime/
  fir_filter_gen.sdc
  fir_filter_netlist.v
  pt_script.tcl
  report/                      # STA reports (setup/hold/capacitance)

report/
  area.rpt
  power.rpt
  clock_gating.rpt
  timing.rpt
  timing_setup.rpt
  timing_hold.rpt

outputs/
  ...                          # Images/plots for documentation (waveforms, layout, etc.)

dc_scripts_lp.tcl              # Synthesis script
fir_filter.sdc                 # Base timing constraints
fir_filter_gen.sdc             # Generated / more detailed constraints
fir_filter_netlist.v           # Synthesized netlist
default.svf                    # Scan/DFT SVF file
