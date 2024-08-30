vlib work
vlog Up_Dn_Counter.v Up_Dn_Counter_tb.v
vsim -voptargs=+accs work.Up_Dn_Counter_tb
add wave *
run -all