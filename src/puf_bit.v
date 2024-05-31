
module puf_bit(
    input wire[7:0] chall,
    input wire clk, rst, en,
    output wire resp, finish
);

    localparam n_ro = 32;
    localparam n_half = n_ro / 2;

    wire[n_ro-1:0] ro_out;
    wire[n_ro-1:0] inter_en;

    wire mux_out_1, mux_out_2;
    wire ctr_out_1, ctr_out_2;

    assign inter_en = (en) ? 32'b1 : 32'b0;

    ring_osc ro_array_1[n_half-1:0] (inter_en[n_half-1:0], ro_out[n_half-1:0]);
    ring_osc ro_array_2[n_half-1:0] (inter_en[n_ro-1:n_half], ro_out[n_ro-1:n_half]);

    mux_16 mux_1(ro_out[n_half-1:0], chall[3:0], mux_out_1);
    mux_16 mux_2(ro_out[n_ro-1:n_half], chall[7:4], mux_out_2);

    counter cnt_1(mux_out_1, clk, rst, ctr_out_1);
    counter cnt_2(mux_out_2, clk, rst, ctr_out_2);

    arbiter race_arb(cnt_out_1, cnt_out_2, clk, rst, resp, finish);

endmodule
