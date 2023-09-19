module arb_12_4(                 //from low

input [159:0] ready_data0 ,
input [159:0] ready_data1 ,
input [159:0] ready_data2 ,
input [159:0] ready_data3 ,
input [159:0] ready_data4 ,
input [159:0] ready_data5 ,
input [159:0] ready_data6 ,
input [159:0] ready_data7 ,
input [159:0] ready_data8 ,
input [159:0] ready_data9 ,
input [159:0] ready_data10,
input [159:0] ready_data11,

input [11:0]lunch_ready,

output [159:0] lunch_data0,
output [159:0] lunch_data1,
output [159:0] lunch_data2,
output [159:0] lunch_data3,

output [3:0] o_vaild,


output [11:0] i_ready

);

wire [5:0] cnt_0 =lunch_ready[0];
wire [5:0] cnt_1 =lunch_ready[0]+lunch_ready[1];
wire [5:0] cnt_2 =lunch_ready[0]+lunch_ready[1]+lunch_ready[2];
wire [5:0] cnt_3 =lunch_ready[0]+lunch_ready[1]+lunch_ready[2]+lunch_ready[3];
wire [5:0] cnt_4 =lunch_ready[0]+lunch_ready[1]+lunch_ready[2]+lunch_ready[3]+lunch_ready[4];
wire [5:0] cnt_5 =lunch_ready[0]+lunch_ready[1]+lunch_ready[2]+lunch_ready[3]+lunch_ready[4]+lunch_ready[5];
wire [5:0] cnt_6 =lunch_ready[0]+lunch_ready[1]+lunch_ready[2]+lunch_ready[3]+lunch_ready[4]+lunch_ready[5]+lunch_ready[6];
wire [5:0] cnt_7 =lunch_ready[0]+lunch_ready[1]+lunch_ready[2]+lunch_ready[3]+lunch_ready[4]+lunch_ready[5]+lunch_ready[6]+lunch_ready[7];
wire [5:0] cnt_8 =lunch_ready[0]+lunch_ready[1]+lunch_ready[2]+lunch_ready[3]+lunch_ready[4]+lunch_ready[5]+lunch_ready[6]+lunch_ready[7]+lunch_ready[8];
wire [5:0] cnt_9 =lunch_ready[0]+lunch_ready[1]+lunch_ready[2]+lunch_ready[3]+lunch_ready[4]+lunch_ready[5]+lunch_ready[6]+lunch_ready[7]+lunch_ready[8]+lunch_ready[9];
wire [5:0] cnt_10=lunch_ready[0]+lunch_ready[1]+lunch_ready[2]+lunch_ready[3]+lunch_ready[4]+lunch_ready[5]+lunch_ready[6]+lunch_ready[7]+lunch_ready[8]+lunch_ready[9]+lunch_ready[10];
wire [5:0] cnt_11=lunch_ready[0]+lunch_ready[1]+lunch_ready[2]+lunch_ready[3]+lunch_ready[4]+lunch_ready[5]+lunch_ready[6]+lunch_ready[7]+lunch_ready[8]+lunch_ready[9]+lunch_ready[10]+lunch_ready[11];

assign o_vaild=(cnt_11>=4)?4'b1111:(cnt_11==3)?4'b0111:(cnt_11==2)?4'b0011:(cnt_11==1)?4'b0001:0;

wire t_cnt_0 =lunch_ready[0];
wire t_cnt_1 =(cnt_0 == cnt_1 )?1'b0:1'b1;
wire t_cnt_2 =(cnt_1 == cnt_2 )?1'b0:1'b1;
wire t_cnt_3 =(cnt_2 == cnt_3 )?1'b0:1'b1;
wire t_cnt_4 =(cnt_3 == cnt_4 )?1'b0:1'b1;
wire t_cnt_5 =(cnt_4 == cnt_5 )?1'b0:1'b1;
wire t_cnt_6 =(cnt_5 == cnt_6 )?1'b0:1'b1;
wire t_cnt_7 =(cnt_6 == cnt_7 )?1'b0:1'b1;
wire t_cnt_8 =(cnt_7 == cnt_8 )?1'b0:1'b1;
wire t_cnt_9 =(cnt_8 == cnt_9 )?1'b0:1'b1;
wire t_cnt_10=(cnt_9 == cnt_10)?1'b0:1'b1;
wire t_cnt_11=(cnt_10== cnt_11)?1'b0:1'b1;

