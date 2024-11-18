

module illegal_move_detector(
   input [1:0] pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, pos10,pos11,pos12,pos13,pos14,pos15,pos16,  // 
   input [15:0] PC_en, PL_en, 
   output wire illegal_move
   );
   
wire [15:0] temp_player, temp_computer;
wire [1:0] pos[15:0];  

assign pos[0] = pos1;
assign pos[1] = pos2;
assign pos[2] = pos3;
assign pos[3] = pos4;
assign pos[4] = pos5;
assign pos[5] = pos6;
assign pos[6] = pos7;
assign pos[7] = pos8;
assign pos[8] = pos9;
assign pos[9] = pos10;
assign pos[10] = pos11;
assign pos[11] = pos12;
assign pos[12] = pos13;
assign pos[13] = pos14;
assign pos[14] = pos15;
assign pos[15] = pos16;

genvar i;
generate
    for (i = 0; i < 15; i = i + 1) begin
        assign temp_player[i] = (pos[i][1] | pos[i][0]) & PL_en[i];
        assign temp_computer[i] = (pos[i][1] | pos[i][0]) & PC_en[i];
    end
endgenerate

// Intermediate signals
wire temp1 = |temp_player; 
wire temp2 = |temp_computer;  

// Output illegal move
assign illegal_move = temp1 | temp2;

endmodule

