quit -sim
vcom -work work -2008 -explicit -vopt -stats=none /uio/hume/student-u06/tsauren/Documents/IN3160/lab2/prosjekt/a/src/decoder_tb_task_a.vhd
vsim -voptargs=+acc work.decoder_test
add wave sim:/decoder_test/UUT/input
add wave sim:/decoder_test/UUT/output
run 1 us