assign i_ready={t_cnt_0 ,
                t_cnt_1 ,
                t_cnt_2 ,
                t_cnt_3 ,
                t_cnt_4 ,
                t_cnt_5 ,
                t_cnt_6 ,
                t_cnt_7 ,
                t_cnt_8 ,
                t_cnt_9 ,
                t_cnt_10,
                t_cnt_11};

//index

wire [5:0] m0_cnt_0 =(cnt_0 >4 | t_cnt_0 ==0 )?0:cnt_0 ;
wire [5:0] m0_cnt_1 =(cnt_1 >4 | t_cnt_1 ==0 )?0:cnt_1 ;
wire [5:0] m0_cnt_2 =(cnt_2 >4 | t_cnt_2 ==0 )?0:cnt_2 ;
wire [5:0] m0_cnt_3 =(cnt_3 >4 | t_cnt_3 ==0 )?0:cnt_3 ;
wire [5:0] m0_cnt_4 =(cnt_4 >4 | t_cnt_4 ==0 )?0:cnt_4 ;
wire [5:0] m0_cnt_5 =(cnt_5 >4 | t_cnt_5 ==0 )?0:cnt_5 ;
wire [5:0] m0_cnt_6 =(cnt_6 >4 | t_cnt_6 ==0 )?0:cnt_6 ;
wire [5:0] m0_cnt_7 =(cnt_7 >4 | t_cnt_7 ==0 )?0:cnt_7 ;
wire [5:0] m0_cnt_8 =(cnt_8 >4 | t_cnt_8 ==0 )?0:cnt_8 ;
wire [5:0] m0_cnt_9 =(cnt_9 >4 | t_cnt_9 ==0 )?0:cnt_9 ;
wire [5:0] m0_cnt_10=(cnt_10>4 | t_cnt_10==0 )?0:cnt_10;
wire [5:0] m0_cnt_11=(cnt_11>4 | t_cnt_11==0 )?0:cnt_11;


