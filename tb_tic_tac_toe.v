`timescale 1ns / 1ps

module tb_tic_tac_toe_game;

// Inputs
reg clock;
reg reset;
reg play;
reg pc;
reg [3:0] computer_position;
reg [3:0] player_position;

// Outputs
wire [1:0] pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, pos10, pos11, pos12, pos13, pos14, pos15, pos16;
wire [1:0] who;

// Instantiate the Unit Under Test (UUT)
tic_tac_toe_game uut (
    .clock(clock),
    .reset(reset),
    .play(play),
    .pc(pc),
    .computer_position(computer_position),
    .player_position(player_position),
    .pos1(pos1), .pos2(pos2), .pos3(pos3), .pos4(pos4),
    .pos5(pos5), .pos6(pos6), .pos7(pos7), .pos8(pos8),
    .pos9(pos9), .pos10(pos10), .pos11(pos11), .pos12(pos12),
    .pos13(pos13), .pos14(pos14), .pos15(pos15), .pos16(pos16),
    .who(who)
);

// Clock generation
initial begin
    clock = 0;
    forever #5 clock = ~clock;
end

// Testbench logic
initial begin
    // Initialize inputs
    reset = 1;
    play = 0;
    pc = 0;
    computer_position = 0;
    player_position = 0;
    #50;

    // Release reset
    reset = 0;
    #50;

    // Test case 1: Player wins (4 positions in a row)
    // Player: Position 1
    play = 1;
    player_position = 4'd0;
    #50;
    play = 0;

    // Computer: Position 5
    pc = 1;
    computer_position = 4'd4;
    #50;
    pc = 0;

    // Player: Position 2
    play = 1;
    player_position = 4'd1;
    #50;
    play = 0;

    // Computer: Position 6
    pc = 1;
    computer_position = 4'd5;
    #50;
    pc = 0;

    // Player: Position 3
    play = 1;
    player_position = 4'd2;
    #50;
    play = 0;

    // Computer: Position 7
    pc = 1;
    computer_position = 4'd6;
    #50;
    pc = 0;

    // Player: Position 4 (Player wins)
    play = 1;
    player_position = 4'd3;
    #50;
    play = 0;

    // Wait to check who wins
    #100;

    // Test case 2: Computer wins
    reset = 1;
    #50;
    reset = 0;
    #50;

    // Computer: Position 9
    pc = 1;
    computer_position = 4'd8;
    #50;
    pc = 0;

    // Player: Position 1
    play = 1;
    player_position = 4'd0;
    #50;
    play = 0;

    // Computer: Position 10
    pc = 1;
    computer_position = 4'd9;
    #50;
    pc = 0;

    // Player: Position 2
    play = 1;
    player_position = 4'd1;
    #50;
    play = 0;

    // Computer: Position 11
    pc = 1;
    computer_position = 4'd10;
    #50;
    pc = 0;

    // Player: Position 3
    play = 1;
    player_position = 4'd2;
    #50;
    play = 0;

    // Computer: Position 12 (Computer wins)
    pc = 1;
    computer_position = 4'd11;
    #50;
    pc = 0;

    // Wait to check who wins
    #100;

    // Test case 3: Draw scenario
    reset = 1;
    #50;
    reset = 0;
    #50;

    // Fill all positions alternately
    // Player: Position 1
    play = 1;
    player_position = 4'd0;
    #50;
    play = 0;

    // Computer: Position 2
    pc = 1;
    computer_position = 4'd1;
    #50;
    pc = 0;

    // Repeat similar moves until the board is filled
    repeat (7) begin
        play = 1;
        player_position = player_position + 4'd2;
        #50;
        play = 0;

        pc = 1;
        computer_position = computer_position + 4'd2;
        #50;
        pc = 0;
    end

    // Wait to check draw
    #100;

    // Finish simulation
    $finish;
end

endmodule

