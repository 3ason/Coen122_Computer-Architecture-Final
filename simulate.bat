@echo off
REM ****************************************************************************
REM Vivado (TM) v2022.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Fri Jun 09 11:56:37 -0700 2023
REM SW Build 3526262 on Mon Apr 18 15:48:16 MDT 2022
REM
REM IP Build 3524634 on Mon Apr 18 20:55:01 MDT 2022
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim datapath_testbench_behav -key {Behavioral:sim_1:Functional:datapath_testbench} -tclbatch datapath_testbench.tcl -view C:/Users/eliu/final_project/datapath_testbench_behav_LAB_DEMO_WAVEFORMS.wcfg -log simulate.log"
call xsim  datapath_testbench_behav -key {Behavioral:sim_1:Functional:datapath_testbench} -tclbatch datapath_testbench.tcl -view C:/Users/eliu/final_project/datapath_testbench_behav_LAB_DEMO_WAVEFORMS.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
