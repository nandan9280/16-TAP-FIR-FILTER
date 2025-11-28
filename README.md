# ASIC Implementation of a 16-Tap FIR Low-Pass Filter (RTL to Signoff + UPF Low-Power Flow)

ASIC implementation of a **16-tap FIR (Finite Impulse Response) low-pass filter**, taken all the way from **RTL to signoff** using a standard industrial flow:

> RTL → Synthesis → Scan Insertion → Physical Design → Timing Signoff → Low-Power (UPF) Analysis

The flow is built around **Synopsys tools** and **SAED 14 nm** technology files.

---

## 1. Overview

This project implements a 16-tap FIR filter in Verilog and runs it through a complete ASIC flow using Synopsys tools and SAED14 nm technology.

The flow covers:

- RTL design (filter datapath + arithmetic building blocks)  
- Logic synthesis (Design Compiler)
- Scan insertion and DFT reports  
- Physical design (ICC2)
  - Floorplan → power plan → place → CTS → route
- Static timing analysis (PrimeTime) – setup and hold  
- Final signoff reports and logs  
- **Low-power analysis using UPF** (power intent, UPF vs normal power comparison)

All scripts are included so the full flow can be rerun in a Synopsys environment (after updating library and path variables for your setup).

---

## 2. FIR Filter Architecture

High-level datapath:

- **16-tap FIR filter** with a MAC-style structure  
- Uses:
  - `booth_multiplier_16x16.v` – signed 16×16 Booth multiplier  
  - `ripple_carry_adder.v`, `full_adder.v`, `half_adder.v` – adder / accumulation tree  
- Designed as a **synchronous, fully-registered filter** intended for ASIC implementation.

> You can extend this section later with:
> - Input/coeff word length  
> - Coefficient format (fixed-point Q-format)  
> - Cutoff frequency / sample rate / filter spec

---

## 3. ASIC Flow Summary

The project is organized to follow a typical **Synopsys-based ASIC flow**.

### 3.1 RTL → Gate-Level Netlist (Design Compiler)

- Reads RTL from `RTL/`
- Uses constraint files:
  - `fir_filter.sdc`
  - `fir_filter_gen.sdc`
- DC script:
  - `dc_scripts_lp.tcl`
- Generates:
  - `fir_filter_netlist.v` (synthesized netlist)
  - `fir_filter.ddc`
  - Area / power / timing / QoR reports under `report/`

### 3.2 Scan Insertion / DFT

Directory: `Scan_Insertion/`

- Input: gate-level netlist from synthesis  
- Output: scan-inserted netlist + DFT reports

Contents:

- `Scan_Insertion/RTL/` – scan-ready RTL copies  
- `Scan_Insertion/fir_filter.ddc`  
- `Scan_Insertion/fir_filter.sdc`  
- `Scan_Insertion/fir_filter_gen.sdc`  
- `Scan_Insertion/fir_filter_netlist.v`  
- `Scan_Insertion/report/` – area, power, QoR, timing, clock-gating reports  
- `Scan_Insertion/script.tcl` – scan insertion script  

### 3.3 Physical Design (ICC2)

Directory: `physical_design/`

The routed layout and signoff-ready netlist are generated using ICC2.

Main scripts:

- `common_setup.tcl`
- `data_preparation.tcl`
- `floorplan.tcl`
- `placement.tcl`
- `cts.tcl`
- `route.tcl`
- `mcmm.tcl`
- `post_route_reports.tcl`

Reports and logs (under `physical_design/report/`):

- `final_setup_timing.rpt`
- `final_drc_full.rpt`
- `final_drc_summary.rpt`
- `icc2_output.txt`
- `icc2_command.log`
- Other timing/DRC/congestion-related reports

Internal ICC2 libraries / checkpoints:

- `physical_design/lib/`  
- `physical_design/post_import_design/`  

### 3.4 Static Timing Analysis (PrimeTime)

Directory: `PrimeTime/`

PrimeTime is used for final **setup/hold timing signoff** with extracted parasitics.

