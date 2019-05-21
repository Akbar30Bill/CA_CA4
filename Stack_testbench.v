
`timescale 1ns/1ns

module Stack_testbench();
  reg  [7:0] data_in;
  reg        push, pop, tos, clk, rst;
  wire [7:0] data_out;
  Stack stack(data_in, push, pop, tos, clk, rst, data_out);
  initial begin
    repeat (250) begin
      #100 clk = 1;
      #100 clk = 0;
    end
  end
  initial begin
    push = 0; pop = 0; tos = 1;
    rst = 1;
    #150
    rst = 0;
    data_in = 8'b00001100;
    push = 1;
    #250
    push = 0;
    #1000
    tos = 1;
    #127
    tos = 0;
    pop = 1;
    #110
    pop = 0;
    #1000;
    $finish;
  end
endmodule
