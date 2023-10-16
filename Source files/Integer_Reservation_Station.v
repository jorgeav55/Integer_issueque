module Integer_Reservation_Station(
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
issueque_readyk,
issueque_rs_data,
issueque_rt_data,
issueque_rd_tag,
issueque_opcode,
issueblk_done
  );
  
//Input and Output declaration
input dispatch_rs1_data;
input dispatch_rs1_tag;
input dispatch_rs1_data_val;
input dispatch_rs2_data;
input dispatch_rs2_tag;
input dispatch_rs2_data_val;
input dispatch_opcode;
input dispatch_rd_tag;
input dispatch_enable;
output issueque_full;
input cdb_tag;
input cdb_data;
input cdb_valid;
output issueque_readyk;
output issueque_rs_data;
output issueque_rt_data;
output issueque_rd_tag;
output issueque_opcode;
output issueblk_done;
Queue_Shift_Register Int_Res_Stat(

);

endmodule