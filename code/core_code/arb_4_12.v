module arb_4_12(// to high


input [3:0]  inst_en,

input [49:0] inst_t1, 
input [49:0] inst_t2, 
input [49:0] inst_t3, 
input [49:0] inst_t0, 

input [11:0] lunch_buff_empty,

///////////////////////////////////////////////////////

output [11:0] lunch_buff_disp,

output [49:0]inst_t_disp0 ,
output [49:0]inst_t_disp1 ,
output [49:0]inst_t_disp2 ,
output [49:0]inst_t_disp3 ,
output [49:0]inst_t_disp4 ,
output [49:0]inst_t_disp5 ,
output [49:0]inst_t_disp6 ,
output [49:0]inst_t_disp7 ,
output [49:0]inst_t_disp8 ,
output [49:0]inst_t_disp9 ,
output [49:0]inst_t_disp10,
output [49:0]inst_t_disp11,

output i_ready

);
wire i_vaild=|inst_en;

reg [3:0] index0;
reg [3:0] index1;
reg [3:0] index2;
reg [3:0] index3;

reg [11:0]mask1;
reg [11:0]mask2;
reg [11:0]mask3;

always @(*)begin
		 if(inst_en[3]==1)
       casez(lunch_buff_empty)
          12'b1zzzzzzzzzzz : begin index0 = 4'b1100; end	 
          12'b01zzzzzzzzzz : begin index0 = 4'b1011; end		 
          12'b001zzzzzzzzz : begin index0 = 4'b1010; end 
          12'b0001zzzzzzzz : begin index0 = 4'b1001; end	 
          12'b00001zzzzzzz : begin index0 = 4'b1000; end 
          12'b000001zzzzzz : begin index0 = 4'b0111; end	 
          12'b0000001zzzzz : begin index0 = 4'b0110; end		 
          12'b00000001zzzz : begin index0 = 4'b0101; end	 
          12'b000000001zzz : begin index0 = 4'b0100; end
			 12'b0000000001zz : begin index0 = 4'b0011; end
			 12'b00000000001z : begin index0 = 4'b0010; end
			 12'b000000000001 : begin index0 = 4'b0001; end
          default          : begin index0 = 4'b0000; end
        endcase
		  else
				index0=0;
	end 

always@(*)begin 
    mask1=(1<<index0)>>1;
end

wire [11:0] lunch_buff_empty_m1=lunch_buff_empty & (~mask1);

always @(*)begin
	    if(inst_en[2]==1)
       casez(lunch_buff_empty_m1)
          12'b01zzzzzzzzzz : begin index1 = 4'b1011; end		 
          12'b001zzzzzzzzz : begin index1 = 4'b1010; end 
          12'b0001zzzzzzzz : begin index1 = 4'b1001; end	 
          12'b00001zzzzzzz : begin index1 = 4'b1000; end 
          12'b000001zzzzzz : begin index1 = 4'b0111; end	 
          12'b0000001zzzzz : begin index1 = 4'b0110; end		 
          12'b00000001zzzz : begin index1 = 4'b0101; end	 
          12'b000000001zzz : begin index1 = 4'b0100; end
          12'b0000000001zz : begin index1 = 4'b0011; end
			 12'b00000000001z : begin index1 = 4'b0010; end
			 12'b000000000001 : begin index1 = 4'b0001; end
          default          : begin index1 = 4'b0000; end
        endcase
		  else
				index1=0;
	end 

always@(*)begin 
    mask2=(1<<index1)>>1;
end

wire [11:0] lunch_buff_empty_m2=lunch_buff_empty_m1 & (~mask2);

always @(*)begin
		 if(inst_en[1]==1)
       casez(lunch_buff_empty_m2)
//          12'b01zzzzzzzzzz : begin index2 = 4'b1011; end		 
          12'b001zzzzzzzzz : begin index2 = 4'b1010; end 
          12'b0001zzzzzzzz : begin index2 = 4'b1001; end	 
          12'b00001zzzzzzz : begin index2 = 4'b1000; end 
          12'b000001zzzzzz : begin index2 = 4'b0111; end	 
          12'b0000001zzzzz : begin index2 = 4'b0110; end		 
          12'b00000001zzzz : begin index2 = 4'b0101; end	 
          12'b000000001zzz : begin index2 = 4'b0100; end
          12'b0000000001zz : begin index2 = 4'b0011; end
			 12'b00000000001z : begin index2 = 4'b0010; end
			 12'b000000000001 : begin index2 = 4'b0001; end
          default          : begin index2 = 4'b0000; end
        endcase
		  else
			index2=0;
	end 

always@(*)begin 
    mask3=(1<<index2)>>1;
end

