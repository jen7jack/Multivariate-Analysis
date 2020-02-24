version 15
*HW ASSIGNMENT #7 -- MDS ON SELECT NYS CITIES

* APSTA.GE 2004
* Homework 7
* Jennifer Jackson

clear
input str10 rowname double(Albany Buffalo Ithaca Kingston NewYork Rochester Syracuse Troy Utica)
Albany 	0	260.3338	140.5325	51.6374	134.6826	198.2539	124.1999	6.1795	80.9409
Buffalo 	260.3338	0	124.5809	257.7155	292.4827	66.7914	138.5566	263.1657	184.8746
Ithaca 	140.5325	124.5809	0	133.1354	175.9575	74.9567	45.4658	144.3298	78.7869
Kingston	51.6374	257.7155	133.1354	0	83.9216	202.7803	134.1972	57.5439	102.6728
NewYork 	134.6826	292.4827	175.9575	83.9216	0	250.9137	195.415	140.2448	176.6936
Rochester 	198.2539	66.7914	74.9567	202.7803	250.9137	0	74.258	200.4967	120.0226
Syracuse 	124.1999	138.5566	45.4658	134.1972	195.415	74.258	0	126.291	46.3248
Troy	6.1795	263.1657	144.3298	57.5439	140.2448	200.4967	126.291	0	82.1307
Utica	80.9409	184.8746	78.7869	102.6728	176.6936	120.0226	46.3248	82.1307	0
end
mkmat Albany - Utica, matrix(NYS_distances2) rownames (rowname)

global names Albany Buffalo Ithaca Kingston NewYork Rochester Syracuse Troy Utica
matrix rownames NYS_distances2 = $names
matrix colnames NYS_distances2 = $names
matrix list NYS_distances2

* Map the Nine Cities
mdsmat NYS_distances2, method(modern)
* 16 iterations
* stress = .00001208

mdsmat NYS_distances2, method(modern) initialize(random)
* 89 iterations
* stress = .00001208

mdsmat NYS_distances2, method(modern) protect(50)
* stress = .00001209

* Because the different starting points and number of iterations gave the
* same stress, it seems that it is a global minimum, not a local minimum.

* Comparing the graph to Google’s map of New York State, it is clear that the
* cities are all spaced appropriately: Buffalo is the furthest west, New York
* the furthest south, Albany is north of New York, etc. There was no need to
* reflect the dimensions.


