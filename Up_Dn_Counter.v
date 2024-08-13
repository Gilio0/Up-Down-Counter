module Up_Dn_Counter(
	input  wire [4:0]  IN,
	input  wire		   Load,
	input  wire 	   Up,
	input  wire        Down,
	input  wire        CLK,
	output reg  [4:0]  Counter,
	output wire  	   High,
	output wire  	   Low
	);

	assign High = &Counter;
	assign Low = ~|Counter;

	always @(posedge CLK)
	begin
		if (Load) 
		begin
			Counter <= IN;
		end
		else if (Down & ~Low)
		begin
			Counter <= Counter - 1;
		end
		else if (Up & ~High) 
		begin
			Counter <= Counter + 1;
		end
	end

endmodule