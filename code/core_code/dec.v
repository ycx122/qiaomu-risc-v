module dec (
input [31:0] inst_in,
input inst_en,

output [44:0]inst_t
);

  wire [31:0] inst=(inst_en==1)?inst_in:0;
  wire [4:0]rs1_rdix;
  wire [4:0]rs2_rdix;
  wire [4:0]rd_rdix;
  
  wire [19:0]imm;
  wire [9:0]opcode;// 5bit type 5bit opcode
  
  wire rv64=(inst[1:0]==2'b11)?1'b1:1'b0;

  /////////////////////////////////////////////////////////////////
  wire [6:0]  ropcode = inst[6:0];
  
  wire opcode_4_2_000 = (ropcode[4:2] == 3'b000);
  wire opcode_4_2_001 = (ropcode[4:2] == 3'b001);
  wire opcode_4_2_010 = (ropcode[4:2] == 3'b010);
  wire opcode_4_2_011 = (ropcode[4:2] == 3'b011);
  wire opcode_4_2_100 = (ropcode[4:2] == 3'b100);
  wire opcode_4_2_101 = (ropcode[4:2] == 3'b101);
  wire opcode_4_2_110 = (ropcode[4:2] == 3'b110);
  wire opcode_4_2_111 = (ropcode[4:2] == 3'b111);
  wire opcode_6_5_00  = (ropcode[6:5] == 2'b00);
  wire opcode_6_5_01  = (ropcode[6:5] == 2'b01);
  wire opcode_6_5_10  = (ropcode[6:5] == 2'b10);
  wire opcode_6_5_11  = (ropcode[6:5] == 2'b11);
  
  /////////////////////////////////////////////////////////////////
  wire [2:0]  func3  = inst[14:12];
  
  wire func3_000 = (func3 == 3'b000);
  wire func3_001 = (func3 == 3'b001);
  wire func3_010 = (func3 == 3'b010);
  wire func3_011 = (func3 == 3'b011);
  wire func3_100 = (func3 == 3'b100);
  wire func3_101 = (func3 == 3'b101);
  wire func3_110 = (func3 == 3'b110);
  wire func3_111 = (func3 == 3'b111);
  
  /////////////////////////////////////////////////////////////////
  wire [6:0]  func7  = inst[31:25];
  
  wire func7_0000000 = (func7 == 7'b0000000);
  wire func7_0100000 = (func7 == 7'b0100000);
  
  ////////////////////////////////////////////////////////////////
  
  
  wire add = rv64 & opcode_4_2_100 & opcode_6_5_01 & func3_000 & func7_0000000;
  wire sub = rv64 & opcode_4_2_100 & opcode_6_5_01 & func3_000 & func7_0100000;
  wire sll = rv64 & opcode_4_2_100 & opcode_6_5_01 & func3_001 & func7_0000000;
  wire slt = rv64 & opcode_4_2_100 & opcode_6_5_01 & func3_010 & func7_0000000;
  wire sltu=rv64 & opcode_4_2_100 & opcode_6_5_01 & func3_011 & func7_0000000;
  wire rxor=rv64 & opcode_4_2_100 & opcode_6_5_01 & func3_100 & func7_0000000;
  wire srl =rv64 & opcode_4_2_100 & opcode_6_5_01 & func3_101 & func7_0000000;
  wire sra =rv64 & opcode_4_2_100 & opcode_6_5_01 & func3_101 & func7_0100000;
  wire ror =rv64 & opcode_4_2_100 & opcode_6_5_01 & func3_110 & func7_0000000;
  wire rand=rv64 & opcode_4_2_100 & opcode_6_5_01 & func3_111 & func7_0000000;
  
  
  wire type5=add 
             |sub 
             |sll 
             |slt 
             |sltu
             |rxor
             |srl 
             |sra 
             |ror 
             |rand;
  
  
  assign opcode[9:5]= (type5==1)?5:0;
  
  assign opcode[4:0]=
  ({5{add }}&1 )|
  ({5{sub }}&2 )|
  ({5{sll }}&3 )|
  ({5{slt }}&4 )|
  ({5{sltu}}&5 )|
  ({5{rxor}}&6 )|
  ({5{srl }}&7 )|
  ({5{sra }}&8 )|
  ({5{ror }}&9 )|
  ({5{rand}}&10);

  wire [4:0]rs1=inst[19:15];
  wire [4:0]rs2=inst[24:20];
  wire [4:0]rd =inst[11:7] ;
  
  assign rs1_rdix={5{type5}}& rs1;
  assign rs2_rdix={5{type5}}& rs2;
  assign rd_rdix ={5{type5}}& rd ;
  
  assign imm=0;

  assign inst_t={
  rs1_rdix,
  rs2_rdix,
  rd_rdix,
  imm,
  opcode
  };


endmodule