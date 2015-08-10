`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:51:37 03/12/2013 
// Design Name: 
// Module Name:    butterfly_radix4_2nd 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module butterfly_radix4_2nd(
										input clk,
										
										input[15:0] re_0,
										input[15:0] re_1,
										input[15:0] re_2,
										input[15:0] re_3,
										input[15:0] re_4,
										input[15:0] re_5,
										input[15:0] re_6,
										input[15:0] re_7,
										input[15:0] re_8,
										input[15:0] re_9,
										input[15:0] re_10,
										input[15:0] re_11,
										input[15:0] re_12,
										input[15:0] re_13,
										input[15:0] re_14,
										input[15:0] re_15,
										
										input[15:0] im_0,
										input[15:0] im_1,
										input[15:0] im_2,
										input[15:0] im_3,
										input[15:0] im_4,
										input[15:0] im_5,
										input[15:0] im_6,
										input[15:0] im_7,
										input[15:0] im_8,
										input[15:0] im_9,
										input[15:0] im_10,
										input[15:0] im_11,
										input[15:0] im_12,
										input[15:0] im_13,
										input[15:0] im_14,
										input[15:0] im_15,

										output[15:0] butterfly_re0,
										output[15:0] butterfly_re1,
										output[15:0] butterfly_re2,
										output[15:0] butterfly_re3,
										output[15:0] butterfly_re4,
										output[15:0] butterfly_re5,
										output[15:0] butterfly_re6,
										output[15:0] butterfly_re7,
										output[15:0] butterfly_re8,
										output[15:0] butterfly_re9,
										output[15:0] butterfly_re10,
										output[15:0] butterfly_re11,
										output[15:0] butterfly_re12,
										output[15:0] butterfly_re13,
										output[15:0] butterfly_re14,
										output[15:0] butterfly_re15,
										
										output[15:0] butterfly_im0,
										output[15:0] butterfly_im1,
										output[15:0] butterfly_im2,
										output[15:0] butterfly_im3,
										output[15:0] butterfly_im4,
										output[15:0] butterfly_im5,
										output[15:0] butterfly_im6,
										output[15:0] butterfly_im7,
										output[15:0] butterfly_im8,
										output[15:0] butterfly_im9,
										output[15:0] butterfly_im10,
										output[15:0] butterfly_im11,
										output[15:0] butterfly_im12,
										output[15:0] butterfly_im13,
										output[15:0] butterfly_im14,
										output[15:0] butterfly_im15
                            );

	parameter cos0 = 16'b0111111111111111;
	parameter cos1 = 16'b0111111111111111;
	parameter cos2 = 16'b0111111111111111;
	parameter cos3 = 16'b0111011001000001;
	parameter cos4 = 16'b0101101010000010;
	parameter cos5 = 16'b0011000011111100;
	parameter cos6 = 16'b0101101010000010;
	parameter cos7 = 16'b0000000000000000;
	parameter cos8 = 16'b1010010101111110;
	parameter cos9 = 16'b0011000011111100;
	parameter cos10 = 16'b1010010101111110;
	parameter cos11 = 16'b1000100110111111;
	parameter sin0 = 16'b0000000000000000;
	parameter sin1 = 16'b0000000000000000;
	parameter sin2 = 16'b0000000000000000;
	parameter sin3 = 16'b1100111100000100;
	parameter sin4 = 16'b1010010101111110;
	parameter sin5 = 16'b1000100110111111;
	parameter sin6 = 16'b1010010101111110;
	parameter sin7 = 16'b1000000000000001;
	parameter sin8 = 16'b1010010101111110;
	parameter sin9 = 16'b1000100110111111;
	parameter sin10 = 16'b1010010101111110;
	parameter sin11 = 16'b0011000011111100;
	
	butterfly_unit_radix4 inst0_butterfly_unit_radix4(
																			.clk(clk),
																			.cos0(cos0),
																			.sin0(sin0),
																			.cos1(cos1),
																			.sin1(sin1),
																			.cos2(cos2),
																			.sin2(sin2),
																			
																			.x1_re(re_0),
																			.x1_im(im_0),
																			.x2_re(re_4),
																			.x2_im(im_4),
																			.x3_re(re_8),
																			.x3_im(im_8),
																			.x4_re(re_12),
																			.x4_im(im_12),
																			
																			.p1_re(butterfly_re0),
																			.p1_im(butterfly_im0),
																			.p2_re(butterfly_re4),
																			.p2_im(butterfly_im4),
																			.p3_re(butterfly_re8),
																			.p3_im(butterfly_im8),
																			.p4_re(butterfly_re12),
																			.p4_im(butterfly_im12)
																	  );
																	  
	butterfly_unit_radix4 inst1_butterfly_unit_radix4(
																			.clk(clk),
																			.cos0(cos3),
																			.sin0(sin3),
																			.cos1(cos4),
																			.sin1(sin4),
																			.cos2(cos5),
																			.sin2(sin5),
																			
																			.x1_re(re_1),
																			.x1_im(im_1),
																			.x2_re(re_5),
																			.x2_im(im_5),
																			.x3_re(re_9),
																			.x3_im(im_9),
																			.x4_re(re_13),
																			.x4_im(im_13),
																			
																			.p1_re(butterfly_re1),
																			.p1_im(butterfly_im1),
																			.p2_re(butterfly_re5),
																			.p2_im(butterfly_im5),
																			.p3_re(butterfly_re9),
																			.p3_im(butterfly_im9),
																			.p4_re(butterfly_re13),
																			.p4_im(butterfly_im13)
																	  );
																	  
	butterfly_unit_radix4 inst2_butterfly_unit_radix4(
																			.clk(clk),
																			.cos0(cos6),
																			.sin0(sin6),
																			.cos1(cos7),
																			.sin1(sin7),
																			.cos2(cos8),
																			.sin2(sin8),
																			
																			.x1_re(re_2),
																			.x1_im(im_2),
																			.x2_re(re_6),
																			.x2_im(im_6),
																			.x3_re(re_10),
																			.x3_im(im_10),
																			.x4_re(re_14),
																			.x4_im(im_14),
																			
																			.p1_re(butterfly_re2),
																			.p1_im(butterfly_im2),
																			.p2_re(butterfly_re6),
																			.p2_im(butterfly_im6),
																			.p3_re(butterfly_re10),
																			.p3_im(butterfly_im10),
																			.p4_re(butterfly_re14),
																			.p4_im(butterfly_im14)
																	  );
	butterfly_unit_radix4 inst3_butterfly_unit_radix4(
																			.clk(clk),
																			.cos0(cos9),
																			.sin0(sin9),
																			.cos1(cos10),
																			.sin1(sin10),
																			.cos2(cos11),
																			.sin2(sin11),
																			
																			.x1_re(re_3),
																			.x1_im(im_3),
																			.x2_re(re_7),
																			.x2_im(im_7),
																			.x3_re(re_11),
																			.x3_im(im_11),
																			.x4_re(re_15),
																			.x4_im(im_15),
																			
																			.p1_re(butterfly_re3),
																			.p1_im(butterfly_im3),
																			.p2_re(butterfly_re7),
																			.p2_im(butterfly_im7),
																			.p3_re(butterfly_re11),
																			.p3_im(butterfly_im11),
																			.p4_re(butterfly_re15),
																			.p4_im(butterfly_im15)
																	  );

endmodule
