
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Grey_Counter -dir "C:/Embedded Projects/Grey_Counter/Grey_Counter/planAhead_run_1" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Embedded Projects/Grey_Counter/Grey_Counter/Counters_grey.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Embedded Projects/Grey_Counter/Grey_Counter} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Counters_grey.ucf" [current_fileset -constrset]
add_files [list {Counters_grey.ucf}] -fileset [get_property constrset [current_run]]
link_design
