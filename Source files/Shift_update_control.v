module Shift_update_control(
	shift_rs1_tag0,
	shift_rs1_tag1,
	shift_rs1_tag2,
	shift_rs1_tag3,
	shift_rs2_tag0,
	shift_rs2_tag1,
	shift_rs2_tag2,
	shift_rs2_tag3,
	dispatch_rs1_tag,
	dispatch_rs1_data_val,
	dispatch_rs2_tag,
	dispatch_rs2_data_val,
	dispatch_enable,
	CDB_tag,
	CDB_valid,
	shift_valid0,
	shift_valid1,
	shift_valid2,
	shift_valid3,
	shift_rs1_valid0,
	shift_rs1_valid1,
	shift_rs1_valid2,
	shift_rs1_valid3,
	shift_rs2_valid0,
	shift_rs2_valid1,
	shift_rs2_valid2,
	shift_rs2_valid3,
	sel_rs1,
	sel_rs2,
	enable_rs1_valid,
	enable_rs2_valid,
	enable_valid,
	enable_opcode,
	enable_rd_tag,
	enable_rs1_tag,
	enable_rs2_tag,
	enable_rs1_data,
	enable_rs2_data,
	data_sel,
	issueque_full,
	issueque_ready,
	issueblk_done
);

input [5:0] shift_rs1_tag0;
input [5:0] shift_rs1_tag1;
input [5:0] shift_rs1_tag2;
input [5:0] shift_rs1_tag3;
input [5:0] shift_rs2_tag0;
input [5:0] shift_rs2_tag1;
input [5:0] shift_rs2_tag2;
input [5:0] shift_rs2_tag3;
input [5:0] dispatch_rs1_tag;
input dispatch_rs1_data_val;
input [5:0] dispatch_rs2_tag;
input dispatch_rs2_data_val;
input dispatch_enable;
input [5:0] CDB_tag;
input CDB_valid;
input shift_valid0;
input shift_valid1;
input shift_valid2;
input shift_valid3;
input shift_rs1_valid0;
input shift_rs1_valid1;
input shift_rs1_valid2;
input shift_rs1_valid3;
input shift_rs2_valid0;
input shift_rs2_valid1;
input shift_rs2_valid2;
input shift_rs2_valid3;
output [3:0] sel_rs1;
output [3:0] sel_rs2;
output [3:0] enable_rs1_valid;
output [3:0] enable_rs2_valid;
output [3:0] enable_valid;
output [3:0] enable_opcode;
output [3:0] enable_rd_tag;
output [3:0] enable_rs1_tag;
output [3:0] enable_rs2_tag;
output [3:0] enable_rs1_data;
output [3:0] enable_rs2_data;
output reg [1:0] data_sel;
output issueque_full;
output reg issueque_ready;
input issueblk_done;

reg [3:0] shift_en;

assign sel_rs1[0] = CDB_valid && ((issueque_full && (CDB_tag == shift_rs1_tag0) && !shift_rs1_valid0) || (shift_en[0] && (CDB_tag == dispatch_rs1_tag) && !dispatch_rs1_data_val)) ? 1'b1 : 1'b0 ;
assign sel_rs1[1] = CDB_valid && ( (!shift_en[1] && (CDB_tag == shift_rs1_tag1) && !shift_rs1_valid1) || (shift_en[1] && (CDB_tag == shift_rs1_tag0) && !shift_rs1_valid0)) ? 1'b1 : 1'b0 ;
assign sel_rs1[2] = CDB_valid && ( (!shift_en[2] && (CDB_tag == shift_rs1_tag2) && !shift_rs1_valid2) || (shift_en[2] && (CDB_tag == shift_rs1_tag1) && !shift_rs1_valid1)) ? 1'b1 : 1'b0 ;
assign sel_rs1[3] = CDB_valid && ( (!shift_en[3] && (CDB_tag == shift_rs1_tag3) && !shift_rs1_valid3) || (shift_en[1] && (CDB_tag == shift_rs1_tag2) && !shift_rs1_valid2)) ? 1'b1 : 1'b0 ;


assign sel_rs2[0] = CDB_valid && ((issueque_full && (CDB_tag == shift_rs2_tag0) && !shift_rs2_valid0) || (shift_en[0] && (CDB_tag == dispatch_rs2_tag) && !dispatch_rs2_data_val)) ? 1'b1 : 1'b0 ;
assign sel_rs2[1] = CDB_valid && ( (!shift_en[1] && (CDB_tag == shift_rs2_tag1) && !shift_rs2_valid1) || (shift_en[1] && (CDB_tag == shift_rs2_tag0) && !shift_rs2_valid0)) ? 1'b1 : 1'b0 ;
assign sel_rs2[2] = CDB_valid && ( (!shift_en[2] && (CDB_tag == shift_rs2_tag2) && !shift_rs2_valid2) || (shift_en[2] && (CDB_tag == shift_rs2_tag1) && !shift_rs2_valid1)) ? 1'b1 : 1'b0 ;
assign sel_rs2[3] = CDB_valid && ( (!shift_en[3] && (CDB_tag == shift_rs2_tag3) && !shift_rs2_valid3) || (shift_en[1] && (CDB_tag == shift_rs2_tag2) && !shift_rs2_valid2)) ? 1'b1 : 1'b0 ;

