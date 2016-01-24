
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Seven_Seg_Counter -dir "C:/Embedded Projects/Seven_Seg_Counter/planAhead_run_5" -part xc3s100ecp132-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Embedded Projects/Seven_Seg_Counter/Seven_segment.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Embedded Projects/Seven_Seg_Counter} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Seven_segment.ucf" [current_fileset -constrset]
add_files [list {Seven_segment.ucf}] -fileset [get_property constrset [current_run]]
link_design
