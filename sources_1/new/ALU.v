`timescale 1ns / 1ps

module ALU(
    input [3:0] ALUop,
    input [31:0] ina, inb,
    output reg zero,
    output reg [31:0] out
);
    always@(*) begin
        case (ALUop)
            4'b0010: out = ina + inb;       // add
            4'b0110: out = ina - inb;       // sub
            4'b0000: out = ina & inb;       // and
            4'b0001: out = ina | inb;       // or
            4'b0011: out = ina ^ inb;       // xor
            4'b0101: out = ina >> inb;      // srl, srli
            4'b0100: out = ina << inb;      // sll, slli
            4'b1001: out = ina >>> inb;     // sra, srai
            4'b0111: out = (ina < inb);     // sltu
            4'b1000: begin                  // slt
                if (ina[31] != inb[31])
                    out = (ina[31] > inb[31]);
				else
				    out = (ina < inb);
            end
        endcase
        
        assign zero = (out == 0);
    end
endmodule
