module Coherent_Coff(
	input clk,
	input [11:0] Data_A,Data_B,Data_C,Data_D,Data_E,Data_F,Data_G,Data_H,
	output reg [7:0] Coff
);

wire  [15:0] R1,R2,R3,R4,R5,R6,R7,R8;
wire  [15:0] I1,I2,I3,I4,I5,I6,I7,I8;


reg [15:0] R_IN1,R_IN2,R_IN3,R_IN4,R_IN5,R_IN6,R_IN7,R_IN8;
reg [15:0] I_IN1,I_IN2,I_IN3,I_IN4,I_IN5,I_IN6,I_IN7,I_IN8;						  

	always @(posedge clk) begin
		R_IN1<= Data_A[11]?{5'b0000,Data_A[10:0]}:{5'b11111,Data_A[10:0]};
		R_IN2<= Data_B[11]?{5'b0000,Data_B[10:0]}:{5'b11111,Data_B[10:0]};
		R_IN3<= Data_C[11]?{5'b0000,Data_C[10:0]}:{5'b11111,Data_C[10:0]};
		R_IN4<= Data_D[11]?{5'b0000,Data_D[10:0]}:{5'b11111,Data_D[10:0]};
		R_IN5<= Data_E[11]?{5'b0000,Data_E[10:0]}:{5'b11111,Data_E[10:0]};
		R_IN6<= Data_F[11]?{5'b0000,Data_F[10:0]}:{5'b11111,Data_F[10:0]};
		R_IN7<= Data_G[11]?{5'b0000,Data_G[10:0]}:{5'b11111,Data_G[10:0]};
		R_IN8<= Data_H[11]?{5'b0000,Data_H[10:0]}:{5'b11111,Data_H[10:0]};
		


		I_IN1<= 12'd0;
		I_IN2<= 12'd0;
		I_IN3<= 12'd0;
		I_IN4<= 12'd0;
		I_IN5<= 12'd0;
		I_IN6<= 12'd0;
		I_IN7<= 12'd0;
		I_IN8<= 12'd0;


		
	end
