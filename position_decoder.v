
module position_decoder(input[3:0] in, input enable, output wire [8:0] out_en);
    reg [8:0] temp1;
    assign out_en = (enable == 1'b1) ? temp1 : 9'd0;
    
    always @(*) begin
        case(in)
            4'd0: temp1 <= 9'b000000001; 
            4'd1: temp1 <= 9'b000000010;  
            4'd2: temp1 <= 9'b000000100;  
            4'd3: temp1 <= 9'b000001000;  
            4'd4: temp1 <= 9'b000010000;  
            4'd5: temp1 <= 9'b000100000; 
            4'd6: temp1 <= 9'b001000000;  
            4'd7: temp1 <= 9'b010000000;   
            4'd8: temp1 <= 9'b100000000;  
            default: temp1 <= 9'b000000001;  
        endcase
    end
endmodule
