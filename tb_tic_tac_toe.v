
//note: position 1, 2, 3,.., 9 correspond 4'd0, 4'd1, 4'd2, ..., 4'd8
// 01 : X (player) - 10 : O (computer) - 00 : (no space)

`timescale 1ns / 1ps

module tb_tic_tac_toe;

// Inputs
reg clock;
reg reset;
reg play;
reg pc;
reg [3:0] computer_position;
reg [3:0] player_position;

// Outputs
wire [1:0] pos1;
wire [1:0] pos2;
wire [1:0] pos3;
wire [1:0] pos4;
wire [1:0] pos5;
wire [1:0] pos6;
wire [1:0] pos7;
wire [1:0] pos8;
wire [1:0] pos9;
wire [1:0] who;

// Instantiate the Unit Under Test (UUT)
tic_tac_toe_game uut (
    .clock(clock),
    .reset(reset),
    .play(play),
    .pc(pc),
    .computer_position(computer_position),
    .player_position(player_position),
    .pos1(pos1),
    .pos2(pos2),
    .pos3(pos3),
    .pos4(pos4),
    .pos5(pos5),
    .pos6(pos6),
    .pos7(pos7),
    .pos8(pos8),
    .pos9(pos9),
    .who(who)
);

// Clock generation
initial begin
    clock = 0;
    forever #5 clock = ~clock;
end

// Testbench logic
initial begin
    // Initialize Inputs
    play = 0;
    reset = 1;
    computer_position = 0;
    player_position = 0;
    pc = 0;
    #100;
    
    // Reset game
    reset = 0;
    #100;

    // First move: Player plays at position 1
    play = 1;
    pc = 0;
    player_position = 4'd0;
    #50;
    play = 0;

    // Computer move: Computer plays at position 3
    pc = 1;
    computer_position = 4'd2;
    #50;
    pc = 0;
    
    // Second move: Player plays at position 2
    play = 1;
    player_position = 4'd1;
    #50;
    play = 0;

    // Computer move: Computer plays at position 5
    pc = 1;
    computer_position = 4'd4;
    #50;
    pc = 0;

    // Third move: Player plays at position 4
    play = 1;
    player_position = 4'd3;
    #50;
    play = 0;

    // Computer move: Computer plays at position 9
    pc = 1;
    computer_position = 4'd8;
    #50;
    pc = 0;

    // Final move: Player plays at position 7, Player should win
    play = 1;
    player_position = 4'd6;
    #50;
    play = 0;

    // Check who wins (Player wins expected)
    #100;
    
    // Reset game
    reset = 1;
    #100;
    reset = 0;
    #100;

    // Another round: Computer starts first and wins
    pc = 1;
    computer_position = 4'd0;
    #50;
    pc = 0;

    // Player move: plays at position 5
    play = 1;
    player_position = 4'd4;
    #50;
    play = 0;

    // Computer move: plays at position 2
    pc = 1;
    computer_position = 4'd1;
    #50;
    pc = 0;

    // Player move: plays at position 3
    play = 1;
    player_position = 4'd2;
    #50;
    play = 0;

    // Computer move: plays at position 4
    pc = 1;
    computer_position = 4'd3;
    #50;
    pc = 0;

    // Player move: plays at position 6
    play = 1;
    player_position = 4'd5;
    #50;
    play = 0;

    // Computer move: plays at position 7, Computer should win
    pc = 1;
    computer_position = 4'd6;
    #50;
    pc = 0;

    // Check who wins (Computer wins expected)
    #100;

    // Reset game
    reset = 1;
    #100;
    reset = 0;
    #100;

    // Another round: Draw scenario
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

    // Player: Position 3
    play = 1;
    player_position = 4'd2;
    #50;
    play = 0;

    // Computer: Position 4
    pc = 1;
    computer_position = 4'd3;
    #50;
    pc = 0;

    // Player: Position 5
    play = 1;
    player_position = 4'd4;
    #50;
    play = 0;

    // Computer: Position 6
    pc = 1;
    computer_position = 4'd5;
    #50;
    pc = 0;

    // Player: Position 7
    play = 1;
    player_position = 4'd6;
    #50;
    play = 0;

    // Computer: Position 8
    pc = 1;
    computer_position = 4'd7;
    #50;
    pc = 0;

    // Player: Position 9, should result in a draw
    play = 1;
    player_position = 4'd8;
    #50;
    play = 0;

    // Check for draw (No winner expected)
    #100;

    // Finish simulation
    $finish;
end

endmodule
