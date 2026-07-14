
`timescale 1ns/1ps

module tbnco;

    // Signals connecting to the DUT (Design Under Test)
    reg  clk;
    reg  rst;
    wire code_tick;

    // Instantiate the DUT
    code_nco uut (
        .clk(clk),
        .rst(rst),
        .code_tick(code_tick)
    );

    // Clock generator: 16.368 MHz -> period ~61.093 ns -> toggle every ~30.546 ns
    initial clk = 0;
    always #30.546 clk = ~clk;

    // Stimulus: reset, then let it run
    initial begin
        rst = 1;      // hold reset
        #100;         // wait a bit
        rst = 0;      // release reset, let the NCO run freely

        #3000;        // let it run long enough to see several ticks

        $finish;       // stop simulation
    end

    // Just print every time code_tick fires, so we can see it in the transcript
    always @(posedge clk) begin
        if (code_tick)
            $display("code_tick = 1 at time %0t", $time);
    end

endmodule

//upload on git