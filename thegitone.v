
module code_nco #(
    parameter WIDTH = 32,                  
    parameter STEP  = 32'd536870912        
                                            
) (
    input  wire             clk,      
    input  wire             rst,      
    output reg              code_tick  
);

  
    reg [WIDTH-1:0] accumulator;

  
    wire [WIDTH:0] sum_ext = {1'b0, accumulator} + {1'b0, STEP[WIDTH-1:0]};

    
    wire overflow = sum_ext[WIDTH];

    always @(posedge clk) begin
        if (rst) begin
            accumulator <= {WIDTH{1'b0}};
            code_tick   <= 1'b0;
        end else begin
            accumulator <= sum_ext[WIDTH-1:0];  
            code_tick   <= overflow;            
        end
    end

endmodule