
module arbiter (
    input wire out_1, out_2, clk, rst,
    output wire resp, finish
);
    reg marked_1, marked_2, tmp_res;

    assign win_1 = (out_1 & ~out_2 & ~finish);
    assign win_2 = (out_2 & ~out_1 & ~finish);
    assign finish = (marked_1 | marked_2);
    assign resp = tmp_res;

    always @ (posedge clk) begin
        if ((marked_1 == 'x && marked_2 == 'x) || rst) begin
            marked_1 <= 0;
            marked_2 <= 0;
        end

        if (win_1) begin
            tmp_res <= 1;
            marked_1 <= 1;
        end

        else if (win_2) begin
            tmp_res <= 0;
            marked_2 <= 1;
        end
        
    end

endmodule
