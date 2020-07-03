clear
reset
set encoding iso_8859_1
set grid

set term postscript eps enhanced color "Courier,19"


set datafile missing "NaN"

set size 0.6,0.5

#set yrang [0:1]



###########################################################################################
################################ Time plots Time Vs #Data  ################################
###########################################################################################

#set key top left
#set key  reverse Left 
#unset key
unset yrang
unset logscale y
set ylabel "Time (seconds)" font "Courier,24"
set xlabel "# data" font "Courier,24"
unset key
#set xtics (10,100,1000,10000)
#set xrang [10:10000]

set xtics (10,100,200,300,400,500)
set xrang [10:500]

set output "plots/p=1_impurity=0.50.eps"
plot "output/p=1_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=1_impurity=0.60.eps"
plot "output/p=1_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=1_impurity=0.70.eps"
plot "output/p=1_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=1_impurity=0.80.eps"
plot "output/p=1_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=1_impurity=0.90.eps"
plot "output/p=1_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=1_impurity=1.00.eps"
plot "output/p=1_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_impurity=1.00.eps"
plot "output/p=2_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_impurity=0.50.eps"
plot "output/p=2_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_impurity=0.60.eps"
plot "output/p=2_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_impurity=0.70.eps"
plot "output/p=2_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_impurity=0.80.eps"
plot "output/p=2_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_impurity=0.90.eps"
plot "output/p=2_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_impurity=1.00.eps"
plot "output/p=2_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_impurity=1.00.eps"
plot "output/p=3_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_impurity=0.50.eps"
plot "output/p=3_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_impurity=0.60.eps"
plot "output/p=3_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_impurity=0.70.eps"
plot "output/p=3_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_impurity=0.80.eps"
plot "output/p=3_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_impurity=0.90.eps"
plot "output/p=3_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_impurity=1.00.eps"
plot "output/p=3_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_impurity=1.00.eps"
plot "output/p=4_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_impurity=0.50.eps"
plot "output/p=4_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_impurity=0.60.eps"
plot "output/p=4_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_impurity=0.70.eps"
plot "output/p=4_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_impurity=0.80.eps"
plot "output/p=4_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_impurity=0.90.eps"
plot "output/p=4_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_impurity=1.00.eps"
plot "output/p=4_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_impurity=1.00.eps"
plot "output/p=5_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_impurity=0.50.eps"
plot "output/p=5_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_impurity=0.60.eps"
plot "output/p=5_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_impurity=0.70.eps"
plot "output/p=5_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_impurity=0.80.eps"
plot "output/p=5_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_impurity=0.90.eps"
plot "output/p=5_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_impurity=1.00.eps"
plot "output/p=5_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_impurity=1.00.eps"
plot "output/p=6_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_impurity=0.50.eps"
plot "output/p=6_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_impurity=0.60.eps"
plot "output/p=6_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_impurity=0.70.eps"
plot "output/p=6_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_impurity=0.80.eps"
plot "output/p=6_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_impurity=0.90.eps"
plot "output/p=6_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_impurity=1.00.eps"
plot "output/p=6_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_impurity=1.00.eps"
plot "output/p=7_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_impurity=0.50.eps"
plot "output/p=7_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_impurity=0.60.eps"
plot "output/p=7_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_impurity=0.70.eps"
plot "output/p=7_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_impurity=0.80.eps"
plot "output/p=7_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_impurity=0.90.eps"
plot "output/p=7_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_impurity=1.00.eps"
plot "output/p=7_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_impurity=1.00.eps"
plot "output/p=8_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_impurity=0.50.eps"
plot "output/p=8_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_impurity=0.60.eps"
plot "output/p=8_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_impurity=0.70.eps"
plot "output/p=8_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_impurity=0.80.eps"
plot "output/p=8_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_impurity=0.90.eps"
plot "output/p=8_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_impurity=1.00.eps"
plot "output/p=8_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_impurity=1.00.eps"
plot "output/p=9_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_impurity=0.50.eps"
plot "output/p=9_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_impurity=0.60.eps"
plot "output/p=9_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_impurity=0.70.eps"
plot "output/p=9_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_impurity=0.80.eps"
plot "output/p=9_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_impurity=0.90.eps"
plot "output/p=9_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_impurity=1.00.eps"
plot "output/p=9_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_impurity=1.00.eps"
plot "output/p=10_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_impurity=0.50.eps"
plot "output/p=10_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_impurity=0.60.eps"
plot "output/p=10_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_impurity=0.70.eps"
plot "output/p=10_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_impurity=0.80.eps"
plot "output/p=10_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_impurity=0.90.eps"
plot "output/p=10_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_impurity=1.00.eps"
plot "output/p=10_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

