module carrier_tb ;


reg clk ;
reg reset ;
wire [11:0] wave ;
main_carrier uut (clk, reset, wave) ;

initial clk = 0 ;
always #30 clk = ~clk ;

initial begin
reset = 1 ;
@(posedge clk) ;
@(posedge clk) ;
reset = 0 ;
end 

endmodule
