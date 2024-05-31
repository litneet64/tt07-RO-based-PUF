/*
 * Copyright (c) 2024 Pablo Aravena
 * SPDX-License-Identifier: Apache-2.0
 */

module tt_um_litneet64_ro_puf (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  assign rst = ~rst_n;

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out = 8'b00000000;
  assign uio_oe  = 8'b00000000;

  // List all unused inputs to prevent warnings
  //wire _unused = &{1'b0};
  
  localparam n_bits = 8;
  wire[n_bits-1:0] finish;

  genvar i;

  generate
    for (i = 0; i < n_bits; i = i+1) begin
      puf_bit puf_buffer(ui_in[n_bits-1:0], clk, rst, ena, uo_out[i], finish[i]);
    end
  endgenerate

endmodule
