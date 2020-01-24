set terminal png size 1024,768
set output "2dplot.png"
set xlabel "X" font "Arial,12,Bold" 
set ylabel "Y" font "Arial,12,Bold"
set y2label "Y2" font "Arial,12,Bold"
plot "allfiles.txt" u 1:2 axis x1y1 w l, "allfiles.txt" u 1:3 axis x2y2 w l
