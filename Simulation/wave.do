onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /int_reservation_station/UUT1/clk
add wave -noupdate /int_reservation_station/UUT1/reset
add wave -noupdate /int_reservation_station/UUT1/PC_out
add wave -noupdate /int_reservation_station/UUT1/Instruction
add wave -noupdate -color Yellow /int_reservation_station/UUT1/CDB_tag
add wave -noupdate -color Yellow /int_reservation_station/UUT1/CDB_valid
add wave -noupdate -color Yellow /int_reservation_station/UUT1/CDB_data
add wave -noupdate /int_reservation_station/UUT1/issueque_full_integer
add wave -noupdate /int_reservation_station/UUT1/dispatch_en_integer
add wave -noupdate -color Aquamarine /int_reservation_station/UUT1/dispatch_opcode
add wave -noupdate -color Cyan /int_reservation_station/UUT1/dispatch_rd_tag
add wave -noupdate -color Cyan /int_reservation_station/UUT1/dispatch_rs1_data
add wave -noupdate -color Cyan /int_reservation_station/UUT1/dispatch_rs1_tag
add wave -noupdate -color Cyan /int_reservation_station/UUT1/dispatch_rs2_tag
add wave -noupdate -color Cyan /int_reservation_station/UUT1/dispatch_rs2_data
add wave -noupdate /int_reservation_station/UUT1/dispatch_rs1_valid
add wave -noupdate /int_reservation_station/UUT1/dispatch_rs2_valid
add wave -noupdate -color {Medium Orchid} /int_reservation_station/UUT2/issueque_rs1_data
add wave -noupdate -color {Medium Orchid} /int_reservation_station/UUT2/issueque_rs2_data
add wave -noupdate -color {Medium Orchid} /int_reservation_station/UUT2/issueque_rd_tag
add wave -noupdate -color {Medium Orchid} /int_reservation_station/UUT2/issueque_opcode
add wave -noupdate /int_reservation_station/UUT2/issueque_ready
add wave -noupdate -color Coral /int_reservation_station/UUT2/issueblk_done
add wave -noupdate /int_reservation_station/UUT2/Int_Res_Stat/valid_reg
add wave -noupdate -color Khaki /int_reservation_station/UUT3/dispatch_enable
add wave -noupdate -color Khaki /int_reservation_station/UUT3/issueque_ready
add wave -noupdate -color Khaki /int_reservation_station/UUT3/issueque_rs1_data
add wave -noupdate -color Khaki /int_reservation_station/UUT3/issueque_rs2_data
add wave -noupdate -color Khaki /int_reservation_station/UUT3/issueque_rd_tag
add wave -noupdate -color Khaki /int_reservation_station/UUT3/issueque_opcode
add wave -noupdate -color Khaki /int_reservation_station/UUT3/issueblk_done
add wave -noupdate -color Khaki /int_reservation_station/UUT3/issueque_full
add wave -noupdate /int_reservation_station/UUT3/Int_Res_Stat/valid_reg
add wave -noupdate /int_reservation_station/CDB_tag_random
add wave -noupdate -radix binary /int_reservation_station/UUT2/enable_valid
add wave -noupdate -radix binary /int_reservation_station/UUT2/valid_clear
add wave -noupdate /int_reservation_station/UUT2/Int_Res_Stat/rs2_data_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8010 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 281
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {72822 ps}