assign issueque_full = shift_valid0 & shift_valid1 & shift_valid2 & shift_valid3;

assign enable_valid = shift_en;
assign enable_opcode = shift_en;
assign enable_rd_tag = shift_en;
assign enable_rs1_tag = shift_en;
assign enable_rs2_tag = shift_en;
assign enable_rs1_data[0]  = (CDB_tag == shift_rs1_tag0) && CDB_valid && !shift_rs1_valid0 ? 1'b1 : shift_en[0];
assign enable_rs1_data[1]  = (CDB_tag == shift_rs1_tag1) && CDB_valid && !shift_rs1_valid1 ? 1'b1 : shift_en[1];
assign enable_rs1_data[2]  = (CDB_tag == shift_rs1_tag2) && CDB_valid && !shift_rs1_valid2 ? 1'b1 : shift_en[2];
assign enable_rs1_data[3]  = (CDB_tag == shift_rs1_tag3) && CDB_valid && !shift_rs1_valid3 ? 1'b1 : shift_en[3];
assign enable_rs1_valid[0] = (CDB_tag == shift_rs1_tag0) && CDB_valid && !shift_rs1_valid0 ? 1'b1 : shift_en[0];
assign enable_rs1_valid[1] = (CDB_tag == shift_rs1_tag1) && CDB_valid && !shift_rs1_valid1 ? 1'b1 : shift_en[1];
assign enable_rs1_valid[2] = (CDB_tag == shift_rs1_tag2) && CDB_valid && !shift_rs1_valid2 ? 1'b1 : shift_en[2];
assign enable_rs1_valid[3] = (CDB_tag == shift_rs1_tag3) && CDB_valid && !shift_rs1_valid3 ? 1'b1 : shift_en[3];
assign enable_rs2_data[0]  = (CDB_tag == shift_rs2_tag0) && CDB_valid && !shift_rs2_valid0 ? 1'b1 : shift_en[0];
assign enable_rs2_data[1]  = (CDB_tag == shift_rs2_tag1) && CDB_valid && !shift_rs2_valid1 ? 1'b1 : shift_en[1];
assign enable_rs2_data[2]  = (CDB_tag == shift_rs2_tag2) && CDB_valid && !shift_rs2_valid2 ? 1'b1 : shift_en[2];
assign enable_rs2_data[3]  = (CDB_tag == shift_rs2_tag3) && CDB_valid && !shift_rs2_valid3 ? 1'b1 : shift_en[3];
assign enable_rs2_valid[0] = (CDB_tag == shift_rs2_tag0) && CDB_valid && !shift_rs2_valid0 ? 1'b1 : shift_en[0];
assign enable_rs2_valid[1] = (CDB_tag == shift_rs2_tag1) && CDB_valid && !shift_rs2_valid1 ? 1'b1 : shift_en[1];
assign enable_rs2_valid[2] = (CDB_tag == shift_rs2_tag2) && CDB_valid && !shift_rs2_valid2 ? 1'b1 : shift_en[2];
assign enable_rs2_valid[3] = (CDB_tag == shift_rs2_tag3) && CDB_valid && !shift_rs2_valid3 ? 1'b1 : shift_en[3];

always @* begin
	if (issueblk_done) begin
		if (!(shift_valid3)) begin
			shift_en = 4'b1111;
		end
		else if (!(shift_valid2)) begin
			shift_en = 4'b0111;
		end
		else if (!(shift_valid1)) begin
			shift_en = 4'b0011;
		end
		else if (!(shift_valid0) && dispatch_enable) begin
			shift_en = 4'b0001;
		end
		else begin
			shift_en = 4'b0000;
		end
	end
	else begin
		shift_en = 4'b0000;
	end
end

always @* begin
	if (shift_valid3 && shift_rs1_valid0 && shift_rs2_valid0) begin
		issueque_ready = 1'b1;
		data_sel = 2'b11;
	end
	else if (shift_valid2 && shift_rs1_valid1 && shift_rs2_valid1) begin
		issueque_ready = 1'b1;
		data_sel = 2'b10;
	end
	else if (shift_valid1 && shift_rs1_valid2 && shift_rs2_valid2) begin
		issueque_ready = 1'b1;
		data_sel = 2'b01;
	end
	else if (shift_valid0 && shift_rs1_valid3 && shift_rs2_valid3) begin
		issueque_ready = 1'b1;
		data_sel = 2'b00;
	end
	else begin
		issueque_ready = 1'b0;
		data_sel = 2'b11;
	end
end

endmodule