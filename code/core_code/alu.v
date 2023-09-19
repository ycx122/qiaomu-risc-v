module alu(
input alu_en,
input [159:0] data_in,

output [73:0] data_out,
output rd_en

);

wire [63:0] rs1   ;
wire [63:0] rs2   ;
wire [4:0] rd_idex;
wire [11:0] imm   ;
wire [4:0] op_type   ;
wire [4:0] op     ; 
wire [4:0] itag   ;

reg  [63:0] rd_wb        ;
wire [4:0]  rd_idex_wb   ;
wire [4:0]  itag_wb      ;

assign rd_idex_wb=rd_idex;
assign itag_wb=itag      ;
assign rd_en=alu_en      ;

assign data_out={
rd_wb      ,
rd_idex_wb ,
itag_wb    
};


assign{
rs1    ,
rs2    ,
rd_idex,
imm    ,
op_type   ,
op     ,
itag   }=data_in;

parameter add =1 ,
          sub =2 ,
          sll =3 ,
          slt =4 ,
          sltu=5 ,
          rxor=6 ,
          srl =7 ,
          sra =8 ,
          ror =9 ,
          arand=10;


always@(*)
if(alu_en==1) begin
	case(op)
		1 :rd_wb=rs1+rs2;
		2 :rd_wb=rs1-rs2;
		3 :rd_wb=rs1<<rs2[5:0];
		4 :rd_wb=slt_re;
		5 :rd_wb=(rs1<rs2)?1:0;
		6 :rd_wb=rs1^rs2;
		7 :rd_wb=rs1>>rs2[5:0];
		8 :rd_wb=sra_re[63:0];
		9 :rd_wb=rs1|rs2;
		10:rd_wb=rs1&rs2;
		default: rd_wb=0;
	endcase
	end
else
	rd_wb=0;


wire rs1_neg =(rs1[63]==1)?1'b1:1'b0;
wire rs2_neg =(rs2[63]==1)?1'b1:1'b0;

wire [63:0] rs1_pos=(rs1_neg)?(-rs1):rs1;
wire [63:0] rs2_pos=(rs2_neg)?(-rs2):rs2;

reg [63:0]slt_re;

always@(*)
	if(rs1_neg==0 & rs2_neg==0) begin
		slt_re=(rs1_pos<rs2_pos)?1:0;
		end
	else if(rs1_neg==0 & rs2_neg==1) begin
		slt_re=0;
		end
	else if(rs1_neg==1 & rs2_neg==0) begin
		slt_re=1;
		end
	else if(rs1_neg==1 & rs2_neg==1) begin
		slt_re=(rs1_pos>rs2_pos)?1:0;
		end
	else
		slt_re=0;
		

wire [127:0]sra_re=(rs1_neg==1)?({{64{1'b1}},rs1}>>rs2[5:0]):({{64{1'b0}},rs1}>>rs2[5:0]);
		

endmodule






