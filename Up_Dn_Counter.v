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

	reg [4:0] counter;

	assign High = &Counter;
	assign Low = ~|Counter;

	always @(posedge CLK)
	begin
		Counter <= counter; 
	end

	always @(*)
	begin
		if (Load) 
		begin
			Counter = IN;
		end
		else if (Down & ~Low)
		begin
			Counter = Counter - 1;
		end
		else if (Up & ~High & ~Down) 
		begin
			Counter = Counter + 1;
		end
		else begin
			Counter = Counter;
		end
	end

endmodule
