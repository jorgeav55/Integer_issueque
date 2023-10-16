module Integer_Reservation_Station(
reset,
clk,
dispatch_rs1_data,
dispatch_rs1_tag,
dispatch_rs1_data_val,
dispatch_rs2_data,
dispatch_rs2_tag,
dispatch_rs2_data_val,
dispatch_opcode,
dispatch_rd_tag,
dispatch_enable,
issueque_full,
cdb_tag,
cdb_data,
cdb_valid,
issueque_ready,
issueque_rs1_data,
issueque_rs2_data,
issueque_rd_tag,
issueque_opcode,
issueblk_done
  );
  
//Input and Output declaration
input reset;
input clk;
input [31:0] dispatch_rs1_data;
input [5:0] dispatch_rs1_tag;
input dispatch_rs1_data_val;
input [31:0] dispatch_rs2_data;
input [5:0] dispatch_rs2_tag;
input dispatch_rs2_data_val;
input [3:0] dispatch_opcode;
input [5:0] dispatch_rd_tag;
input dispatch_enable;
output issueque_full;
input [5:0] cdb_tag;
input [31:0] cdb_data;
input cdb_valid;
output issueque_ready;
output issueque_rs1_data;
output issueque_rs2_data;
output issueque_rd_tag;
output issueque_opcode;
input issueblk_done;
Queue_Shift_Register Int_Res_Stat(
	.reset(reset),
	.clk(clk),
	.enable_rs1_valid(),
	.enable_rs2_valid(),
	.enable_valid(),
	.enable_opcode(),
	.enable_rd_tag(),
	.enable_rs1_tag(),
	.enable_rs2_tag(),
	.enable_rs1_data(),
	.enable_rs2_data(),
	.sel_rs1(),
	.sel_rs2(),
	.CDB_data(cdb_data),
	.dispatch_rs1_data(dispatch_rs1_data),
	.dispatch_rs1_tag(dispatch_rs1_tag),
	.dispatch_rs1_data_val(dispatch_rs1_data_val),
	.dispatch_rs2_data(dispatch_rs2_data),
	.dispatch_rs2_tag(dispatch_rs2_tag),
	.dispatch_rs2_data_val(dispatch_rs2_data_val),
	.dispatch_opcode(dispatch_opcode),
	.dispatch_rd_tag(dispatch_rd_tag),
	.dispatch_enable(dispatch_enable),
	.issueque_full(issueque_full)
);

Shift_update_control(
	.shift_tag0(),
	.shift_tag1(),
	.shift_tag2(),
	.shift_tag3()
);
endmodule