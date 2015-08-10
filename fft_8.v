`timescale 1ns/100ps
module fft_8 (
              clk,
              rst,
              butt8_real0,
              butt8_imag0,
              butt8_real1,
              butt8_imag1,
              butt8_real2,
              butt8_imag2,
              butt8_real3,
              butt8_imag3,
              butt8_real4,
              butt8_imag4,
              butt8_real5,
              butt8_imag5,
              butt8_real6,
              butt8_imag6,
              butt8_real7,
              butt8_imag7,
              y0_real,
              y0_imag,
              y1_real,
              y1_imag,
              y2_real,
              y2_imag,
              y3_real,
              y3_imag,
              y4_real,
              y4_imag,
              y5_real,
              y5_imag,
              y6_real,
              y6_imag,
              y7_real,
              y7_imag              
              );

parameter RST_LVL = 1'b0;

input clk;
input rst;
input [15:0] butt8_real0;
input [15:0] butt8_imag0;
input [15:0] butt8_real1;
input [15:0] butt8_imag1;
input [15:0] butt8_real2;
input [15:0] butt8_imag2;
input [15:0] butt8_real3;
input [15:0] butt8_imag3;
input [15:0] butt8_real4;
input [15:0] butt8_imag4;
input [15:0] butt8_real5;
input [15:0] butt8_imag5;
input [15:0] butt8_real6;
input [15:0] butt8_imag6;
input [15:0] butt8_real7;
input [15:0] butt8_imag7;
output [15:0] y0_real;
output [15:0] y0_imag;
output [15:0] y1_real;
output [15:0] y1_imag;
output [15:0] y2_real;
output [15:0] y2_imag;
output [15:0] y3_real;
output [15:0] y3_imag;
output [15:0] y4_real;
output [15:0] y4_imag;
output [15:0] y5_real;
output [15:0] y5_imag;
output [15:0] y6_real;
output [15:0] y6_imag;
output [15:0] y7_real;
output [15:0] y7_imag;

wire [15:0] gd_real0;
wire [15:0] gd_imag0;
wire [15:0] gd_real1;
wire [15:0] gd_imag1;
wire [15:0] hd_real0;
wire [15:0] hd_imag0;
wire [15:0] hd_real1;
wire [15:0] hd_imag1;
wire [15:0] gs_real0;
wire [15:0] gs_imag0;
wire [15:0] gs_real1;
wire [15:0] gs_imag1;
wire [15:0] hs_real0;
wire [15:0] hs_imag0;
wire [15:0] hs_real1;
wire [15:0] hs_imag1;

wire [15:0] g_real0;
wire [15:0] g_imag0;
wire [15:0] g_real1;
wire [15:0] g_imag1;
wire [15:0] g_real2;
wire [15:0] g_imag2;
wire [15:0] g_real3;
wire [15:0] g_imag3;
wire [15:0] h_real0;
wire [15:0] h_imag0;
wire [15:0] h_real1;
wire [15:0] h_imag1;
wire [15:0] h_real2;
wire [15:0] h_imag2;
wire [15:0] h_real3;
wire [15:0] h_imag3;

wire [15:0] factor_real0;
wire [15:0] factor_imag0;
wire [15:0] factor_real1;
wire [15:0] factor_imag1;
wire [15:0] factor_real2;
wire [15:0] factor_imag2;
wire [15:0] factor_real3;
wire [15:0] factor_imag3;

assign factor_real0 = 16'h2000;  //W(0,N)  COS(0*2*PI/8) * 8192
assign factor_imag0 = 16'h0000;  //W(0,N)  -SIN(0*2*PI/8)* 8192
assign factor_real1 = 16'h16a0;  //W(1,N)  COS(1*2*PI/8) * 8192
assign factor_imag1 = 16'he95f;  //W(1,N)  -SIN(1*2*PI/8)* 8192
assign factor_real2 = 16'h0000;  //W(2,N)  COS(2*2*PI/8) * 8192
assign factor_imag2 = 16'he000;  //W(2,N)  -SIN(2*2*PI/8)* 8192
assign factor_real3 = 16'he95f;  //W(3,N)  COS(3*2*PI/8) * 8192
assign factor_imag3 = 16'he95f;  //W(3,N)  -SIN(3*2*PI/8)* 8192

butter_2  U0_unit0( 
          .clk        (clk         ),
          .rst        (rst         ),
          .butt2_real0(butt8_real0 ),
          .butt2_imag0(butt8_imag0 ),
          .butt2_real1(butt8_real4 ),
          .butt2_imag1(butt8_imag4 ),
          .factor_real(factor_real0),
          .factor_imag(factor_imag0),
          .y0_real    (gd_real0    ),
          .y0_imag    (gd_imag0    ),
          .y1_real    (gd_real1    ),
          .y1_imag    (gd_imag1    )
                 );
butter_2  U0_unit1( 
          .clk        (clk         ),
          .rst        (rst         ),
          .butt2_real0(butt8_real2 ),
          .butt2_imag0(butt8_imag2 ),
          .butt2_real1(butt8_real6 ),
          .butt2_imag1(butt8_imag6 ),
          .factor_real(factor_real0),
          .factor_imag(factor_imag0),
          .y0_real    (hd_real0    ),
          .y0_imag    (hd_imag0    ),
          .y1_real    (hd_real1    ),
          .y1_imag    (hd_imag1    )
                 );  
butter_2  U0_unit2( 
          .clk        (clk         ),
          .rst        (rst         ),
          .butt2_real0(butt8_real1 ),
          .butt2_imag0(butt8_imag1 ),
          .butt2_real1(butt8_real5 ),
          .butt2_imag1(butt8_imag5 ),
          .factor_real(factor_real0),
          .factor_imag(factor_imag0),
          .y0_real    (gs_real0    ),
          .y0_imag    (gs_imag0    ),
          .y1_real    (gs_real1    ),
          .y1_imag    (gs_imag1    )
                 );
butter_2  U0_unit3( 
          .clk        (clk         ),
          .rst        (rst         ),
          .butt2_real0(butt8_real3 ),
          .butt2_imag0(butt8_imag3 ),
          .butt2_real1(butt8_real7 ),
          .butt2_imag1(butt8_imag7 ),
          .factor_real(factor_real0),
          .factor_imag(factor_imag0),
          .y0_real    (hs_real0    ),
          .y0_imag    (hs_imag0    ),
          .y1_real    (hs_real1    ),
          .y1_imag    (hs_imag1    )
                 ); 
                 

butter_2  U1_unit0( 
          .clk        (clk         ),
          .rst        (rst         ),
          .butt2_real0(gd_real0    ),
          .butt2_imag0(gd_imag0    ),
          .butt2_real1(hd_real0    ),
          .butt2_imag1(hd_imag0    ),
          .factor_real(factor_real0),
          .factor_imag(factor_imag0),
          .y0_real    (g_real0     ),
          .y0_imag    (g_imag0     ),
          .y1_real    (g_real2     ),
          .y1_imag    (g_imag2     )
                 ); 
butter_2  U1_unit1( 
          .clk        (clk         ),
          .rst        (rst         ),
          .butt2_real0(gd_real1    ),
          .butt2_imag0(gd_imag1    ),
          .butt2_real1(hd_real1    ),
          .butt2_imag1(hd_imag1    ),
          .factor_real(factor_real2),
          .factor_imag(factor_imag2),
          .y0_real    (g_real1     ),
          .y0_imag    (g_imag1     ),
          .y1_real    (g_real3     ),
          .y1_imag    (g_imag3     )
                 );                                  
butter_2  U1_unit2( 
          .clk        (clk         ),
          .rst        (rst         ),
          .butt2_real0(gs_real0    ),
          .butt2_imag0(gs_imag0    ),
          .butt2_real1(hs_real0    ),
          .butt2_imag1(hs_imag0    ),
          .factor_real(factor_real0),
          .factor_imag(factor_imag0),
          .y0_real    (h_real0     ),
          .y0_imag    (h_imag0     ),
          .y1_real    (h_real2     ),
          .y1_imag    (h_imag2     )
                 );                 
butter_2  U1_unit3( 
          .clk        (clk         ),
          .rst        (rst         ),
          .butt2_real0(gs_real1    ),
          .butt2_imag0(gs_imag1    ),
          .butt2_real1(hs_real1    ),
          .butt2_imag1(hs_imag1    ),
          .factor_real(factor_real2),
          .factor_imag(factor_imag2),
          .y0_real    (h_real1     ),
          .y0_imag    (h_imag1     ),
          .y1_real    (h_real3     ),
          .y1_imag    (h_imag3     )
                 );

butter_2  U2_unit0( 
          .clk        (clk         ),
          .rst        (rst         ),
          .butt2_real0(g_real0     ),
          .butt2_imag0(g_imag0     ),
          .butt2_real1(h_real0     ),
          .butt2_imag1(h_imag0     ),
          .factor_real(factor_real0),
          .factor_imag(factor_imag0),
          .y0_real    (y0_real     ),
          .y0_imag    (y0_imag     ),
          .y1_real    (y4_real     ),
          .y1_imag    (y4_imag     )
                 ); 

butter_2  U2_unit1( 
          .clk        (clk         ),
          .rst        (rst         ),
          .butt2_real0(g_real1     ),
          .butt2_imag0(g_imag1     ),
          .butt2_real1(h_real1     ),
          .butt2_imag1(h_imag1     ),
          .factor_real(factor_real1),
          .factor_imag(factor_imag1),
          .y0_real    (y1_real     ),
          .y0_imag    (y1_imag     ),
          .y1_real    (y5_real     ),
          .y1_imag    (y5_imag     )
                 ); 
butter_2  U2_unit2( 
          .clk        (clk         ),
          .rst        (rst         ),
          .butt2_real0(g_real2     ),
          .butt2_imag0(g_imag2     ),
          .butt2_real1(h_real2     ),
          .butt2_imag1(h_imag2     ),
          .factor_real(factor_real2),
          .factor_imag(factor_imag2),
          .y0_real    (y2_real     ),
          .y0_imag    (y2_imag     ),
          .y1_real    (y6_real     ),
          .y1_imag    (y6_imag     )
                 );                                                 
butter_2  U2_unit3( 
          .clk        (clk         ),
          .rst        (rst         ),
          .butt2_real0(g_real3     ),
          .butt2_imag0(g_imag3     ),
          .butt2_real1(h_real3     ),
          .butt2_imag1(h_imag3     ),
          .factor_real(factor_real3),
          .factor_imag(factor_imag3),
          .y0_real    (y3_real     ),
          .y0_imag    (y3_imag     ),
          .y1_real    (y7_real     ),
          .y1_imag    (y7_imag     )
                 );
endmodule