wire [159:0] i1_ready_data0 =(m0_cnt_0 ==1)?ready_data0 :0;
wire [159:0] i1_ready_data1 =(m0_cnt_1 ==1)?ready_data1 :0;
wire [159:0] i1_ready_data2 =(m0_cnt_2 ==1)?ready_data2 :0;
wire [159:0] i1_ready_data3 =(m0_cnt_3 ==1)?ready_data3 :0;
wire [159:0] i1_ready_data4 =(m0_cnt_4 ==1)?ready_data4 :0;
wire [159:0] i1_ready_data5 =(m0_cnt_5 ==1)?ready_data5 :0;
wire [159:0] i1_ready_data6 =(m0_cnt_6 ==1)?ready_data6 :0;
wire [159:0] i1_ready_data7 =(m0_cnt_7 ==1)?ready_data7 :0;
wire [159:0] i1_ready_data8 =(m0_cnt_8 ==1)?ready_data8 :0;
wire [159:0] i1_ready_data9 =(m0_cnt_9 ==1)?ready_data9 :0;
wire [159:0] i1_ready_data10=(m0_cnt_10==1)?ready_data10:0;
wire [159:0] i1_ready_data11=(m0_cnt_11==1)?ready_data11:0;
wire [159:0] i2_ready_data0 =(m0_cnt_0 ==2)?ready_data0 :0;
wire [159:0] i2_ready_data1 =(m0_cnt_1 ==2)?ready_data1 :0;
wire [159:0] i2_ready_data2 =(m0_cnt_2 ==2)?ready_data2 :0;
wire [159:0] i2_ready_data3 =(m0_cnt_3 ==2)?ready_data3 :0;
wire [159:0] i2_ready_data4 =(m0_cnt_4 ==2)?ready_data4 :0;
wire [159:0] i2_ready_data5 =(m0_cnt_5 ==2)?ready_data5 :0;
wire [159:0] i2_ready_data6 =(m0_cnt_6 ==2)?ready_data6 :0;
wire [159:0] i2_ready_data7 =(m0_cnt_7 ==2)?ready_data7 :0;
wire [159:0] i2_ready_data8 =(m0_cnt_8 ==2)?ready_data8 :0;
wire [159:0] i2_ready_data9 =(m0_cnt_9 ==2)?ready_data9 :0;
wire [159:0] i2_ready_data10=(m0_cnt_10==2)?ready_data10:0;
wire [159:0] i2_ready_data11=(m0_cnt_11==2)?ready_data11:0;
wire [159:0] i3_ready_data0 =(m0_cnt_0 ==3)?ready_data0 :0;
wire [159:0] i3_ready_data1 =(m0_cnt_1 ==3)?ready_data1 :0;
wire [159:0] i3_ready_data2 =(m0_cnt_2 ==3)?ready_data2 :0;
wire [159:0] i3_ready_data3 =(m0_cnt_3 ==3)?ready_data3 :0;
wire [159:0] i3_ready_data4 =(m0_cnt_4 ==3)?ready_data4 :0;
wire [159:0] i3_ready_data5 =(m0_cnt_5 ==3)?ready_data5 :0;
wire [159:0] i3_ready_data6 =(m0_cnt_6 ==3)?ready_data6 :0;
wire [159:0] i3_ready_data7 =(m0_cnt_7 ==3)?ready_data7 :0;
wire [159:0] i3_ready_data8 =(m0_cnt_8 ==3)?ready_data8 :0;
wire [159:0] i3_ready_data9 =(m0_cnt_9 ==3)?ready_data9 :0;
wire [159:0] i3_ready_data10=(m0_cnt_10==3)?ready_data10:0;
wire [159:0] i3_ready_data11=(m0_cnt_11==3)?ready_data11:0;
wire [159:0] i4_ready_data0 =(m0_cnt_0 ==4)?ready_data0 :0;
wire [159:0] i4_ready_data1 =(m0_cnt_1 ==4)?ready_data1 :0;
wire [159:0] i4_ready_data2 =(m0_cnt_2 ==4)?ready_data2 :0;
wire [159:0] i4_ready_data3 =(m0_cnt_3 ==4)?ready_data3 :0;
wire [159:0] i4_ready_data4 =(m0_cnt_4 ==4)?ready_data4 :0;
wire [159:0] i4_ready_data5 =(m0_cnt_5 ==4)?ready_data5 :0;
wire [159:0] i4_ready_data6 =(m0_cnt_6 ==4)?ready_data6 :0;
wire [159:0] i4_ready_data7 =(m0_cnt_7 ==4)?ready_data7 :0;
wire [159:0] i4_ready_data8 =(m0_cnt_8 ==4)?ready_data8 :0;
wire [159:0] i4_ready_data9 =(m0_cnt_9 ==4)?ready_data9 :0;
wire [159:0] i4_ready_data10=(m0_cnt_10==4)?ready_data10:0;
wire [159:0] i4_ready_data11=(m0_cnt_11==4)?ready_data11:0;

assign lunch_data0= i1_ready_data0 |
                    i1_ready_data1 |
                    i1_ready_data2 |
                    i1_ready_data3 |
                    i1_ready_data4 |
                    i1_ready_data5 |
                    i1_ready_data6 |
                    i1_ready_data7 |
                    i1_ready_data8 |
                    i1_ready_data9 |
                    i1_ready_data10|
                    i1_ready_data11;

assign lunch_data1= i2_ready_data0 |
                    i2_ready_data1 |
                    i2_ready_data2 |
                    i2_ready_data3 |
                    i2_ready_data4 |
                    i2_ready_data5 |
                    i2_ready_data6 |
                    i2_ready_data7 |
                    i2_ready_data8 |
                    i2_ready_data9 |
                    i2_ready_data10|
                    i2_ready_data11;

assign lunch_data2= i3_ready_data0 |
                    i3_ready_data1 |
                    i3_ready_data2 |
                    i3_ready_data3 |
                    i3_ready_data4 |
                    i3_ready_data5 |
                    i3_ready_data6 |
                    i3_ready_data7 |
                    i3_ready_data8 |
                    i3_ready_data9 |
                    i3_ready_data10|
                    i3_ready_data11;

assign lunch_data3= i4_ready_data0 |
                    i4_ready_data1 |
                    i4_ready_data2 |
                    i4_ready_data3 |
                    i4_ready_data4 |
                    i4_ready_data5 |
                    i4_ready_data6 |
                    i4_ready_data7 |
                    i4_ready_data8 |
                    i4_ready_data9 |
                    i4_ready_data10|
                    i4_ready_data11;

endmodule
