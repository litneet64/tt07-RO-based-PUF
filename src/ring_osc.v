
module ring_osc(
    input wire en,
    output wire out
    );

    localparam num_inv = 7;
    genvar i;

    wire inter_wire[num_inv:0];

    generate
        for (i = 0; i < num_inv; i = i+1) begin
            sky130_fd_sc_hd__inv_2 inv(inter_wire[i], inter_wire[i+1]);
        end
    endgenerate

    and and_gate(inter_wire[0], out, en);
    assign out = inter_wire[num_inv];

endmodule 
