module latch (q, d, clock);
    output reg q;
    input d, clock;

    always
        wait (clock)
            #5 q = d;

endmodule
