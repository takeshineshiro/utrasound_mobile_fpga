//****************************************************//
//Author:   |Wei.Shen
//Edit:     |edit the CORDIC arithmetic
//Edit Date:|2005.04.26
//Update: 	|
//Edit Date:| 
//Descript: |this module used to caculate the amplitude and 
//          |angle of a signal. the angle have divide with PI
//****************************************************//
module coordinate_cordic
(
	realIn,
	imagIn,
	clk,
	amplitude,
	angle,
	test1,
	test2
);

//==================================================
//				Input/Output Ports
//==================================================
input signed [INWIDTH-1:0]realIn,imagIn;
input clk;
output signed [OUTWIDTH-1:0]amplitude;
output signed [ANGLEWIDTH-1:0]angle;

input  [9:0] test1;
output  [9:0] test2;
assign  test2 = {11{test1}};
//==================================================
//				Parameter Declaration
//==================================================
parameter INWIDTH = 18,  //input data width
		  OUTWIDTH = 20, //output data width
		  MIDWIDTH = 21, //the temporary data width
		  ANGLEWIDTH =15;//the angle width,use degree unit and four bits precision
		                 //in fraction part,highest is sign bit
///180degree respect to 10000  for angle 
// amplititude with a factor of 1.647  for iteration >10 times

parameter ARCTANG_0  = 12'b10_01110_00100,//0.7854 expand with 10000*/PI times is +7854 = +2500
		  ARCTANG_1  = 11'b1_01110_00100,//0.4636 expand with 10000*/PI times is +4636 = +1476
		  ARCTANG_2  = 10'b11000_01100,//0.2450 expand with 10000*/PI times is +2450 = +780
		  ARCTANG_3  = 9'b1100_01100,//0.1244 expand with 10000*/PI times is +1244 = +396
		  ARCTANG_4  = 8'b110_00111,//0.0624 expand with 10000*/PI times is +624 = +199
		  ARCTANG_5  = 7'b11_00011,//0.0312 expand with 10000*/PI times is +312 = +99
          ARCTANG_6  = 6'b1_10010,//0.0156 expand with 10000*/PI times is +156 = +50
          ARCTANG_7  = 5'b11001,//0.0078 expand with 10000*/PI times is +78 = +25
          ARCTANG_8  = 4'b1100,//0.0039 expand with 10000*/PI times is +39 = +12
          ARCTANG_9  = 3'b110,//0.0020 expand with 10000*/PI times is +20 = +6
          ARCTANG_10 = 2'b11,//0.0010 expand with 10000*/PI times is +10 = +3
          ARCTANG_11 = 2'b10;//0.0005 expand with 10000*/PI times is +5 = +2
parameter HALFPI = 13'b100_11100_01000;//+15708/PI = +5000

//==================================================
//				Register Declaration
//==================================================
reg signed [MIDWIDTH-1:0]xData1,xData2,xData3,xData4,xData5,xData6,
                         xData7,xData8,xData9,xData10,xData11,xData12,
                         xData13,xData14,xData15,xData16,
				         yData1,yData2,yData3,yData4,yData5,yData6,
				         yData7,yData8,yData9,yData10,yData11,yData12,
				         yData13,yData14,yData15,yData16;

reg signed [ANGLEWIDTH-1:0]angle1,angle2,angle3,angle4,angle5,angle6,
					       angle7,angle8,angle9,angle10,angle11,angle12,
					       angle13,angle14,angle15,angle16;


//==================================================
//				Wire Declaration
//==================================================
wire signed [MIDWIDTH-1:0]reIn,imIn;
wire signed [ANGLEWIDTH-1:0]ang;
//==================================================
//				Integer Declaration
//==================================================


//==================================================
//				Concurrent Assignment
//==================================================

assign reIn = realIn[INWIDTH-1]?(imagIn[INWIDTH-1]?-imagIn:imagIn):realIn;
assign imIn = realIn[INWIDTH-1]?(imagIn[INWIDTH-1]?realIn:-realIn):imagIn;
assign ang = realIn[INWIDTH-1]?(imagIn[INWIDTH-1]?-HALFPI:HALFPI):1'b0;
/*
//change 23 bits to 22 bits
assign amplitude = {xData13[MIDWIDTH-1],xData13[MIDWIDTH-3:0]};
//angle have expand with 10000 times
assign angle = angle13;
*/

assign amplitude = {xData12[MIDWIDTH-1],xData12[MIDWIDTH-3:0]};
assign angle = angle12;



