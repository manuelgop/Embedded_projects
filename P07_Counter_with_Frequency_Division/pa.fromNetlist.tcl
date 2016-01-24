
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name P06_Counters -dir "C:/Embedded Projects/P07_Counter_with_Frequency_Division/planAhead_run_1" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Embedded Projects/P07_Counter_with_Frequency_Division/Counters.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Embedded Projects/P07_Counter_with_Frequency_Division} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Counters.ucf" [current_fileset -constrset]
add_files [list {Counters.ucf}] -fileset [get_property constrset [current_run]]
link_design
