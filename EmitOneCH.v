
module  EmitOneCH
(
  input         Transmit_CLK,                //100M            
  input         RX_Gate,                    //Transmit Enable
  input   [7:0] EmitDelay,                  //7th bit for Transmit Enable, 6:0 for Delay                   
  input   [6:0] Emit_Width,                //Emit pulse width
  output  reg   TXP,
  output  reg   TXN
  );  
    
	 
	 
  reg  [6:0]  Emit_Counter;
  
  reg  [6:0]  Delay_Counter;
    
	 
  always @(posedge Transmit_CLK or negedge RX_Gate)
  begin
  	if(~RX_Gate) 
	 begin
  		Emit_Counter  <= 7'd0;
  		Delay_Counter <= 8'd0;
  		TXP           <= 1'b1;
  		TXN           <= 1'b1;
  	end
  	else
  		begin
  		  if(Delay_Counter < EmitDelay[6:0] ) begin
  				Delay_Counter <= Delay_Counter + 1'b1;
  				TXP           <= 1'b1;
				TXN           <= 1'b1;
		  end
  		  else begin
			if(~EmitDelay[7]) begin  //enble Emit
				if(Emit_Counter <Emit_Width)begin                        // Positive Pulse
					TXP <= 1'b1;
					TXN <= 1'b0;
					Emit_Counter <= Emit_Counter + 1'b1;
				end
				else if(Emit_Counter <{Emit_Width,1'b0})begin           // Negetive Pulse
					TXP <= 1'b0;
					TXN <= 1'b1;
					Emit_Counter <= Emit_Counter + 1'b1;
				end		
				/*
				else if(Emit_Counter <({Emit_Width,1'b0}+Emit_Width))begin  // Positive Pulse
					TXP <= 1'b1;
					TXN <= 1'b0;
					Emit_Counter <= Emit_Counter + 1'b1;
				end
				
				
				else if(Emit_Counter <{Emit_Width,2'b0})begin             // Negetive Pulse
					TXP <= 1'b0;
					TXN <= 1'b1;
					Emit_Counter <= Emit_Counter + 1'b1;
				end								
				*/
				else if(Emit_Counter <({Emit_Width,2'b0}+Emit_Width))begin             //Return to Zero (RTZ)
					TXP <= 1'b0;
					TXN <= 1'b0;
					Emit_Counter <= Emit_Counter + 1'b1;
				end
				
				else begin                                               
					TXP <= 1'b1;
					TXN <= 1'b1;
				end
				
				
			end
			else begin              //disable Emit
				TXP <= 1'b1;
				TXN <= 1'b1;
			end


		  end
	   end
  end

    
endmodule
