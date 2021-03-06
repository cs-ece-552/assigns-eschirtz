/*
   CS/ECE 552, Spring '19
   Auto generated by python
*/
module control_hier_bench_csv(/*AUTOARG*/);
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire       err;
   wire       RegWrite, DMemWrite,              // From top of control_hier.v
              DMemEn, ALUSrc2, PCSrc,           // From top of control_hier.v
              PCImm, MemToReg, DMemDump, Jump;         // From top of control_hier.v
   wire [1:0] RegDst;                           // From top of control_hier.v
   wire [2:0] SESel;                            // From top of control_hier.v
   // End of automatics
   /*AUTOREGINPUT*/
   // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
   reg [4:0]  OpCode;                           // To top of control_hier.v
   reg [1:0]  Funct;                            // To top of control_hier.v
   // End of automatics

   integer    cycle_count;

   wire       clk;
   wire       rst;

   reg        fail;
   reg [5:0]  errorCount;

   // Instantiate the module we want to verify

   control_hier DUT(/*AUTOINST*/
                    // Outputs
                    .err                          (err),
                    .RegDst                       (RegDst),
                    .SESel                        (SESel),
                    .RegWrite                     (RegWrite),
                    .DMemWrite                    (DMemWrite),
                    .DMemEn                       (DMemEn),
                    .ALUSrc2                      (ALUSrc2),
                    .PCSrc                        (PCSrc),
                    .PCImm                        (PCImm),
                    .MemToReg                     (MemToReg),
                    .DMemDump                     (DMemDump),
                    .Jump                         (Jump),
                    // Inputs
                    .OpCode                       (OpCode),
                    .Funct                        (Funct));

    assign               clk = DUT.clk_generator.clk;
    assign               rst = DUT.clk_generator.rst;
    initial begin
      errorCount = 6'b0;
      $display("Running Tests...\n");

      OpCode = 5'b00000;
      Funct = 2'bxx;
      repeat(2) @(posedge clk);
      @(posedge clk)begin
        $display("HAULT");
        if(
          err !== 1'b0 ||
          RegDst !== 2'bxx ||
          SESel !== 3'bxxx ||
          RegWrite !== 1'b0 ||
          DMemWrite !== 1'b0 ||
          DMemEn !== 1'b0 ||
          ALUSrc2 !== 1'b0 ||
          PCSrc !== 1'b0 ||
          MemToReg !== 1'b0 ||
          DMemDump !== 1'b1 ||
          Jump !== 1'b0 ||
          PCImm !== 1'b0
          ) begin
          errorCount = errorCount + 1;
          $display("\tERROR!");
          $display("\tOUTPUT: Opcode: %b   ->   Error: %b, RegDst: %b, SESel: %b, RegWrite: %b, DMemWrite: %b, DMemEn: %b, ALUSrc2: %b, PCSrc: %b, MemToReg: %b, DMemDump: %b, Jump: %b, PCImm: %b\n", OpCode, err,
                    RegDst,
                    SESel,
                    RegWrite,
                    DMemWrite,
                    DMemEn,
                    ALUSrc2,
                    PCSrc,
                    MemToReg,
                    DMemDump,
                    Jump,
                    PCImm);
          $display("\tEXPECT: Opcode: %b   ->   Error: %b, RegDst: %b, SESel: %b, RegWrite: %b, DMemWrite: %b, DMemEn: %b, ALUSrc2: %b, PCSrc: %b, MemToReg: %b, DMemDump: %b, Jump: %b, PCImm: %b\n", OpCode, err,
                    RegDst,
                    SESel,
                    RegWrite,
                    DMemWrite,
                    DMemEn,
                    ALUSrc2,
                    PCSrc,
                    MemToReg,
                    DMemDump,
                    Jump,
                    PCImm);
        end else begin
          $display("\tPASSED");
        end
      end

      OpCode = 5'b00000;
      Funct = 2'bxx;
      repeat(2) @(posedge clk);
      @(posedge clk)begin
        $display("NOP");
        if(
          err !== 1'b0 ||
          RegDst !== 2'bxx ||
          SESel !== 3'bxxx ||
          RegWrite !== 1'b0 ||
          DMemWrite !== 1'b0 ||
          DMemEn !== 1'b0 ||
          ALUSrc2 !== 1'b0 ||
          PCSrc !== 1'b0 ||
          MemToReg !== 1'b0 ||
          DMemDump !== 1'b1 ||
          Jump !== 1'b0 ||
          PCImm !== 1'b0
          ) begin
          errorCount = errorCount + 1;
          $display("\tERROR!");
          $display("\tOUTPUT: Opcode: %b   ->   Error: %b, RegDst: %b, SESel: %b, RegWrite: %b, DMemWrite: %b, DMemEn: %b, ALUSrc2: %b, PCSrc: %b, MemToReg: %b, DMemDump: %b, Jump: %b, PCImm: %b", OpCode, err,
                    RegDst,
                    SESel,
                    RegWrite,
                    DMemWrite,
                    DMemEn,
                    ALUSrc2,
                    PCSrc,
                    MemToReg,
                    DMemDump,
                    Jump,
                    PCImm);
          $display("\tEXPECT: Opcode: %b   ->   Error: %b, RegDst: %b, SESel: %b, RegWrite: %b, DMemWrite: %b, DMemEn: %b, ALUSrc2: %b, PCSrc: %b, MemToReg: %b, DMemDump: %b, Jump: %b, PCImm: %b", OpCode, err,
                    RegDst,
                    SESel,
                    RegWrite,
                    DMemWrite,
                    DMemEn,
                    ALUSrc2,
                    PCSrc,
                    MemToReg,
                    DMemDump,
                    Jump,
                    PCImm);
          end else begin
            $display("\tPASSED");
          end
      end
      $display("Test Completed");
      $display("Number Of Errors: %d", errorCount);
      $finish;
    end

endmodule // control_hier_bench
