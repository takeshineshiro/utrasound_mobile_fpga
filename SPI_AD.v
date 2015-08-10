module SPI_AD(
	input SPI_CLK,
	input New_Word,
	input [12:0] Addr,
	input [7:0] Data,
	output reg [7:0] q,
	input RW,           //1 Write; 0 :read
	output reg SPI_CS,
	inout  reg SPI_Data,
	output reg Over
);

    reg [15:0] CMD;
    reg [7:0] Wr_Data;
    reg [7:0] SPI_Counter;
	always @(negedge SPI_CLK or posedge New_Word ) begin
		if(New_Word) begin
			CMD <={RW,1'b0,1'b0,Addr[12:0]};
			Wr_Data <=  Data;
			SPI_Counter <= 8'd0;
			Over   <= 1'b0;
			SPI_CS <= 1'b1;
			SPI_Data <= 1'bz;
			
		end
		else begin
			if(SPI_Counter <8'd16) begin             // first CMD 
				SPI_Counter <= SPI_Counter + 1'b1;
				SPI_Data <= CMD[15];
				CMD <= CMD <<1;
				SPI_CS <= 1'b0;
				q <= 8'd00;
			end	
			else if(SPI_Counter <8'd24) begin        //Data
				SPI_Counter <= SPI_Counter + 1'b1;
				if(RW) begin
					q <= {q[6:0],SPI_Data};
					SPI_Data <= 1'bz;
				end
				else begin
					SPI_Data <= Wr_Data[7];
					Wr_Data <= Wr_Data <<1;
				end
				SPI_CS <= 1'b0;
			end

			else if(SPI_Counter <8'd25) begin        //Data
				SPI_Counter <= SPI_Counter + 1'b1;
				if(RW) begin
					q <= {q[6:0],SPI_Data};
					SPI_Data <= 1'bz;
				end
				SPI_CS <= 1'b1;
			end
			else if(SPI_Counter <8'd32) begin	   // interval
				SPI_Counter <= SPI_Counter + 1'b1;
				SPI_CS <= 1'b1;
				SPI_Data <= 1'bz;
				Over   <= 1'b1;
			end		
			else begin
				SPI_Data <= 1'bz;
				SPI_CS <= 1'b1;
				Over   <= 1'b1;
				
			end
		end
	end








endmodule
