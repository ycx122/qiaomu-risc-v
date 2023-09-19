module itag_c(
input [44:0]inst_t0,
input [44:0]inst_t1,
input [44:0]inst_t2,
input [44:0]inst_t3,

input [3:0]inst_en,//inst in en

output [49:0]inst_1,
output [49:0]inst_2,
output [49:0]inst_3,
output [49:0]inst_0,

output [3:0]inst_out_en, //have itag,fifo not empty

input [7:0] wb_itag_en,

input [4:0]itag_0,
input [4:0]itag_1,
input [4:0]itag_2,
input [4:0]itag_3,
input [4:0]itag_4,
input [4:0]itag_5,
input [4:0]itag_6,
input [4:0]itag_7,

input clk,
input rst_n
);

wire [4:0] itag_out_0;
wire [4:0] itag_out_1;
wire [4:0] itag_out_2;
wire [4:0] itag_out_3;

wire empty;

assign inst_out_en={4{~empty}} & inst_en;

assign inst_0={inst_t0,itag_out_0};
assign inst_1={inst_t1,itag_out_1};
assign inst_2={inst_t2,itag_out_2};
assign inst_3={inst_t3,itag_out_3};


fifo
#(
  'd5  ,								//FIFO位宽
  'd32 								//FIFO深度
)
fifo_0
(
.clk	   	(clk),		//系统时钟
.rst_n    	(rst_n),       //低电平有效的复位信号
.data_in0   (itag_0),       //写入的数据
.data_in1	(itag_1),       //写入的数据
.data_in2	(itag_2),       //写入的数据
.data_in3	(itag_3),       //写入的数据
.data_in4	(itag_4),       //写入的数据
.data_in5	(itag_5),       //写入的数据
.data_in6	(itag_6),       //写入的数据
.data_in7	(itag_7),       //写入的数据
.rd_en	   (inst_en),       //读使能信号，高电平有效
.wr_en	   (wb_itag_en),       //写使能信号，高电平有效		                                        
.data_out0  (itag_out_0),	    //输出的数据
.data_out1  (itag_out_1),	    //输出的数据
.data_out2  (itag_out_2),	    //输出的数据
.data_out3  (itag_out_3),	    //输出的数据
.empty	   (empty),	    //空标志，高电平表示当前FIFO已被写满
.full		   () //满标志，高电平表示当前FIFO已被读空
);   





endmodule

module	fifo
#(
	parameter   DATA_WIDTH = 'd5  ,								//FIFO位宽
    parameter   DATA_DEPTH = 'd32 								//FIFO深度
)
(
	input										clk		,		//系统时钟
	input										rst_n	,       //低电平有效的复位信号
	
	///////////////////////////////////////////////////////////////////////////////////////////////////
	
	input	[DATA_WIDTH-1:0]					data_in0 ,       //写入的数据
	input	[DATA_WIDTH-1:0]					data_in1	,       //写入的数据
	input	[DATA_WIDTH-1:0]					data_in2	,       //写入的数据
	input	[DATA_WIDTH-1:0]					data_in3	,       //写入的数据
	input	[DATA_WIDTH-1:0]					data_in4	,       //写入的数据
	input	[DATA_WIDTH-1:0]					data_in5	,       //写入的数据
	input	[DATA_WIDTH-1:0]					data_in6	,       //写入的数据
	input	[DATA_WIDTH-1:0]					data_in7	,       //写入的数据
	
	///////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	input	[3:0]				rd_en	,       //读使能信号，高电平有效
	input	[7:0]  			wr_en	,       //写使能信号，高电平有效
						                                        
	output	reg	[DATA_WIDTH-1:0]				data_out0,	    //输出的数据
	output	reg	[DATA_WIDTH-1:0]				data_out1,	    //输出的数据
	output	reg	[DATA_WIDTH-1:0]				data_out2,	    //输出的数据
	output	reg	[DATA_WIDTH-1:0]				data_out3,	    //输出的数据
	
	
	output										empty	,	    //空标志，高电平表示当前FIFO已被写满
	output										full		    //满标志，高电平表示当前FIFO已被读空
);                                                              
 
//reg define
//用二维数组实现RAM
reg [DATA_WIDTH - 1 : 0]			fifo_buffer[DATA_DEPTH - 1 : 0];	
reg [$clog2(DATA_DEPTH) : 0]		wr_ptr;						//写地址指针，位宽多一位	
reg [$clog2(DATA_DEPTH) : 0]		rd_ptr;						//读地址指针，位宽多一位	
 
//wire define
wire [$clog2(DATA_DEPTH) - 1 : 0]	wr_ptr_true;				//真实写地址指针
wire [$clog2(DATA_DEPTH) - 1 : 0]	rd_ptr_true;				//真实读地址指针
wire								wr_ptr_msb;					//写地址指针地址最高位
wire								rd_ptr_msb;					//读地址指针地址最高位
 
assign {wr_ptr_msb,wr_ptr_true} = wr_ptr;						//将最高位与其他位拼接
assign {rd_ptr_msb,rd_ptr_true} = rd_ptr;						//将最高位与其他位拼接
 
//读操作,更新读地址



