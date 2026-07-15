module code # (parameter width = 32 , parameter step = 32'd536870192) (clk , reset, pulse) ;
input clk ;
input reset ;
output pulse ;
reg pulse ;
reg [width -1 :0] accumulator ;

wire[width:0] sum = accumulator + step ;
wire overflow = sum[32] ;

always@(posedge clk , posedge reset )
begin 
if (reset)begin 
accumulator <= 0 ;
pulse <= 0 ;
end

else  begin 
accumulator <= sum ;
pulse <= overflow ;
end 

end
endmodule 
 
