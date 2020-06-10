//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Parameters
	parameter CLK_PERIOD = 10;

//Registers and wires
	reg clk;
	reg rst;
	reg button;
	reg err;
	reg [2:0]throw_prev;
	wire [2:0]throw;

//Clock generation
	initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//User logic
	initial
   begin
	clk=0;
	rst=0;
	button=1;
	err=0;
	#10
	forever
	begin
	#10
	throw_prev=3'b000;
	//check reset
	if ((rst)&(throw!=3'b000)) begin
	$display("***RESET FAILED! throw==%d, throw_prev==%d, rst='%d', button=%d ***",throw,throw_prev,rst,button);
	err=1;
	end
	//check logic
	if ((throw_prev!=3'b110)|(throw_prev!=3'b110)|(throw_prev!=3'b000)) begin
	if ((button)&(throw!=throw_prev+3'b001)|(!button)&(throw!=throw_prev-3'b001)) begin
	$display("***BUTTON FAILED! throw==%d, throw_prev==%d, rst='%d', button=%d ***",throw,throw_prev,rst,button);
	err=1;
	end
	end
	throw_prev=throw;
	button=~button;
	end
   end

//check for success
	initial begin
	 #100 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
        end

//instantiate dice module
	dice top(
		
		.clk(clk),
		.rst(rst),
		.button(button),		
		.throw(throw)
	);
endmodule 

