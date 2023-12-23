`default_nettype none
`timescale 10ns/10ps

module alu_tb1();
reg [3:0] op1; // 4-bit input
reg [3:0] op2; // 4-bit input
reg [2:0] operation;// 3-bit control
reg [3:0] res; 

// Instantiate the ALU module
alu ALU_inst (
.op1(op1), // Input A (Example value: 2)
.op2(op2), // Input B (Example value: 5)
.operation(operation), // Set the operation (Example: 000 for addition)
.res() // Output of the ALU
);


initial begin
	$dumpfile ("waveform.vcd");
	$dumpvars (0,alu_tb1);


	op1 = 4'b0010;
	op2 = 4'b0101;
	operation = 3'b000;
	#5;
	
	op1 = 4'b0101;
	op2 = 4'b0010;
	operation = 3'b001;
	#5;
	op1 = 4'b0101;
	op2 = 4'b0010;
	operation = 3'b010;
	#5;
	op1 = 4'b0101;
	op2 = 4'b0010;
	operation = 3'b011;
	#5;
	op1 = 4'b0101;
	op2 = 4'b0010;
	operation = 3'b100;
	#5;

	// Additional test cases can be added here

end


endmodule
