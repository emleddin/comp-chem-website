---
title: Caver Input
sidebar: other_skills_sidebar
permalink: /Otherguide-caver-input.html
folder: other_skills
---

<!-- <link rel="stylesheet" href="css/theme-blue.css"> -->

The input file contains a lot of information. Each of the keywords is
described in the [CAVER documentation](http://caver.cz/index.php?sid=132).

A particular PDB residue or atom number in the PDB can be specified with
`starting_point_residue` or `starting_point_atom`. It is suggested that you
use a cofactor or inhibitor for these keywords.

```bash
#*****************************
# CALCULATION SETUP      
#*****************************
load_tunnels no
load_cluster_tree no
stop_after never

#*****************************
# INPUT DATA       
#*****************************
time_sparsity 1
first_frame 1
last_frame 1
#last_frame 100000

#*****************************
# TUNNEL CALCULATION
#*****************************

## RES 601 ==  MN
#starting_point_atom 7263
starting_point_residue 603
#starting_point_coordinates

## Default probe = 0.9, shell_rad = 3, shell_depth = 4
probe_radius 0.9
shell_radius 3
shell_depth 4


#*****************************
# TUNNEL CLUSTERING
#*****************************
clustering average_link
weighting_coefficient 1
clustering_threshold 3.5

exclude_start_zone 2
exclude_end_zone 0
min_middle_zone 5
save_zones no


#*****************************
# GENERATION OF OUTPUTS
#*****************************
one_tunnel_in_snapshot cheapest
max_output_clusters 999
save_dynamics_visualization yes
#save_dynamics_visualization no

generate_summary yes
generate_tunnel_characteristics yes
generate_tunnel_profiles yes

generate_histograms no
bottleneck_histogram 0.0 2.0 20
throughput_histogram 0 1.0 10

generate_bottleneck_heat_map no
bottleneck_heat_map_range 1.0 2.0
bottleneck_heat_map_element_size 10 10

generate_profile_heat_map yes
profile_heat_map_resolution 0.5
profile_heat_map_range 1.0 2.0
profile_heat_map_element_size 20 10

compute_tunnel_residues yes
residue_contact_distance 3.0

compute_bottleneck_residues yes
bottleneck_contact_distance 3.0


#*****************************
# ADVANCED SETTINGS
#*****************************

#-----------------------------
# Starting point optimization
#-----------------------------
#max_distance 3
#desired_radius 5
max_distance 10
desired_radius 5

#-----------------------------
# Advanced tunnel calculation
#-----------------------------
#number_of_approximating_balls 12
number_of_approximating_balls 20
add_central_sphere yes

max_number_of_tunnels 10000
max_limiting_radius 100

cost_function_exponent 2

automatic_shell_radius no
automatic_shell_radius_bottleneck_multiplier 2
starting_point_protection_radius 4

#-----------------------------
# Redundant tunnels removal
#-----------------------------
frame_clustering yes
frame_weighting_coefficient 1
frame_clustering_threshold 1

frame_exclude_start_zone 0
frame_exclude_end_zone 0
frame_min_middle_zone 5

#-----------------------------
# Averaging of tunnel ends
#-----------------------------
average_surface_frame yes
average_surface_global yes

average_surface_smoothness_angle 10
average_surface_point_min_angle 5
average_surface_tunnel_sampling_step 0.5

#-----------------------------
# Approximate clustering
#-----------------------------
do_approximate_clustering no
cluster_by_hierarchical_clustering 20000
max_training_clusters 15
generate_unclassified_cluster no

#-----------------------------
# Outputs
#-----------------------------
profile_tunnel_sampling_step 0.5
visualization_tunnel_sampling_step 1

visualize_tunnels_per_cluster 5000
visualization_subsampling random

compute_errors no
save_error_profiles no

#path_to_vmd "C:/Program Files/University of Illinois/VMD/vmd.exe"
path_to_vmd /usr/local/bin/vmd
generate_trajectory no

#-----------------------------
# Others
#-----------------------------
swap yes
seed 1    #no default, if missing, the seed is random

```


{% include links.html %}