fft_8 U_fft8 (
              .clk        (clk    ),
              .rst        (1'b1    ),
              .butt8_real0(R_IN1),
              .butt8_imag0(I_IN1),
              .butt8_real1(R_IN2),
              .butt8_imag1(I_IN2),
              .butt8_real2(R_IN3),
              .butt8_imag2(I_IN3),
              .butt8_real3(R_IN4),
              .butt8_imag3(I_IN4),
              .butt8_real4(R_IN5),
              .butt8_imag4(I_IN5),
              .butt8_real5(R_IN6),
              .butt8_imag5(I_IN6),
              .butt8_real6(R_IN7),
              .butt8_imag6(I_IN7),
              .butt8_real7(R_IN8),
              .butt8_imag7(I_IN8),
              .y0_real    (R1),
              .y0_imag    (I1),
              .y1_real    (R2),
              .y1_imag    (I2),
              .y2_real    (R3),
              .y2_imag    (I3),
              .y3_real    (R4),
              .y3_imag    (I4),
              .y4_real    (R5),
              .y4_imag    (I5),
              .y5_real    (R6),
              .y5_imag    (I6),
              .y6_real    (R7),
              .y6_imag    (I7),
              .y7_real    (R8),
              .y7_imag    (I8)          
              );						
						



wire [31:0] R1_2,R2_2,R3_2,R4_2,R5_2,R6_2,R7_2,R8_2;
wire [31:0] I1_2,I2_2,I3_2,I4_2,I5_2,I6_2,I7_2,I8_2;


	mult16  mult16_INST_1
	(
	.clock ( clk ),
	.dataa(R1),
	.result(R1_2)
	);
	mult16  mult16_INST_2
	(
	.clock ( clk ),
	.dataa(R2),
	.result(R2_2)
	);
	mult16  mult16_INST_3
	(
	.clock ( clk ),
	.dataa(R3),
	.result(R3_2)
	);
	mult16  mult16_INST_4
	(
	.clock ( clk ),
	.dataa(R4),
	.result(R4_2)
    );
	mult16  mult16_INST_5
	(
	.clock ( clk ),
	.dataa(R5),
	.result(R5_2)
	);
	mult16  mult16_INST_6
	(
	.clock ( clk ),
	.dataa(R6),
	.result(R6_2)
	);
	mult16  mult16_INST_7
	(
	.clock ( clk ),
	.dataa(R7),
	.result(R7_2)
	);
	mult16  mult16_INST_8
	(
	.clock ( clk ),
	.dataa(R8),
	.result(R8_2)
	);
	/*
	mult16  mult16_INST_9
	(
	.clock ( clk ),
	.dataa(R9),
	.result(R9_2)
	);
	mult16  mult16_INST_10
	(
	.clock ( clk ),
	.dataa(R10),
	.result(R10_2)
	);
	mult16  mult16_INST_11
	(
	.clock ( clk ),
	.dataa(R11),
	.result(R11_2)
	);
	mult16  mult16_INST_12
	(
	.clock ( clk ),
	.dataa(R12),
	.result(R12_2)
	);
	mult16  mult16_INST_13
	(
	.clock ( clk ),
	.dataa(R13),
	.result(R13_2)
	);
	mult16  mult16_INST_14
	(
	.clock ( clk ),
	.dataa(R14),
	.result(R14_2)
	);
	mult16  mult16_INST_15
	(
	.clock ( clk ),
	.dataa(R15),
	.result(R15_2)
	);
	mult16  mult16_INST_16
	(
	.clock ( clk ),
	.dataa(R16),
	.result(R16_2)
	);
	*/															


	mult16  mult16_INST_21
	(
	.clock ( clk ),
	.dataa(I1),
	.result(I1_2)
	);
	mult16  mult16_INST_22
	(
	.clock ( clk ),
	.dataa(I2),
	.result(I2_2)
	);
	mult16  mult16_INST_23
	(
	.clock ( clk ),
	.dataa(I3),
	.result(I3_2)
	);
	mult16  mult16_INST_24
	(
	.clock ( clk ),
	.dataa(I4),
	.result(I4_2)
	);
	mult16  mult16_INST_25
	(
	.clock ( clk ),
	.dataa(I5),
	.result(I5_2)
	);
	mult16  mult16_INST_26
	(
	.clock ( clk ),
	.dataa(I6),
	.result(I6_2)
	);
	mult16  mult16_INST_27
	(
	.clock ( clk ),
	.dataa(I7),
	.result(I7_2)
	);
	mult16  mult16_INST_28
	(
	.clock ( clk ),
	.dataa(I8),
	.result(I8_2)
	);

											  
   reg [31:0] RI12,RI22,RI32,RI42,RI52,RI62,RI72,RI82;
   
   always @(posedge clk) begin
		RI12 <=R1_2+I1_2 ;
		RI22 <=R2_2+I2_2 ;
		RI32 <=R3_2+I3_2 ;
		RI42 <=R4_2+I4_2 ;
		RI52 <=R5_2+I5_2 ;
		RI62 <=R6_2+I6_2 ;
		RI72 <=R7_2+I7_2 ;
		RI82 <=R8_2+I8_2 ;
   end
   
   
//original paper is Square, don't need sqrt,Sum(CenterMag^2)/Sum(Mag^2);
wire [34:0] sqrt_sum;
wire [34:0] sqrt_Center;


assign sqrt_Center = RI12 + RI22 +RI82;
assign sqrt_sum =  RI12 + RI22 + RI32 + RI42 + RI52 + RI62 + RI72 + RI82;

 wire [8:0] Coherence_Coff_tmp ;
 
reg [34:0] DIV_DEN;
reg [42:0] DIV_NUM;
 
 always @(posedge clk) begin
	DIV_DEN <= sqrt_sum;
	DIV_NUM <= {sqrt_Center,8'd0};
 end
 
DIV27_19	DIV27_19_inst (
	.clock ( clk ),
	.denom (  DIV_DEN ),
	.numer ( DIV_NUM ),
	.quotient ( Coherence_Coff_tmp ),
	.remain (  )
	);


reg [7:0] Coff1,Coff2,Coff3,Coff4,Coff5,Coff6,Coff7,Coff8,Coff9,Coff10,Coff11,Coff12,Coff13,Coff14,Coff15,Coff16;
reg [11:0] Sum_Coff;
always @(posedge clk) begin
	Coff16 <= Coff15;
	Coff15 <= Coff14;
	Coff14 <= Coff13;
	Coff13 <= Coff12;
	Coff12 <= Coff11;
	Coff11 <= Coff10;
	Coff10 <= Coff9;
	Coff9 <= Coff8;
	Coff8 <= Coff7;
	Coff7 <= Coff6;
	Coff6 <= Coff5;
	Coff5 <= Coff4;
	Coff4 <= Coff3;
	Coff3 <= Coff2;
	Coff2 <= Coff1;
	Coff1 <= Coherence_Coff_tmp;
	Sum_Coff <= Coff1+Coff2+Coff3+Coff4+Coff5+Coff6+Coff7+Coff8+Coff9+Coff10+Coff11+Coff12+Coff13+Coff14+Coff15+Coff16;
	
	Coff <= Sum_Coff[11:4];
end


endmodule
