module tb_latch;
    reg d, clock;
    wire q;

    latch dut (.q(q), .d(d), .clock(clock));

    initial begin
        $monitor("Time=%0t | clock=%b d=%b q=%b", $time, clock, d, q);

        clock = 0; d = 0;
        #10 clock = 1; d = 1;
        #10 clock = 0; d = 0;   // q should hold last value
        #10 d = 1;              // still holding, clock low
        #10 clock = 1;          // now transparent again, q follows d
        #10 d = 0;
        #10 $finish;
    end
endmodule
