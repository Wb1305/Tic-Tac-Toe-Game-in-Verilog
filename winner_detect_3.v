
// winner detection for 3 positions and determine who the winner is 
// Player: 01
// Computer: 10
module winner_detect_3(
	input [1:0] pos0,pos1,pos2,pos3,
	output wire win, 
	output wire [1:0]who);

wire [1:0] temp0,temp1,temp2,temp3;
wire temp4;
assign temp0[1] = !(pos0[1]^pos1[1]);
assign temp0[0] = !(pos0[0]^pos1[0]);
assign temp1[1] = !(pos2[1]^pos1[1]);
assign temp1[0] = !(pos2[0]^pos1[0]);
assign temp2[1] = !(pos3[1]^pos2[1]);
assign temp2[0] = !(pos3[0]^pos2[0]);
assign temp3[1] = temp0[1] & temp1[1] & temp2[1];
assign temp3[0] = temp0[0] & temp1[0] & temp2[0];
assign temp4 = pos0[1] | pos0[0];
// winner if 3 positions are similar and should be 01 or 10 
assign win = temp4 & temp3[1] & temp3[0];
// determine who the winner is 
assign who[1] = win & pos0[1];
assign who[0] = win & pos0[0];
endmodule