###########################################################################################
################################ Time plots Time Vs #lambda  ################################
###########################################################################################

#set key top left
#set key  reverse Left 
#unset key
unset yrang
unset logscale y
set xlabel "Value of {/Symbol l}" font "Courier,24"
unset key
#set xtics (10,100,1000,10000)
#set xrang [10:10000]

set xtics (0.5,0.6,0.7,0.8,0.9,1.0)
set xrang [0.5:1.0]

set output "plots/p=1_data=10.eps"
plot "output/p=1_data=10.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_data=10.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_data=10.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_data=10.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=1_data=20.eps"
plot "output/p=1_data=20.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_data=20.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_data=20.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_data=20.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=1_data=30.eps"
plot "output/p=1_data=30.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_data=30.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_data=30.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_data=30.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=1_data=50.eps"
plot "output/p=1_data=50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_data=50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_data=50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_data=50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=1_data=100.eps"
plot "output/p=1_data=100.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_data=100.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_data=100.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_data=100.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=1_data=150.eps"
plot "output/p=1_data=150.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_data=150.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_data=150.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_data=150.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=1_data=200.eps"
plot "output/p=1_data=200.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_data=200.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_data=200.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_data=200.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=1_data=300.eps"
plot "output/p=1_data=300.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_data=300.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_data=300.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_data=300.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=1_data=400.eps"
plot "output/p=1_data=400.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_data=400.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_data=400.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_data=400.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=1_data=500.eps"
plot "output/p=1_data=500.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=1_data=500.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=1_data=500.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=1_data=500.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_data=10.eps"
plot "output/p=2_data=10.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_data=10.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_data=10.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_data=10.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_data=20.eps"
plot "output/p=2_data=20.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_data=20.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_data=20.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_data=20.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_data=30.eps"
plot "output/p=2_data=30.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_data=30.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_data=30.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_data=30.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_data=50.eps"
plot "output/p=2_data=50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_data=50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_data=50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_data=50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_data=100.eps"
plot "output/p=2_data=100.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_data=100.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_data=100.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_data=100.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_data=150.eps"
plot "output/p=2_data=150.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_data=150.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_data=150.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_data=150.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_data=200.eps"
plot "output/p=2_data=200.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_data=200.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_data=200.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_data=200.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_data=300.eps"
plot "output/p=2_data=300.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_data=300.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_data=300.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_data=300.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_data=400.eps"
plot "output/p=2_data=400.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_data=400.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_data=400.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_data=400.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=2_data=500.eps"
plot "output/p=2_data=500.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=2_data=500.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=2_data=500.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=2_data=500.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_data=10.eps"
plot "output/p=3_data=10.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_data=10.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_data=10.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_data=10.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_data=20.eps"
plot "output/p=3_data=20.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_data=20.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_data=20.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_data=20.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_data=30.eps"
plot "output/p=3_data=30.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_data=30.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_data=30.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_data=30.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_data=50.eps"
plot "output/p=3_data=50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_data=50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_data=50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_data=50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_data=100.eps"
plot "output/p=3_data=100.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_data=100.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_data=100.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_data=100.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_data=150.eps"
plot "output/p=3_data=150.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_data=150.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_data=150.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_data=150.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_data=200.eps"
plot "output/p=3_data=200.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_data=200.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_data=200.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_data=200.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_data=300.eps"
plot "output/p=3_data=300.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_data=300.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_data=300.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_data=300.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_data=400.eps"
plot "output/p=3_data=400.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_data=400.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_data=400.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_data=400.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=3_data=500.eps"
plot "output/p=3_data=500.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=3_data=500.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=3_data=500.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=3_data=500.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_data=10.eps"
plot "output/p=4_data=10.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_data=10.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_data=10.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_data=10.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_data=20.eps"
plot "output/p=4_data=20.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_data=20.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_data=20.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_data=20.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_data=30.eps"
plot "output/p=4_data=30.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_data=30.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_data=30.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_data=30.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_data=50.eps"
plot "output/p=4_data=50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_data=50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_data=50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_data=50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_data=100.eps"
plot "output/p=4_data=100.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_data=100.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_data=100.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_data=100.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_data=150.eps"
plot "output/p=4_data=150.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_data=150.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_data=150.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_data=150.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_data=200.eps"
plot "output/p=4_data=200.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_data=200.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_data=200.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_data=200.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_data=300.eps"
plot "output/p=4_data=300.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_data=300.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_data=300.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_data=300.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_data=400.eps"
plot "output/p=4_data=400.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_data=400.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_data=400.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_data=400.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=4_data=500.eps"
plot "output/p=4_data=500.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=4_data=500.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=4_data=500.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=4_data=500.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_data=10.eps"
plot "output/p=5_data=10.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_data=10.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_data=10.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_data=10.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_data=20.eps"
plot "output/p=5_data=20.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_data=20.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_data=20.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_data=20.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_data=30.eps"
plot "output/p=5_data=30.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_data=30.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_data=30.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_data=30.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_data=50.eps"
plot "output/p=5_data=50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_data=50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_data=50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_data=50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_data=100.eps"
plot "output/p=5_data=100.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_data=100.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_data=100.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_data=100.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_data=150.eps"
plot "output/p=5_data=150.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_data=150.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_data=150.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_data=150.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_data=200.eps"
plot "output/p=5_data=200.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_data=200.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_data=200.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_data=200.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_data=300.eps"
plot "output/p=5_data=300.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_data=300.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_data=300.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_data=300.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_data=400.eps"
plot "output/p=5_data=400.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_data=400.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_data=400.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_data=400.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=5_data=500.eps"
plot "output/p=5_data=500.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=5_data=500.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=5_data=500.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=5_data=500.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_data=10.eps"
plot "output/p=6_data=10.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_data=10.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_data=10.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_data=10.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_data=20.eps"
plot "output/p=6_data=20.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_data=20.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_data=20.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_data=20.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_data=30.eps"
plot "output/p=6_data=30.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_data=30.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_data=30.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_data=30.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_data=50.eps"
plot "output/p=6_data=50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_data=50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_data=50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_data=50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_data=100.eps"
plot "output/p=6_data=100.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_data=100.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_data=100.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_data=100.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_data=150.eps"
plot "output/p=6_data=150.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_data=150.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_data=150.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_data=150.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_data=200.eps"
plot "output/p=6_data=200.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_data=200.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_data=200.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_data=200.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_data=300.eps"
plot "output/p=6_data=300.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_data=300.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_data=300.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_data=300.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_data=400.eps"
plot "output/p=6_data=400.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_data=400.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_data=400.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_data=400.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=6_data=500.eps"
plot "output/p=6_data=500.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=6_data=500.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=6_data=500.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=6_data=500.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_data=10.eps"
plot "output/p=7_data=10.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_data=10.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_data=10.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_data=10.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_data=20.eps"
plot "output/p=7_data=20.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_data=20.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_data=20.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_data=20.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_data=30.eps"
plot "output/p=7_data=30.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_data=30.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_data=30.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_data=30.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_data=50.eps"
plot "output/p=7_data=50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_data=50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_data=50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_data=50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_data=100.eps"
plot "output/p=7_data=100.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_data=100.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_data=100.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_data=100.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_data=150.eps"
plot "output/p=7_data=150.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_data=150.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_data=150.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_data=150.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_data=200.eps"
plot "output/p=7_data=200.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_data=200.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_data=200.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_data=200.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_data=300.eps"
plot "output/p=7_data=300.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_data=300.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_data=300.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_data=300.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_data=400.eps"
plot "output/p=7_data=400.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_data=400.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_data=400.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_data=400.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=7_data=500.eps"
plot "output/p=7_data=500.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=7_data=500.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=7_data=500.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=7_data=500.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_data=10.eps"
plot "output/p=8_data=10.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_data=10.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_data=10.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_data=10.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_data=20.eps"
plot "output/p=8_data=20.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_data=20.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_data=20.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_data=20.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_data=30.eps"
plot "output/p=8_data=30.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_data=30.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_data=30.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_data=30.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_data=50.eps"
plot "output/p=8_data=50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_data=50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_data=50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_data=50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_data=100.eps"
plot "output/p=8_data=100.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_data=100.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_data=100.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_data=100.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_data=150.eps"
plot "output/p=8_data=150.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_data=150.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_data=150.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_data=150.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_data=200.eps"
plot "output/p=8_data=200.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_data=200.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_data=200.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_data=200.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_data=300.eps"
plot "output/p=8_data=300.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_data=300.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_data=300.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_data=300.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_data=400.eps"
plot "output/p=8_data=400.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_data=400.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_data=400.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_data=400.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=8_data=500.eps"
plot "output/p=8_data=500.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=8_data=500.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=8_data=500.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=8_data=500.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_data=10.eps"
plot "output/p=9_data=10.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_data=10.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_data=10.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_data=10.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_data=20.eps"
plot "output/p=9_data=20.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_data=20.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_data=20.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_data=20.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_data=30.eps"
plot "output/p=9_data=30.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_data=30.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_data=30.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_data=30.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_data=50.eps"
plot "output/p=9_data=50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_data=50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_data=50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_data=50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_data=100.eps"
plot "output/p=9_data=100.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_data=100.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_data=100.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_data=100.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_data=150.eps"
plot "output/p=9_data=150.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_data=150.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_data=150.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_data=150.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_data=200.eps"
plot "output/p=9_data=200.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_data=200.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_data=200.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_data=200.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_data=300.eps"
plot "output/p=9_data=300.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_data=300.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_data=300.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_data=300.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_data=400.eps"
plot "output/p=9_data=400.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_data=400.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_data=400.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_data=400.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=9_data=500.eps"
plot "output/p=9_data=500.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=9_data=500.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=9_data=500.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=9_data=500.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_data=10.eps"
plot "output/p=10_data=10.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_data=10.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_data=10.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_data=10.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_data=20.eps"
plot "output/p=10_data=20.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_data=20.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_data=20.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_data=20.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_data=30.eps"
plot "output/p=10_data=30.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_data=30.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_data=30.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_data=30.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_data=50.eps"
plot "output/p=10_data=50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_data=50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_data=50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_data=50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_data=100.eps"
plot "output/p=10_data=100.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_data=100.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_data=100.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_data=100.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_data=150.eps"
plot "output/p=10_data=150.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_data=150.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_data=150.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_data=150.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_data=200.eps"
plot "output/p=10_data=200.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_data=200.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_data=200.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_data=200.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_data=300.eps"
plot "output/p=10_data=300.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_data=300.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_data=300.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_data=300.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_data=400.eps"
plot "output/p=10_data=400.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_data=400.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_data=400.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_data=400.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/p=10_data=500.eps"
plot "output/p=10_data=500.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/p=10_data=500.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/p=10_data=500.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/p=10_data=500.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

