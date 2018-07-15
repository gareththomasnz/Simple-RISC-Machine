module virtual_tb;
  reg [3:0] KEY;
  reg [9:0] SW;
  wire [9:0] LEDR; 
  wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
  reg err;
  reg CLOCK_50;

  top DUT(KEY,SW,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,CLOCK_50);
  initial forever begin
    CLOCK_50 = 0; #5;
    CLOCK_50 = 1; #5;
  end
  wire break = (LEDR[8] == 1'b1);
  /*
  MOV R5, seed
  LDR R5, [R5]
  MOV R4, stem
  LDR R4, [R4]
  MOV R3, result
  LDR R3, [R3]
  MOV R0, #10
  MOV R1, #7
  STR R0, [R5]
  STR R1, [R5, #-1]
  MOV R2, tree
  BLX R2
  STR R0, [R3]
  MOV R0, #4
  MOV R1, #8
  STR R0, [R4]
  STR R1, [R4, #-1]
  MOV R2, leaf
  BLX R2
  STR R0, [R3, #1]
  HALT
  tree:
  LDR R0, [R5]
  LDR R1, [R5, #-1]
  ADD R0, R0, R1
  BX R7
  leaf:
  LDR R0, [R4]
  LDR R1, [R4, #-1]
  ADD R0, R0, R1
  BX R7
  */
  initial begin
    err = 0;
    KEY[1] = 1'b0; // reset asserted
    #10; // wait until next falling edge of clock
    KEY[1] = 1'b1; // reset de-asserted, PC still undefined if as in Figure 4
    while (~break) begin
      @(posedge (DUT.CPU.CTRL.present_state == 20'h01) or posedge break);  // wait until IF1 
      @(negedge CLOCK_50); // show advance to negative edge of clock
      $display("PC = %h", DUT.CPU.PC); 
    end
    if (DUT.MEM.mem[221] !== 16'd17 & DUT.MEM.mem[221] !== 16'd12) begin err = 1; $display("FAILED: result wrong"); $stop; end
    if (~err) $display("PASSED");
    $stop;
  end
endmodule
