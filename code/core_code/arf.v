
module arf(

input [4:0]read_idex_0,
input [4:0]read_idex_1,
input [4:0]read_idex_2,
input [4:0]read_idex_3,
input [4:0]read_idex_4,
input [4:0]read_idex_5,
input [4:0]read_idex_6,
input [4:0]read_idex_7,

output [63:0]read_data_0,
output [63:0]read_data_1,
output [63:0]read_data_2,
output [63:0]read_data_3,
output [63:0]read_data_4,
output [63:0]read_data_5,
output [63:0]read_data_6,
output [63:0]read_data_7,

input [4:0]wb_idex_0,
input [4:0]wb_idex_1,
input [4:0]wb_idex_2,
input [4:0]wb_idex_3,

input [63:0]wb_data_0,
input [63:0]wb_data_1,
input [63:0]wb_data_2,
input [63:0]wb_data_3,

input wb_en_0,
input wb_en_1,
input wb_en_2,
input wb_en_3,

input read_en_0,
input read_en_1,
input read_en_2,
input read_en_3,
input read_en_4,
input read_en_5,
input read_en_6,
input read_en_7,

input clk,
input rst_n

);

reg [63:0] reg_buff [31:0];

assign read_data_0 = (read_en_0==1) ? reg_buff[read_idex_0] : 0;
assign read_data_1 = (read_en_1==1) ? reg_buff[read_idex_1] : 0;
assign read_data_2 = (read_en_2==1) ? reg_buff[read_idex_2] : 0;
assign read_data_3 = (read_en_3==1) ? reg_buff[read_idex_3] : 0;
assign read_data_4 = (read_en_4==1) ? reg_buff[read_idex_4] : 0;
assign read_data_5 = (read_en_5==1) ? reg_buff[read_idex_5] : 0;
assign read_data_6 = (read_en_6==1) ? reg_buff[read_idex_6] : 0;
assign read_data_7 = (read_en_7==1) ? reg_buff[read_idex_7] : 0;

always@(posedge clk)
if(rst_n==0)begin
reg_buff[0 ]=0;
reg_buff[1 ]=0;
reg_buff[2 ]=0;
reg_buff[3 ]=0;
reg_buff[4 ]=0;
reg_buff[5 ]=0;
reg_buff[6 ]=0;
reg_buff[7 ]=0;
reg_buff[8 ]=0;
reg_buff[9 ]=0;
reg_buff[10]=0;
reg_buff[11]=0;
reg_buff[12]=0;
reg_buff[13]=0;
reg_buff[14]=0;
reg_buff[15]=0;
reg_buff[16]=0;
reg_buff[17]=0;
reg_buff[18]=0;
reg_buff[19]=0;
reg_buff[20]=0;
reg_buff[21]=0;
reg_buff[22]=0;
reg_buff[23]=0;
reg_buff[24]=0;
reg_buff[25]=0;
reg_buff[26]=0;
reg_buff[27]=0;
reg_buff[28]=0;
reg_buff[29]=0;
reg_buff[30]=0;
reg_buff[31]=0;
end
else begin
reg_buff[wb_idex_0]=(wb_en_0==1 | wb_idex_0==0)?wb_data_0:reg_buff[wb_idex_0];
reg_buff[wb_idex_1]=(wb_en_1==1 | wb_idex_1==0)?wb_data_1:reg_buff[wb_idex_1];
reg_buff[wb_idex_2]=(wb_en_2==1 | wb_idex_2==0)?wb_data_2:reg_buff[wb_idex_2];
reg_buff[wb_idex_3]=(wb_en_3==1 | wb_idex_3==0)?wb_data_3:reg_buff[wb_idex_3];
end

endmodule