//==================================================
//				Always Construct
//==================================================


always@(posedge clk)
begin
    // if y < 0 then d = 1;
    // x = x - y.d.2^-i;
    // y = y + x.d.2^-i;
    // z = z - d.arctan(2^-i);

    // i = 0   
    xData1 <= imIn[MIDWIDTH-1]?(reIn - imIn):(reIn + imIn);
	yData1 <= imIn[MIDWIDTH-1]?(imIn + reIn):(imIn - reIn);
	angle1 <= imIn[MIDWIDTH-1]?(ang - ARCTANG_0):(ang + ARCTANG_0);

    // i = 1
    xData2 <= yData1[MIDWIDTH-1]?(xData1 - {{2{yData1[MIDWIDTH-1]}},yData1[MIDWIDTH-2:1]}):(xData1 + {{2{yData1[MIDWIDTH-1]}},yData1[MIDWIDTH-2:1]});
	yData2 <= yData1[MIDWIDTH-1]?(yData1 + {{2{xData1[MIDWIDTH-1]}},xData1[MIDWIDTH-2:1]}):(yData1 - {{2{xData1[MIDWIDTH-1]}},xData1[MIDWIDTH-2:1]});
	angle2 <= yData1[MIDWIDTH-1]?(angle1 - ARCTANG_1):(angle1 + ARCTANG_1);

    // i = 2
    xData3 <= yData2[MIDWIDTH-1]?(xData2 - {{3{yData2[MIDWIDTH-1]}},yData2[MIDWIDTH-2:2]}):(xData2 + {{3{yData2[MIDWIDTH-1]}},yData2[MIDWIDTH-2:2]});
	yData3 <= yData2[MIDWIDTH-1]?(yData2 + {{3{xData2[MIDWIDTH-1]}},xData2[MIDWIDTH-2:2]}):(yData2 - {{3{xData2[MIDWIDTH-1]}},xData2[MIDWIDTH-2:2]});
	angle3 <= yData2[MIDWIDTH-1]?(angle2 - ARCTANG_2):(angle2 + ARCTANG_2);

    // i = 3
    xData4 <= yData3[MIDWIDTH-1]?(xData3 - {{4{yData3[MIDWIDTH-1]}},yData3[MIDWIDTH-2:3]}):(xData3 + {{4{yData3[MIDWIDTH-1]}},yData3[MIDWIDTH-2:3]});
	yData4 <= yData3[MIDWIDTH-1]?(yData3 + {{4{xData3[MIDWIDTH-1]}},xData3[MIDWIDTH-2:3]}):(yData3 - {{4{xData3[MIDWIDTH-1]}},xData3[MIDWIDTH-2:3]});
	angle4 <= yData3[MIDWIDTH-1]?(angle3 - ARCTANG_3):(angle3 + ARCTANG_3);

    // i = 4
    xData5 <= yData4[MIDWIDTH-1]?(xData4 - {{5{yData4[MIDWIDTH-1]}},yData4[MIDWIDTH-2:4]}):(xData4 + {{5{yData4[MIDWIDTH-1]}},yData4[MIDWIDTH-2:4]});
	yData5 <= yData4[MIDWIDTH-1]?(yData4 + {{5{xData4[MIDWIDTH-1]}},xData4[MIDWIDTH-2:4]}):(yData4 - {{5{xData4[MIDWIDTH-1]}},xData4[MIDWIDTH-2:4]});
	angle5 <= yData4[MIDWIDTH-1]?(angle4 - ARCTANG_4):(angle4 + ARCTANG_4);

    // i = 5
    xData6 <= yData5[MIDWIDTH-1]?(xData5 - {{6{yData5[MIDWIDTH-1]}},yData5[MIDWIDTH-2:5]}):(xData5 + {{6{yData5[MIDWIDTH-1]}},yData5[MIDWIDTH-2:5]});
	yData6 <= yData5[MIDWIDTH-1]?(yData5 + {{6{xData5[MIDWIDTH-1]}},xData5[MIDWIDTH-2:5]}):(yData5 - {{6{xData5[MIDWIDTH-1]}},xData5[MIDWIDTH-2:5]});
	angle6 <= yData5[MIDWIDTH-1]?(angle5 - ARCTANG_5):(angle5 + ARCTANG_5);

    // i = 6
    xData7 <= yData6[MIDWIDTH-1]?(xData6 - {{7{yData6[MIDWIDTH-1]}},yData6[MIDWIDTH-2:6]}):(xData6 + {{7{yData6[MIDWIDTH-1]}},yData6[MIDWIDTH-2:6]});
	yData7 <= yData6[MIDWIDTH-1]?(yData6 + {{7{xData6[MIDWIDTH-1]}},xData6[MIDWIDTH-2:6]}):(yData6 - {{7{xData6[MIDWIDTH-1]}},xData6[MIDWIDTH-2:6]});
	angle7 <= yData6[MIDWIDTH-1]?(angle6 - ARCTANG_6):(angle6 + ARCTANG_6);

    // i = 7
    xData8 <= yData7[MIDWIDTH-1]?(xData7 - {{8{yData7[MIDWIDTH-1]}},yData7[MIDWIDTH-2:7]}):(xData7 + {{8{yData7[MIDWIDTH-1]}},yData7[MIDWIDTH-2:7]});
	yData8 <= yData7[MIDWIDTH-1]?(yData7 + {{8{xData7[MIDWIDTH-1]}},xData7[MIDWIDTH-2:7]}):(yData7 - {{8{xData7[MIDWIDTH-1]}},xData7[MIDWIDTH-2:7]});
	angle8 <= yData7[MIDWIDTH-1]?(angle7 - ARCTANG_7):(angle7 + ARCTANG_7);

    // i = 8
    xData9 <= yData8[MIDWIDTH-1]?(xData8 - {{9{yData8[MIDWIDTH-1]}},yData8[MIDWIDTH-2:8]}):(xData8 + {{9{yData8[MIDWIDTH-1]}},yData8[MIDWIDTH-2:8]});
	yData9 <= yData8[MIDWIDTH-1]?(yData8 + {{9{xData8[MIDWIDTH-1]}},xData8[MIDWIDTH-2:8]}):(yData8 - {{9{xData8[MIDWIDTH-1]}},xData8[MIDWIDTH-2:8]});
	angle9 <= yData8[MIDWIDTH-1]?(angle8 - ARCTANG_8):(angle8 + ARCTANG_8);

    // i = 9
    xData10 <= yData9[MIDWIDTH-1]?(xData9 - {{10{yData9[MIDWIDTH-1]}},yData9[MIDWIDTH-2:9]}):(xData9 + {{10{yData9[MIDWIDTH-1]}},yData9[MIDWIDTH-2:9]});
	yData10 <= yData9[MIDWIDTH-1]?(yData9 + {{10{xData9[MIDWIDTH-1]}},xData9[MIDWIDTH-2:9]}):(yData9 - {{10{xData9[MIDWIDTH-1]}},xData9[MIDWIDTH-2:9]});
	angle10 <= yData9[MIDWIDTH-1]?(angle9 - ARCTANG_9):(angle9 + ARCTANG_9);

    // i = 10
    xData11 <= yData10[MIDWIDTH-1]?(xData10 - {{11{yData10[MIDWIDTH-1]}},yData10[MIDWIDTH-2:10]}):(xData10 + {{11{yData10[MIDWIDTH-1]}},yData10[MIDWIDTH-2:10]});
	yData11 <= yData10[MIDWIDTH-1]?(yData10 + {{11{xData10[MIDWIDTH-1]}},xData10[MIDWIDTH-2:10]}):(yData10 - {{11{xData10[MIDWIDTH-1]}},xData10[MIDWIDTH-2:10]});
	angle11 <= yData10[MIDWIDTH-1]?(angle10 - ARCTANG_10):(angle10 + ARCTANG_10);

    // i = 11
    xData12 <= yData11[MIDWIDTH-1]?(xData11 - {{12{yData11[MIDWIDTH-1]}},yData11[MIDWIDTH-2:11]}):(xData11 + {{12{yData11[MIDWIDTH-1]}},yData11[MIDWIDTH-2:11]});
	yData12 <= yData11[MIDWIDTH-1]?(yData11 + {{12{xData11[MIDWIDTH-1]}},xData11[MIDWIDTH-2:11]}):(yData11 - {{12{xData11[MIDWIDTH-1]}},xData11[MIDWIDTH-2:11]});
	angle12 <= yData11[MIDWIDTH-1]?(angle11 - ARCTANG_11):(angle11 + ARCTANG_11);
	
   
	
end	
//==================================================
//				Module Instantiation
//==================================================

//==================================================
//				Task Declaration
//==================================================

//==================================================
//				Function Declaration
//==================================================

endmodule
