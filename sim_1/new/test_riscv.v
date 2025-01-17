///////////////////////////////////////TESTBENCH//////////////////////////////////////////////////////////////////
module RISC_V_TB;
    reg clk, reset;
    wire [31:0] PC_EX, ALU_OUT_EX, PC_MEM;
    wire PCSrc;
    wire [31:0] DATA_MEMORY_MEM, ALU_DATA_WB;
    wire [1:0] forwardA, forwardB;
    wire pipeline_stall;
      
    RISC_V procesor(clk, reset,
        PC_EX, ALU_OUT_EX, PC_MEM,
        PCSrc,
        DATA_MEMORY_MEM, ALU_DATA_WB,
        forwardA, forwardB,
        pipeline_stall
    );  
  
  always #5 clk=~clk;
  
  initial begin
    #0 clk=1'b1;
       reset=1'b1;      
       
    #10 reset=1'b0;
    #300 $finish;
  end
endmodule
