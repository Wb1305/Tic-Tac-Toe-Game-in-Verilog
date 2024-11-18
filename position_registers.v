
module position_registers(
      input clock, // clock of the game 
      input reset, // reset the game 
      input illegal_move, // disable writing when an illegal move is detected 
      input [15:0] PC_en, // Computer enable signals 
      input [15:0] PL_en, // Player enable signals 
      output reg [1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,pos10,pos11,pos12,pos13,pos14,pos15,pos16 // positions stored
      );

reg [1:0] pos[15:0];
always @(*) begin
    pos1 = pos[0];
    pos2 = pos[1];
    pos3 = pos[2];
    pos4 = pos[3];
    pos5 = pos[4];
    pos6 = pos[5];
    pos7 = pos[6];
    pos8 = pos[7];
    pos9 = pos[8];
		pos10 = pos[9];
    pos11 = pos[10];
    pos12 = pos[11];
    pos13 = pos[12];
    pos14 = pos[13];
    pos15 = pos[14];
    pos16 = pos[15];
end

genvar i;
generate
    for (i = 0; i < 16; i = i + 1) begin
        always @(posedge clock or posedge reset) begin
            if (reset) begin
                pos[i] <= 2'b00; 
            end else begin
                if (illegal_move == 1'b1) begin
                    pos[i] <= pos[i]; 
                end else if (PC_en[i] == 1'b1) begin
                    pos[i] <= 2'b10; 
                end else if (PL_en[i] == 1'b1) begin
                    pos[i] <= 2'b01; 
                end else begin
                    pos[i] <= pos[i]; 
                end
            end
        end
    end
endgenerate

endmodule

