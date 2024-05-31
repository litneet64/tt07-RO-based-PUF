
module counter(
    input wire in, clk, rst,
    output wire out
);
    reg[15:0] ctr;
    reg finish;

    assign threshold = 'b11111111_11111111;
    assign out = (finish) ? 1 : 0;

    always @ (posedge clk) begin
        if (in) begin
            ctr = ctr + 1;
        end

        if (rst) begin
            ctr <= 0;
            finish <= 0;
        end

        if (ctr == threshold) begin
            finish = 1;
        end
    end


endmodule
