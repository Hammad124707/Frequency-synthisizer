module main_carrier (clk,reset,wave);

input clk ;
input reset ;
output [11:0] wave ;
localparam step = 32'd1073741824 ;
reg [31:0] phase_accumulator ;
reg [11:0]wave ;
wire [32:0] sum = phase_accumulator + step ;
wire[1:0] lut_bits = phase_accumulator[31:30] ;

always@(posedge clk ) 
begin 
if(reset) begin 
phase_accumulator <= 0 ;
wave <= 0 ;
end 

else
phase_accumulator <= sum ;

end

always@(*)
case(lut_bits)
2'b00 : wave = 12'd0;
2'b01: wave = 12'sd2048 ;
2'b10 : wave = 12'sd0 ;
2'b11: wave = -12'sd2048;
endcase
endmodule




