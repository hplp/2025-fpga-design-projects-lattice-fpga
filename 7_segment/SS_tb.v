`timescale 1ns/1ps  // Time unit is 1ns, resolution is 1ps

module SS_tb ();

    // in
    reg CLK = 0;
    // out
    wire SS_A_n, SS_B_n, SS_C_n, SS_D_n, SS_E_n, SS_F_n, SS_G_n, SS_right;

    // DUT: device under test
    SS_top DUT (
        .CLK(CLK),
        .SS_A_n(SS_A_n),
        .SS_B_n(SS_B_n),
        .SS_C_n(SS_C_n),
        .SS_D_n(SS_D_n),
        .SS_E_n(SS_E_n),
        .SS_F_n(SS_F_n),
        .SS_G_n(SS_G_n),
        .SS_right(SS_right)
    );

    // 12 MHz freq = 83.333 ns period
    // 50% duty cycle: 41.667 ns high or low
    always #41.667 CLK = ~CLK;
    
    initial begin
        $dumpfile("SS_tb.vcd");
        // outputs
        $dumpvars(0, SS_tb.SS_A_n);
        $dumpvars(0, SS_tb.SS_B_n);
        $dumpvars(0, SS_tb.SS_C_n);
        $dumpvars(0, SS_tb.SS_D_n);
        $dumpvars(0, SS_tb.SS_E_n);
        $dumpvars(0, SS_tb.SS_F_n);
        $dumpvars(0, SS_tb.SS_G_n);
        $dumpvars(0, SS_tb.SS_right);
        // DUT internals
        $dumpvars(0, SS_tb.DUT.SS_counter);

        $display("7-Segment Display Testbench");
        #20_000_000_000 
        $display("DONE");
        $finish;
    end

endmodule