wire [11:0] lunch_buff_empty_m3=lunch_buff_empty_m2 & (~mask3);

always @(*)begin
		 if(inst_en[0]==1)
       casez(lunch_buff_empty_m3)
//          12'b01zzzzzzzzzz : begin index3 = 4'b1011; end		 
//          12'b001zzzzzzzzz : begin index3 = 4'b1010; end 
          12'b0001zzzzzzzz : begin index3 = 4'b1001; end	 
          12'b00001zzzzzzz : begin index3 = 4'b1000; end 
          12'b000001zzzzzz : begin index3 = 4'b0111; end	 
          12'b0000001zzzzz : begin index3 = 4'b0110; end		 
          12'b00000001zzzz : begin index3 = 4'b0101; end	 
          12'b000000001zzz : begin index3 = 4'b0100; end
          12'b0000000001zz : begin index3 = 4'b0011; end
			 12'b00000000001z : begin index3 = 4'b0010; end
			 12'b000000000001 : begin index3 = 4'b0001; end
          default          : begin index3 = 4'b0000; end
        endcase
		  else
			index3=0;
	end 

wire [4:0]empty_cnt=
((lunch_buff_empty[0]
+lunch_buff_empty[1])
+
(lunch_buff_empty[2]
+lunch_buff_empty[3]))

+

((lunch_buff_empty[4]
+lunch_buff_empty[5])
+
(lunch_buff_empty[6]
+lunch_buff_empty[7]))

+

((lunch_buff_empty[8]
+lunch_buff_empty[9])
+
(lunch_buff_empty[10]
+lunch_buff_empty[11]));


wire [4:0]en_cnt=inst_en[0]+inst_en[1]+inst_en[2]+inst_en[3];

assign i_ready=i_vaild&(empty_cnt>=en_cnt);

wire [49:0]inst_t_disp0_t0 =(index0==1) ?inst_t3:0;
wire [49:0]inst_t_disp1_t0 =(index0==2) ?inst_t3:0;
wire [49:0]inst_t_disp2_t0 =(index0==3) ?inst_t3:0;
wire [49:0]inst_t_disp3_t0 =(index0==4) ?inst_t3:0;
wire [49:0]inst_t_disp4_t0 =(index0==5) ?inst_t3:0;
wire [49:0]inst_t_disp5_t0 =(index0==6) ?inst_t3:0;
wire [49:0]inst_t_disp6_t0 =(index0==7) ?inst_t3:0;
wire [49:0]inst_t_disp7_t0 =(index0==8) ?inst_t3:0;
wire [49:0]inst_t_disp8_t0 =(index0==9) ?inst_t3:0;
wire [49:0]inst_t_disp9_t0 =(index0==10)?inst_t3:0;
wire [49:0]inst_t_disp10_t0=(index0==11)?inst_t3:0;
wire [49:0]inst_t_disp11_t0=(index0==12)?inst_t3:0;

wire [49:0]inst_t_disp0_t1 =(index1==1) ?inst_t2:0;
wire [49:0]inst_t_disp1_t1 =(index1==2) ?inst_t2:0;
wire [49:0]inst_t_disp2_t1 =(index1==3) ?inst_t2:0;
wire [49:0]inst_t_disp3_t1 =(index1==4) ?inst_t2:0;
wire [49:0]inst_t_disp4_t1 =(index1==5) ?inst_t2:0;
wire [49:0]inst_t_disp5_t1 =(index1==6) ?inst_t2:0;
wire [49:0]inst_t_disp6_t1 =(index1==7) ?inst_t2:0;
wire [49:0]inst_t_disp7_t1 =(index1==8) ?inst_t2:0;
wire [49:0]inst_t_disp8_t1 =(index1==9) ?inst_t2:0;
wire [49:0]inst_t_disp9_t1 =(index1==10)?inst_t2:0;
wire [49:0]inst_t_disp10_t1=(index1==11)?inst_t2:0;
wire [49:0]inst_t_disp11_t1=(index1==12)?inst_t2:0;

wire [49:0]inst_t_disp0_t2 =(index2==1) ?inst_t1:0;
wire [49:0]inst_t_disp1_t2 =(index2==2) ?inst_t1:0;
wire [49:0]inst_t_disp2_t2 =(index2==3) ?inst_t1:0;
wire [49:0]inst_t_disp3_t2 =(index2==4) ?inst_t1:0;
wire [49:0]inst_t_disp4_t2 =(index2==5) ?inst_t1:0;
wire [49:0]inst_t_disp5_t2 =(index2==6) ?inst_t1:0;
wire [49:0]inst_t_disp6_t2 =(index2==7) ?inst_t1:0;
wire [49:0]inst_t_disp7_t2 =(index2==8) ?inst_t1:0;
wire [49:0]inst_t_disp8_t2 =(index2==9) ?inst_t1:0;
wire [49:0]inst_t_disp9_t2 =(index2==10)?inst_t1:0;
wire [49:0]inst_t_disp10_t2=(index2==11)?inst_t1:0;
wire [49:0]inst_t_disp11_t2=(index2==12)?inst_t1:0;

