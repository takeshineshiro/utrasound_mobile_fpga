`timescale 1ns/100ps
module butter_2  ( 
                 clk,
                 rst,
                 butt2_real0,
                 butt2_imag0,
                 butt2_real1,
                 butt2_imag1,
                 factor_real,
                 factor_imag,
                 y0_real,
                 y0_imag,
                 y1_real,
                 y1_imag
                 );

parameter RST_LVL = 1'b0;
  
input clk;
input rst;
input [15:0] butt2_real0;
input [15:0] butt2_imag0;
input [15:0] butt2_real1;
input [15:0] butt2_imag1;
input [15:0] factor_real;
input [15:0] factor_imag;
output reg [15:0] y0_real;
output reg [15:0] y0_imag;
output reg [15:0] y1_real;
output reg [15:0] y1_imag;

wire [31:0] mult_real0;
wire [31:0] mult_real1;
wire [31:0] mult_imag0;
wire [31:0] mult_imag1;
wire [31:0] result_real0;
wire [31:0] result_real1;
wire [31:0] result_imag0;
wire [31:0] result_imag1;
reg [31:0] result_real0_next;
reg [31:0] result_imag0_next;
reg [31:0] result_real1_next;
reg [31:0] result_imag1_next;
wire [31:0] adder_real0;
wire [31:0] adder_imag0;
reg [31:0] adder_real0_next[2:0];
reg [31:0] adder_imag0_next[2:0];
wire [31:0] adder_real1;
wire [31:0] adder_imag1;
reg [31:0] adder_real1_next;
reg [31:0] adder_imag1_next;
wire [31:0] y0_result_real;
wire [31:0] y0_result_imag;
wire [31:0] y1_result_real;
wire [31:0] y1_result_imag;
reg [31:0] y0_result_real_next;
reg [31:0] y0_result_imag_next;
reg [31:0] y1_result_real_next;
reg [31:0] y1_result_imag_next;
wire [15:0] output0_real;
wire [15:0] output0_imag;
wire [15:0] output1_real;
wire [15:0] output1_imag;
reg [15:0] output0_real_next;
reg [15:0] output0_imag_next;
reg [15:0] output1_real_next;
reg [15:0] output1_imag_next;



	mult16_12	mult16_12_real0 (
		.clock ( clk ),
		.dataa ( factor_real ),
		.datab ( butt2_real1 ),
		.result ( mult_real0 )
	);

	mult16_12	mult16_12_real1 (
		.clock ( clk ),
		.dataa ( factor_imag ),
		.datab ( butt2_imag1 ),
		.result ( mult_real1 )
	);

	mult16_12	mult16_12_imag0 (
		.clock ( clk ),
		.dataa ( factor_imag ),
		.datab ( butt2_real1 ),
		.result ( mult_imag0 )
	);
	
	mult16_12	mult16_12_imag1(
		.clock ( clk ),
		.dataa ( factor_real ),
		.datab ( butt2_imag1 ),
		.result ( mult_imag1 )
	);



/*
mult32_24 U_mult_real0 (
           .clk     (clk        ),
           .rst     (rst        ),
           .mult_a  (factor_real),
           .mult_b  (butt2_real1),
           .mult_out(mult_real0 )
           
                      );
                      
mult32_24 U_mult_real1 ( 
           .clk     (clk        ),
           .rst     (rst        ),
           .mult_a  (factor_imag),
           .mult_b  (butt2_imag1),
           .mult_out(mult_real1 )
                      );
mult32_24 U_mult_imag0 (
           .clk     (clk        ),
           .rst     (rst        ),
           .mult_a  (factor_imag),
           .mult_b  (butt2_real1),
           .mult_out(mult_imag0 )
                      );                                           
mult32_24 U_mult_imag1 (
           .clk     (clk        ),
           .rst     (rst        ),
           .mult_a  (factor_real),
           .mult_b  (butt2_imag1),
           .mult_out(mult_imag1 )
                      );
*/                      
                      


assign result_real0 = (mult_real0 == 32'b0)? 32'b0 : 
             (mult_real0[31])? {13'b1111111111111,mult_real0[31:13]} : {13'b0,mult_real0[31:13]};  //divide 8192
assign result_real1 = (mult_real1 == 32'b0)? 32'b0 : 
             (mult_real1[31])? {13'b1111111111111,mult_real1[31:13]} : {13'b0,mult_real1[31:13]}; 
assign result_imag0 = (mult_imag0 == 32'b0)? 32'b0 : 
             (mult_imag0[31])? {13'b1111111111111,mult_imag0[31:13]} : {13'b0,mult_imag0[31:13]};
assign result_imag1 = (mult_imag1 == 32'b0)? 32'b0 : 
             (mult_imag1[31])? {13'b1111111111111,mult_imag1[31:13]} : {13'b0,mult_imag1[31:13]};  

always @(posedge clk or negedge rst) begin
  if (rst == RST_LVL) begin
    result_real0_next <= 32'b0;
    result_imag0_next <= 32'b0;
    result_real1_next <= 32'b0;
    result_imag1_next <= 32'b0;  
  end
  else begin
    result_real0_next <=result_real0;// mult_real0;
    result_imag0_next <= result_imag0;//mult_imag0;
    result_real1_next <= result_real1;//mult_real1;
    result_imag1_next <= result_imag1;//mult_imag1;    
  end
end



                 
assign adder_real1 = result_real0_next - result_real1_next;
assign adder_imag1 = result_imag0_next + result_imag1_next; 

always @(posedge clk or negedge rst) begin
  if (rst == RST_LVL) begin
    adder_real1_next <= 32'b0;
    adder_imag1_next <= 32'b0;  
  end
  else begin
    adder_real1_next <= adder_real1;
    adder_imag1_next <= adder_imag1;
  end
end

/*
assign adder_real0 = (butt2_real0 == 12'b0)? 32'b0 : 
            (butt2_real0[11])? {20'hFFFFF,butt2_real0} : {20'b0,butt2_real0};
assign adder_imag0 = (butt2_imag0 == 12'b0)? 32'b0 : 
            (butt2_imag0[11])? {20'hFFFFF,butt2_imag0} : {20'b0,butt2_imag0};
*/

assign adder_real0 = (butt2_real0[11])? {20'hFFFFF,butt2_real0} : {20'b0,butt2_real0};
assign adder_imag0 = (butt2_imag0[11])? {20'hFFFFF,butt2_imag0} : {20'b0,butt2_imag0};

always @(posedge clk or negedge rst) begin
  if (rst == RST_LVL) begin
    adder_real0_next[0] <= 32'b0;
    adder_imag0_next[0] <= 32'b0;
    adder_real0_next[1] <= 32'b0;
    adder_imag0_next[1] <= 32'b0;
    adder_real0_next[2] <= 32'b0;
    adder_imag0_next[2] <= 32'b0;
  end
  else begin
    adder_real0_next[0] <= adder_real0;
    adder_imag0_next[0] <= adder_imag0;
    adder_real0_next[1] <= adder_real0_next[0];
    adder_imag0_next[1] <= adder_imag0_next[0];
    adder_real0_next[2] <= adder_real0_next[1];
    adder_imag0_next[2] <= adder_imag0_next[1];
  end
end

/* wait for Mult16x12 delay 
always @(posedge clk or negedge rst) begin
  if (rst == RST_LVL) begin
    adder_real0_next[0] <= 55'b0;
    adder_imag0_next[0] <= 55'b0;
    adder_real0_next[1] <= 55'b0;
    adder_imag0_next[1] <= 55'b0;
    adder_real0_next[2] <= 55'b0;
    adder_imag0_next[2] <= 55'b0;
    adder_real0_next[3] <= 55'b0;
    adder_imag0_next[3] <= 55'b0;
    adder_real0_next[4] <= 55'b0;
    adder_imag0_next[4] <= 55'b0;
    adder_real0_next[5] <= 55'b0;
    adder_imag0_next[5] <= 55'b0;
    adder_real0_next[6] <= 55'b0;
    adder_imag0_next[6] <= 55'b0;
    adder_real0_next[7] <= 55'b0;
    adder_imag0_next[7] <= 55'b0;
    adder_real0_next[8] <= 55'b0;
    adder_imag0_next[8] <= 55'b0;
    adder_real0_next[9] <= 55'b0;
    adder_imag0_next[9] <= 55'b0;
    adder_real0_next[10] <= 55'b0;
    adder_imag0_next[10] <= 55'b0;      
  end
  else begin
    adder_real0_next[0] <= adder_real0;
    adder_imag0_next[0] <= adder_imag0;
    adder_real0_next[1] <= adder_real0_next[0];
    adder_imag0_next[1] <= adder_imag0_next[0];
    adder_real0_next[2] <= adder_real0_next[1];
    adder_imag0_next[2] <= adder_imag0_next[1];
    adder_real0_next[3] <= adder_real0_next[2];
    adder_imag0_next[3] <= adder_imag0_next[2];
    adder_real0_next[4] <= adder_real0_next[3];
    adder_imag0_next[4] <= adder_imag0_next[3];
    adder_real0_next[5] <= adder_real0_next[4];
    adder_imag0_next[5] <= adder_imag0_next[4];
    adder_real0_next[6] <= adder_real0_next[5];
    adder_imag0_next[6] <= adder_imag0_next[5];
    adder_real0_next[7] <= adder_real0_next[6];
    adder_imag0_next[7] <= adder_imag0_next[6];
    adder_real0_next[8] <= adder_real0_next[7];
    adder_imag0_next[8] <= adder_imag0_next[7];
    adder_real0_next[9] <= adder_real0_next[8];
    adder_imag0_next[9] <= adder_imag0_next[8];
    adder_real0_next[10] <= adder_real0_next[9];
    adder_imag0_next[10] <= adder_imag0_next[9];    
  end
end

*/

assign y0_result_real = adder_real0_next[2] + adder_real1_next;
assign y0_result_imag = adder_imag0_next[2] + adder_imag1_next;
assign y1_result_real = adder_real0_next[2] - adder_real1_next;
assign y1_result_imag = adder_imag0_next[2] - adder_imag1_next;

always @(posedge clk or negedge rst) begin
  if (rst == RST_LVL) begin
    y0_result_real_next <= 32'b0;
    y0_result_imag_next <= 32'b0;
    y1_result_real_next <= 32'b0;
    y1_result_imag_next <= 32'b0;  
  end
  else begin
    y0_result_real_next <= y0_result_real;
    y0_result_imag_next <= y0_result_imag;
    y1_result_real_next <= y1_result_real;
    y1_result_imag_next <= y1_result_imag;
  end 
end

/*
assign output0_real = (y0_result_real == 32'b0)? 16'b0 : 
                   {y0_result_real_next[31],y0_result_real_next[14:0]};
assign output0_imag = (y0_result_imag == 28'b0)? 16'b0 : 
                   {y0_result_imag_next[31],y0_result_imag_next[14:0]};
assign output1_real = (y1_result_real == 28'b0)? 16'b0 : 
                   {y1_result_real_next[31],y1_result_real_next[14:0]};
assign output1_imag = (y1_result_imag == 28'b0)? 16'b0 : 
                   {y1_result_imag_next[31],y1_result_imag_next[14:0]};
*/           

assign output0_real = {y0_result_real_next[31],y0_result_real_next[14:0]};
assign output0_imag = {y0_result_imag_next[31],y0_result_imag_next[14:0]};
assign output1_real = {y1_result_real_next[31],y1_result_real_next[14:0]};
assign output1_imag = {y1_result_imag_next[31],y1_result_imag_next[14:0]};        

///  above cost  more than 1clk(20ns)?



always @(posedge  clk or negedge rst) begin
  if (rst == RST_LVL) begin
    output0_real_next <= 16'b0;
    output0_imag_next <= 16'b0;
    output1_real_next <= 16'b0;
    output1_imag_next <= 16'b0;  
  end
  else begin
    output0_real_next <= output0_real;
    output0_imag_next <= output0_imag;
    output1_real_next <= output1_real;
    output1_imag_next <= output1_imag;    
  end
end

always @(posedge clk) begin
	y0_real <= output0_real_next;
	y0_imag <= output0_imag_next;
	y1_real <= output1_real_next;
	y1_imag <= output1_imag_next;
end


 
endmodule
