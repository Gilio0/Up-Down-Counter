module Up_Dn_Counter_tb();

	reg  [4:0] IN_tb;
	reg 	   Load_tb;
	reg		   Up_tb;
	reg		   Down_tb;
	reg 	   CLK_tb;
	wire [4:0] Counter_tb;
	wire 	   High_tb;
	wire 	   Low_tb;

	always #5 CLK_tb = ~CLK_tb;

	Up_Dn_Counter DUT
	(.IN (IN_tb),
	 .Load (Load_tb),
	 .Up (Up_tb),
	 .Down (Down_tb),
	 .CLK (CLK_tb),
	 .Counter (Counter_tb),
	 .High (High_tb),
	 .Low (Low_tb) );

	initial
	begin

		CLK_tb = 0;
		IN_tb = 0;
		Load_tb = 1;
		Up_tb = 0;
		Down_tb = 0;
		
		#10
		//checking if the Load is working as intended
		if (Counter_tb == 0) 
		begin
			$display("test case 1 passed");
		end
		else 
		begin
			$display("test case 1 failed");	
		end
		IN_tb = 5;
		Load_tb = 1;
		
		#10
		Load_tb = 0;
		Down_tb = 1;
		
		#60
		//checking that the decrement stops at zero
		if (Counter_tb == 0) 
		begin
			$display("test case 2 passed");
		end
		else 
		begin
			$display("test case 2 failed");	
		end
		Down_tb = 1;
		IN_tb = 28;
		Load_tb = 1;
		Up_tb = 1;
		
		#30
		//checking that load has highest priority
		if (Counter_tb == 28) 
		begin
			$display("test case 3 passed");
		end
		else 
		begin
			$display("test case 3 failed");
		end
		Down_tb = 0;
		Up_tb = 1;
		Load_tb = 0;
		
		#50
		//checking that the increment stops at 31
		if (Counter_tb == 31) 
		begin
			$display("test case 4 passed");
		end
		else 
		begin
			$display("test case 4 failed");
		end
		Load_tb = 1;
		IN_tb = 4;
		
		#10
		Down_tb = 1;
		Up_tb = 1;
		Load_tb = 0;

		#50
		//checking that down signal has higher priority than up signal
		if (Counter_tb == 0) 
		begin
			$display("test case 5 passed");
		end
		else 
		begin
			$display("test case 5 failed");
		end
		#100
		$finish;

	end

endmodule