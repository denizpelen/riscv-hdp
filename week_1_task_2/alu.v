module alu(
input [3:0] op1, // 4-bit input 
input [3:0] op2, // 4-bit input 
input [2:0] operation, // 3-bit control input for operation selection
output [3:0] res // 4-bit output
);

assign res = (operation == 3'b000) ? op1 + op2 :
(operation == 3'b001) ? op1 - op2 :
(operation == 3'b010) ? op1 & op2 :
(operation == 3'b011) ? op1 | op2 :
(operation == 3'b100) ? op1 ^ op2 :
4'b0000; 

endmodule
