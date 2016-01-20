
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name BasicGates -dir "D:/Embedded Projects/P01/BasicGates/planAhead_run_1" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Embedded Projects/P01/BasicGates/BasicGates.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Embedded Projects/P01/BasicGates} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "BasicGates.ucf" [current_fileset -constrset]
add_files [list {BasicGates.ucf}] -fileset [get_property constrset [current_run]]
link_design