###########################################################################################
############################ Performance Precision Vs Rate Pos #############################
###########################################################################################

set size 0.6,0.5


set xrang [1:10]
#set xtics nomirror rotate by -45
set ylabel "Time (seconds)" font "Courier,24"
set xlabel "Positive data" font "Courier,24"
set xtics (1,2,3,4,5,6,7,8,9,10)

set key top left
set key  reverse Left 
#set ylabel "Precision" font "Courier,22"
unset key

set output "plots/data=10_impurity=0.50.eps"
plot "output/data=10_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=10_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=10_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=10_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=20_impurity=0.50.eps"
plot "output/data=20_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=20_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=20_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=20_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=30_impurity=0.50.eps"
plot "output/data=30_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=30_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=30_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=30_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=50_impurity=0.50.eps"
plot "output/data=50_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=50_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=50_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=50_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=100_impurity=0.50.eps"
plot "output/data=100_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=100_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=100_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=100_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=150_impurity=0.50.eps"
plot "output/data=150_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=150_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=150_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=150_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=200_impurity=0.50.eps"
plot "output/data=200_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=200_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=200_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=200_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=300_impurity=0.50.eps"
plot "output/data=300_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=300_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=300_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=300_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=400_impurity=0.50.eps"
plot "output/data=400_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=400_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=400_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=400_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=500_impurity=0.50.eps"
plot "output/data=500_impurity=0.50.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=500_impurity=0.50.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=500_impurity=0.50.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=500_impurity=0.50.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=10_impurity=0.60.eps"
plot "output/data=10_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=10_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=10_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=10_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=20_impurity=0.60.eps"
plot "output/data=20_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=20_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=20_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=20_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=30_impurity=0.60.eps"
plot "output/data=30_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=30_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=30_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=30_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=50_impurity=0.60.eps"
plot "output/data=50_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=50_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=50_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=50_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=100_impurity=0.60.eps"
plot "output/data=100_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=100_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=100_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=100_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=150_impurity=0.60.eps"
plot "output/data=150_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=150_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=150_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=150_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=200_impurity=0.60.eps"
plot "output/data=200_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=200_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=200_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=200_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=300_impurity=0.60.eps"
plot "output/data=300_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=300_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=300_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=300_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=400_impurity=0.60.eps"
plot "output/data=400_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=400_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=400_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=400_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=500_impurity=0.60.eps"
plot "output/data=500_impurity=0.60.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=500_impurity=0.60.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=500_impurity=0.60.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=500_impurity=0.60.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=10_impurity=0.70.eps"
plot "output/data=10_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=10_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=10_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=10_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=20_impurity=0.70.eps"
plot "output/data=20_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=20_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=20_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=20_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=30_impurity=0.70.eps"
plot "output/data=30_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=30_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=30_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=30_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=50_impurity=0.70.eps"
plot "output/data=50_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=50_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=50_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=50_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=100_impurity=0.70.eps"
plot "output/data=100_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=100_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=100_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=100_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=150_impurity=0.70.eps"
plot "output/data=150_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=150_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=150_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=150_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=200_impurity=0.70.eps"
plot "output/data=200_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=200_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=200_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=200_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=300_impurity=0.70.eps"
plot "output/data=300_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=300_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=300_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=300_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=400_impurity=0.70.eps"
plot "output/data=400_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=400_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=400_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=400_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=500_impurity=0.70.eps"
plot "output/data=500_impurity=0.70.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=500_impurity=0.70.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=500_impurity=0.70.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=500_impurity=0.70.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=10_impurity=0.80.eps"
plot "output/data=10_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=10_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=10_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=10_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=20_impurity=0.80.eps"
plot "output/data=20_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=20_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=20_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=20_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=30_impurity=0.80.eps"
plot "output/data=30_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=30_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=30_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=30_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=50_impurity=0.80.eps"
plot "output/data=50_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=50_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=50_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=50_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=100_impurity=0.80.eps"
plot "output/data=100_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=100_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=100_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=100_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=150_impurity=0.80.eps"
plot "output/data=150_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=150_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=150_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=150_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=200_impurity=0.80.eps"
plot "output/data=200_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=200_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=200_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=200_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=300_impurity=0.80.eps"
plot "output/data=300_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=300_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=300_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=300_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=400_impurity=0.80.eps"
plot "output/data=400_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=400_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=400_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=400_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=500_impurity=0.80.eps"
plot "output/data=500_impurity=0.80.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=500_impurity=0.80.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=500_impurity=0.80.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=500_impurity=0.80.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=10_impurity=0.90.eps"
plot "output/data=10_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=10_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=10_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=10_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=20_impurity=0.90.eps"
plot "output/data=20_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=20_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=20_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=20_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=30_impurity=0.90.eps"
plot "output/data=30_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=30_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=30_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=30_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=50_impurity=0.90.eps"
plot "output/data=50_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=50_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=50_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=50_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=100_impurity=0.90.eps"
plot "output/data=100_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=100_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=100_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=100_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=150_impurity=0.90.eps"
plot "output/data=150_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=150_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=150_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=150_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=200_impurity=0.90.eps"
plot "output/data=200_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=200_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=200_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=200_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=300_impurity=0.90.eps"
plot "output/data=300_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=300_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=300_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=300_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=400_impurity=0.90.eps"
plot "output/data=400_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=400_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=400_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=400_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=500_impurity=0.90.eps"
plot "output/data=500_impurity=0.90.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=500_impurity=0.90.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=500_impurity=0.90.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=500_impurity=0.90.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=10_impurity=1.00.eps"
plot "output/data=10_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=10_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=10_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=10_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=20_impurity=1.00.eps"
plot "output/data=20_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=20_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=20_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=20_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=30_impurity=1.00.eps"
plot "output/data=30_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=30_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=30_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=30_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=50_impurity=1.00.eps"
plot "output/data=50_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=50_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=50_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=50_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=100_impurity=1.00.eps"
plot "output/data=100_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=100_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=100_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=100_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=150_impurity=1.00.eps"
plot "output/data=150_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=150_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=150_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=150_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=200_impurity=1.00.eps"
plot "output/data=200_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=200_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=200_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=200_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=300_impurity=1.00.eps"
plot "output/data=300_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=300_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=300_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=300_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=400_impurity=1.00.eps"
plot "output/data=400_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=400_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=400_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=400_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3

set output "plots/data=500_impurity=1.00.eps"
plot "output/data=500_impurity=1.00.tsv" using 1:($2) title 'TIME_MILP'  with linespoints lw 4 ps 1.95 pt 6 lc 2,\
 "output/data=500_impurity=1.00.tsv" using 1:($2):($3) title 'TIME_MILP'  with errorbars pt -1 lw 1 ps 1.95 lc 2,\
 "output/data=500_impurity=1.00.tsv" using 1:($4) title 'TIME_BF'  with linespoints lw 4 ps 1.95 pt 3 lc 3,\
 "output/data=500_impurity=1.00.tsv" using 1:($4):($5) title 'TIME_BF'  with errorbars pt -1  lw 1 ps 1.95 lc 3




