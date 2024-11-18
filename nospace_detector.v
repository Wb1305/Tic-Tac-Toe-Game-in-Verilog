module nospace_detector(
   input [1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9, pos10, pos11, pos12, pos13, pos14, pos15, pos16,
   output wire no_space
    );
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9, temp10, temp11, temp12, temp13, temp14, temp15, temp16;
// detect no more space     
assign temp1 = pos1[1] | pos1[0];
assign temp2 = pos2[1] | pos2[0];
assign temp3 = pos3[1] | pos3[0];
assign temp4 = pos4[1] | pos4[0];
assign temp5 = pos5[1] | pos5[0];
assign temp6 = pos6[1] | pos6[0];
assign temp7 = pos7[1] | pos7[0];
assign temp8 = pos8[1] | pos8[0];
assign temp9 = pos9[1] | pos9[0];
assign temp10 = pos10[1] | pos10[0];
assign temp11 = pos11[1] | pos11[0];
assign temp12 = pos12[1] | pos12[0];
assign temp13 = pos13[1] | pos13[0];
assign temp14 = pos14[1] | pos14[0];
assign temp15 = pos15[1] | pos15[0];
assign temp16 = pos16[1] | pos16[0];
// output
assign no_space = temp1 & temp2 & temp3 & temp4 & temp5 & temp6 & temp7 & temp8 & temp9 & temp10 & temp11 & temp12 & temp13 & temp14 & temp15 & temp16;
endmodule


