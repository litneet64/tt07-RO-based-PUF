
module counter(
    input wire in, clk, rst,
    output wire out
);
    reg[15:0] ctr;
    reg[15:0] threshold = 16'b11111111_11111111;
    reg finish;

    assign out = (finish) ? 1 : 0;

    always @ (posedge clk) begin
        if (in) begin
            ctr <= ctr + 1;
        end

        if (rst) begin
            ctr <= 0;
            finish <= 0;
        end

        if (ctr == threshold) begin
            finish <= 1;
        end
    end


endmodule
