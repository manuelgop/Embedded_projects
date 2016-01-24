
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Mayority_Detector -dir "C:/Projectos_VHDL/Mayority_Detector/planAhead_run_1" -part xc3s100ecp132-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Projectos_VHDL/Mayority_Detector/Mayority_detector.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Projectos_VHDL/Mayority_Detector} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Mayority_detector.ucf" [current_fileset -constrset]
add_files [list {Mayority_detector.ucf}] -fileset [get_property constrset [current_run]]
link_design