always @ (posedge clk) begin
	if (rst_n == 1'b0)
		rd_ptr <= 'd0;
	else if (rd_en!=0 && !empty)begin								//读使能有效且非空
		rd_ptr <= rd_ptr + rd_en[0]+rd_en[1]+rd_en[2]+rd_en[3];
	end
end



always @(*) begin
	data_out0 <= fifo_buffer[rd_ptr_true]  &{5{rd_en[0]}};
	data_out1 <= fifo_buffer[rd_ptr_true+1]&{5{rd_en[1]}};
	data_out2 <= fifo_buffer[rd_ptr_true+2]&{5{rd_en[2]}};
	data_out3 <= fifo_buffer[rd_ptr_true+3]&{5{rd_en[3]}};
	end



//写操作,更新写地址
always @ (posedge clk) begin
	if (!rst_n)
		wr_ptr <= 6'b100000;
	else if (!full && wr_en!=0)begin								//写使能有效且非满
		wr_ptr <= wr_ptr + wr_en[0]+ wr_en[1]+ wr_en[2]+ wr_en[3]+ wr_en[4]+ wr_en[5]+ wr_en[6]+ wr_en[7];
		//fifo_buffer[wr_ptr_true] <= data_in;
	end	
end
 
always @(posedge clk) 
if(!rst_n)
	begin
	fifo_buffer[0 ] <= 0 ;
	fifo_buffer[1 ] <= 1 ;
	fifo_buffer[2 ] <= 2 ;
	fifo_buffer[3 ] <= 3 ;
	fifo_buffer[4 ] <= 4 ;
	fifo_buffer[5 ] <= 5 ;
	fifo_buffer[6 ] <= 6 ;
	fifo_buffer[7 ] <= 7 ;
	fifo_buffer[8 ] <= 8 ;
	fifo_buffer[9 ] <= 9 ;
	fifo_buffer[10] <= 10;
	fifo_buffer[11] <= 11;
	fifo_buffer[12] <= 12;
	fifo_buffer[13] <= 13;
	fifo_buffer[14] <= 14;
	fifo_buffer[15] <= 15;
	fifo_buffer[16] <= 16;
	fifo_buffer[17] <= 17;
	fifo_buffer[18] <= 18;
	fifo_buffer[19] <= 19;
	fifo_buffer[20] <= 20;
	fifo_buffer[21] <= 21;
	fifo_buffer[22] <= 22;
	fifo_buffer[23] <= 23;
	fifo_buffer[24] <= 24;
	fifo_buffer[25] <= 25;
	fifo_buffer[26] <= 26;
	fifo_buffer[27] <= 27;
	fifo_buffer[28] <= 28;
	fifo_buffer[29] <= 29;
	fifo_buffer[30] <= 30;
	fifo_buffer[31] <= 31;
	end
else if (!full && wr_en!=0)
	begin
	if(wr_en[0]==1)
		fifo_buffer[wr_ptr_true]   <= data_in0;
		
	if(wr_en[1]==1)
		fifo_buffer[wr_ptr_true+wr_en[0]] <= data_in1;
		
	if(wr_en[2]==1)
		fifo_buffer[wr_ptr_true+wr_en[0]+wr_en[1]] <= data_in2;
		
	if(wr_en[3]==1)
		fifo_buffer[wr_ptr_true+wr_en[0]+wr_en[1]+wr_en[2]] <= data_in3;
		
	if(wr_en[4]==1)
		fifo_buffer[wr_ptr_true+wr_en[0]+ wr_en[1]+ wr_en[2]+ wr_en[3]] <= data_in4;
		
	if(wr_en[5]==1)
		fifo_buffer[wr_ptr_true+wr_en[0]+ wr_en[1]+ wr_en[2]+ wr_en[3]+ wr_en[4]] <= data_in5;
	
	if(wr_en[6]==1)
		fifo_buffer[wr_ptr_true+wr_en[0]+ wr_en[1]+ wr_en[2]+ wr_en[3]+ wr_en[4]+ wr_en[5]] <= data_in6;
		
	if(wr_en[7]==1)
		fifo_buffer[wr_ptr_true + wr_en[0]+ wr_en[1]+ wr_en[2]+ wr_en[3]+ wr_en[4]+ wr_en[5]+ wr_en[6]] <= data_in7;
	
	end

//更新指示信号
//当所有位相等时，读指针追到到了写指针，FIFO被读空
assign	empty = ( {2'b00,wr_ptr}  <= ({2'b00,rd_ptr} + rd_en[0] + rd_en[1] + rd_en[2] + rd_en[3]) ) ? 1'b1 : 1'b0;//( wr_ptr == rd_ptr ) ? 1'b1 : 1'b0; //?
//当最高位不同但是其他位相等时，写指针超过读指针一圈，FIFO被写满
assign	full  = ( (wr_ptr_msb != rd_ptr_msb ) && ( ({2'b00,wr_ptr_true}+ wr_en[0]+ wr_en[1]+ wr_en[2]+ wr_en[3]+ wr_en[4]+ wr_en[5]+ wr_en[6]+ wr_en[7]) >= {2'b00,rd_ptr_true} ) )? 1'b1 : 1'b0;//( (wr_ptr_msb != rd_ptr_msb ) && ( wr_ptr_true == rd_ptr_true ) )? 1'b1 : 1'b0;
 
endmodule 