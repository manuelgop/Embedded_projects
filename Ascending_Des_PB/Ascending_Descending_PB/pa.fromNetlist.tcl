
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Ascending_Descending_PB -dir "C:/Embedded Projects/Ascending_Des_PB/Ascending_Descending_PB/planAhead_run_1" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Embedded Projects/Ascending_Des_PB/Ascending_Descending_PB/Seven_segment.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Embedded Projects/Ascending_Des_PB/Ascending_Descending_PB} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Seven_segment.ucf" [current_fileset -constrset]
add_files [list {Seven_segment.ucf}] -fileset [get_property constrset [current_run]]
link_design
