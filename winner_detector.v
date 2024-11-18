
module winner_detector(
	input [1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,pos10,pos11,pos12,pos13,pos14,pos15,pos16, 
	output wire win, 
	output wire [1:0]who);

wire win1,win2,win3,win4,win5,win6,win7,win8,win9,win10;
wire [1:0] who1,who2,who3,who4,who5,who6,who7,who8,who9,who10;
winner_detect_3 u1(pos1,pos2,pos3,pos4,win1,who1);// (1,2,3,4);
winner_detect_3 u2(pos5,pos6,pos7,pos8,win2,who2);// (5,6,7,8);
winner_detect_3 u3(pos9,pos10,pos11,pos12,win3,who3);// (9,10,11,12);
winner_detect_3 u4(pos13,pos14,pos15,pos16,win4,who4);// (13,14,15,16);
winner_detect_3 u5(pos1,pos5,pos9,pos13,win5,who5);// (1,5,9,13);
winner_detect_3 u6(pos2,pos6,pos10,pos14,win6,who6);// (2,6,10,14);
winner_detect_3 u7(pos3,pos7,pos11,pos15,win7,who7);// (3,7,11,15);
winner_detect_3 u8(pos4,pos8,pos12,pos16,win8,who8);// (4,8,12,16);
winner_detect_3 u9(pos1,pos6,pos11,pos16,win9,who9);// (1,6,11,16);
winner_detect_3 u10(pos4,pos7,pos10,pos13,win10,who10);// (4,7,10,13);
assign win = win1 | win2 | win3 | win4 | win5 | win6 | win7 | win8 | win9 | win10;
assign who = who1 | who2 | who3 | who4 | who5 | who6 | who7 | who8 | who9 | who10;
endmodule