Key files:

- `PrimeTime/fir_filter_netlist.v`  
- `PrimeTime/fir_filter_gen.sdc`  
- `PrimeTime/pt_script.tcl`

Reports under `PrimeTime/report/`:

- `timing.rpt` – overall timing summary  
- `hold.timing.rpt` – hold analysis  
- `su.timing.rpt` – setup analysis  
- `timing.tran.cap.rpt` – transition / capacitance checks  

---

## 4. Low-Power Flow Using UPF

Directory: `UPF/`

This part of the project demonstrates a **UPF-based low-power flow** for the same 16-tap FIR filter.

### 4.1 UPF Files and Scripts

- `UPF/fir_filter.upf`  
  - Power intent file (power domains, supply nets, isolation/level-shifting where applicable)
- `UPF/fir_filter.sdc`  
  - Timing constraints for UPF synthesis / analysis
- `UPF/fir_filter_netlist.v`  
  - Netlist used in the UPF flow
- `UPF/dc_scripts_upf.tcl`  
  - Design Compiler script for low-power-aware synthesis using UPF

### 4.2 UPF Reports

UPF vs normal flow comparison reports located in `UPF/report/`:

- `area.rpt`
- `clock_gating.rpt`
- `hold_upf.rpt`
- `power_normal.rpt`
- `power_upf.rpt`
- `qor.rpt`
- `setup_upf.rpt`
- `timing.rpt`

These let you compare:

- Area overhead due to low-power structures  
- Normal vs UPF-aware power (`power_normal.rpt` vs `power_upf.rpt`)  
- Timing impact (setup/hold) under power intent  

### 4.3 UPF Figures

Directory: `UPF/outputs/`:

- `synthesis.png` – synthesis / low-power synthesis summary  
- `upf-diagram.png` – high-level diagram of UPF power domains / supply structure  
- `upf_table.png` – comparison table of key metrics (e.g. normal vs UPF power numbers)

These are intended for **documentation and presentations**.

---

## 5. Repository Structure

```text
RTL/
  booth_multiplier_16x16.v      # 16×16 Booth multiplier
  fir_filter_16_tap.v           # Top-level FIR filter
  full_adder.v
  half_adder.v
  ripple_carry_adder.v

Scan_Insertion/
  RTL/                          # Scan-ready RTL copies
  fir_filter.ddc
  fir_filter.sdc
  fir_filter_gen.sdc
  fir_filter_netlist.v
  report/                       # DFT, area, power, timing reports
  script.tcl                    # Scan insertion script

physical_design/
  common_setup.tcl
  data_preparation.tcl
  floorplan.tcl
  placement.tcl
  cts.tcl
  route.tcl
  mcmm.tcl
  post_route_reports.tcl
  lib/                          # ICC2 libraries / checkpoints
  post_import_design/           # Imported design DBs
  report/                       # DRC, timing and log files

PrimeTime/
  fir_filter_gen.sdc
  fir_filter_netlist.v
  pt_script.tcl
  report/                       # STA (setup/hold/capacitance) reports

UPF/
  dc_scripts_upf.tcl            # Low-power synthesis script
  fir_filter.sdc                # Constraints for UPF flow
  fir_filter.upf                # Power intent (UPF)
  fir_filter_netlist.v          # Netlist for UPF flow
  report/                       # Area, power (normal vs UPF), timing, QoR
  outputs/                      # UPF diagrams / tables (PNG)

report/
  area.rpt
  power.rpt
  clock_gating.rpt
  timing.rpt
  timing_setup.rpt
  timing_hold.rpt

outputs/
  ...                           # Images/plots for documentation (waveforms, layout, etc.)

dc_scripts_lp.tcl               # Main synthesis script (normal flow)
fir_filter.sdc                  # Base timing constraints
fir_filter_gen.sdc              # Generated / detailed constraints
fir_filter_netlist.v            # Synthesized netlist
default.svf                     # Scan/DFT SVF file
