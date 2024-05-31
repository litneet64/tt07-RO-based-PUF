module mux_16 (
    input wire[15:0] ro,
    input wire[3:0] chall,
    output wire out
);
    reg sel;
    assign out = sel;

    always @ (*) begin
        case (chall)
            'd0: sel = ro[0];
            'd1: sel = ro[1];
            'd2: sel = ro[2];
            'd3: sel = ro[3];
            'd4: sel = ro[4];
            'd5: sel = ro[5];
            'd6: sel = ro[6];
            'd7: sel = ro[7];
            'd8: sel = ro[8];
            'd9: sel = ro[9];
            'd10: sel = ro[10];
            'd11: sel = ro[11];
            'd12: sel = ro[12];
            'd13: sel = ro[13];
            'd14: sel = ro[14];
            'd15: sel = ro[15];
            default: sel = 'bx;
        endcase
    end
    

endmodule