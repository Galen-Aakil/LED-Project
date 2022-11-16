transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/LED\ Project {E:/LED Project/mux.v}
vlog -vlog01compat -work work +incdir+E:/LED\ Project {E:/LED Project/LED_Project.v}
vlog -vlog01compat -work work +incdir+E:/LED\ Project {E:/LED Project/fenpin.v}
vlog -vlog01compat -work work +incdir+E:/LED\ Project {E:/LED Project/color.v}
vlog -vlog01compat -work work +incdir+E:/LED\ Project {E:/LED Project/debounce.v}

vlog -vlog01compat -work work +incdir+E:/LED\ Project/simulation/modelsim {E:/LED Project/simulation/modelsim/LED_Project.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  LED_Project_vlg_tst

add wave *
view structure
view signals
run 1 us