wire [49:0]inst_t_disp0_t3 =(index3==1) ?inst_t0:0;
wire [49:0]inst_t_disp1_t3 =(index3==2) ?inst_t0:0;
wire [49:0]inst_t_disp2_t3 =(index3==3) ?inst_t0:0;
wire [49:0]inst_t_disp3_t3 =(index3==4) ?inst_t0:0;
wire [49:0]inst_t_disp4_t3 =(index3==5) ?inst_t0:0;
wire [49:0]inst_t_disp5_t3 =(index3==6) ?inst_t0:0;
wire [49:0]inst_t_disp6_t3 =(index3==7) ?inst_t0:0;
wire [49:0]inst_t_disp7_t3 =(index3==8) ?inst_t0:0;
wire [49:0]inst_t_disp8_t3 =(index3==9) ?inst_t0:0;
wire [49:0]inst_t_disp9_t3 =(index3==10)?inst_t0:0;
wire [49:0]inst_t_disp10_t3=(index3==11)?inst_t0:0;
wire [49:0]inst_t_disp11_t3=(index3==12)?inst_t0:0;


assign inst_t_disp0  = (i_ready==1)?(inst_t_disp0_t0 |inst_t_disp0_t2 |inst_t_disp0_t1 |inst_t_disp0_t3 ):0;
assign inst_t_disp1  = (i_ready==1)?(inst_t_disp1_t0 |inst_t_disp1_t2 |inst_t_disp1_t1 |inst_t_disp1_t3 ):0;
assign inst_t_disp2  = (i_ready==1)?(inst_t_disp2_t0 |inst_t_disp2_t2 |inst_t_disp2_t1 |inst_t_disp2_t3 ):0;
assign inst_t_disp3  = (i_ready==1)?(inst_t_disp3_t0 |inst_t_disp3_t2 |inst_t_disp3_t1 |inst_t_disp3_t3 ):0;
assign inst_t_disp4  = (i_ready==1)?(inst_t_disp4_t0 |inst_t_disp4_t2 |inst_t_disp4_t1 |inst_t_disp4_t3 ):0;
assign inst_t_disp5  = (i_ready==1)?(inst_t_disp5_t0 |inst_t_disp5_t2 |inst_t_disp5_t1 |inst_t_disp5_t3 ):0;
assign inst_t_disp6  = (i_ready==1)?(inst_t_disp6_t0 |inst_t_disp6_t2 |inst_t_disp6_t1 |inst_t_disp6_t3 ):0;
assign inst_t_disp7  = (i_ready==1)?(inst_t_disp7_t0 |inst_t_disp7_t2 |inst_t_disp7_t1 |inst_t_disp7_t3 ):0;
assign inst_t_disp8  = (i_ready==1)?(inst_t_disp8_t0 |inst_t_disp8_t2 |inst_t_disp8_t1 |inst_t_disp8_t3 ):0;
assign inst_t_disp9  = (i_ready==1)?(inst_t_disp9_t0 |inst_t_disp9_t2 |inst_t_disp9_t1 |inst_t_disp9_t3 ):0;
assign inst_t_disp10 = (i_ready==1)?(inst_t_disp10_t0|inst_t_disp10_t2|inst_t_disp10_t1|inst_t_disp10_t3):0;
assign inst_t_disp11 = (i_ready==1)?(inst_t_disp11_t0|inst_t_disp11_t2|inst_t_disp11_t1|inst_t_disp11_t3):0;




assign lunch_buff_disp[0 ]=|inst_t_disp0 ;
assign lunch_buff_disp[1 ]=|inst_t_disp1 ;
assign lunch_buff_disp[2 ]=|inst_t_disp2 ;
assign lunch_buff_disp[3 ]=|inst_t_disp3 ;
assign lunch_buff_disp[4 ]=|inst_t_disp4 ;
assign lunch_buff_disp[5 ]=|inst_t_disp5 ;
assign lunch_buff_disp[6 ]=|inst_t_disp6 ;
assign lunch_buff_disp[7 ]=|inst_t_disp7 ;
assign lunch_buff_disp[8 ]=|inst_t_disp8 ;
assign lunch_buff_disp[9 ]=|inst_t_disp9 ;
assign lunch_buff_disp[10]=|inst_t_disp10;
assign lunch_buff_disp[11]=|inst_t_disp11;



endmodule 