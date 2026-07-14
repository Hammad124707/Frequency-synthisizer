
`timescale 1ns/1ps

module tbnco;

    
    reg  clk;
    reg  rst;
    wire code_tick;

    
    code_nco uut (
        .clk(clk),
        .rst(rst),
        .code_tick(code_tick)
    );

    
    initial clk = 0;
    always #30.546 clk = ~clk;

    
    initial begin
        rst = 1;      
        #100;       
        rst = 0;      

        #3000;        

        $finish;       
    end

   
    always @(posedge clk) begin
        if (code_tick)
            $display("code_tick = 1 at time %0t", $time);
    end

endmodule

//upload on git