`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 02:40:46 PM
// Design Name: 
// Module Name: c_countdown
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module c_countdown(
    input a_done, CLOCK, 
    output reg [10:0] led = 0,
    output reg LOA = 0
    );
    
    reg [3:0] count = 0;
    wire SLOWCLK;
    slowclock c0(CLOCK, SLOWCLK);
    
    always @ (posedge SLOWCLK) begin
        if (a_done) begin
            count <= (count == 4'd12) ? count : count + 1;
            case (count)
            4'd0: led <= ~11'b0;
            4'd1: led[10] <= 0;
            4'd2: led[9] <= 0;
            4'd3: led[8] <= 0;
            4'd4: led[7] <= 0;
            4'd5: led[6] <= 0;
            4'd6: led[5] <= 0;
            4'd7: led[4] <= 0;
            4'd8: led[3] <= 0;
            4'd9: led[2] <= 0;
            4'd10: led[1] <= 0;
            4'd11:
                begin
                    led[0] <= 0;
                    LOA <= 1;
                end
            default: led <= 0;
            endcase
        end
    end   

        
endmodule
