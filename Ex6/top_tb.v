//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
module top_tb(
    );
    
//Parameters
	parameter CLK_PERIOD = 10;

//Registers and wires
	reg clk;
	reg sel;
	reg rst;
	wire [2:0]lights;
	wire [2:0]throw;
	wire [2:0]result;
	reg err;
	reg button;
	reg [2:0]throw_prev;
	reg [2:0]lights_prev;

//Clock generation
	initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Logic
	initial
	begin
	err=0;
	rst=1;
	sel=0;
	button=1;
	#10
	rst=0;
	forever begin
	#10
	if ((sel == 0) & (result != throw_prev))
	begin
		
        $display("***TEST FAILED! sel==%d, throw==%d, result==%d***", sel,throw, result);
        err=1;
	end
	if ((sel == 1) & (result != lights_prev))
	begin
		
        $display("***TEST FAILED! sel==%d, lights==%d, result==%d***", sel,lights, result);
        err=1;
	end
	throw_prev = throw;
	lights_prev = lights;
	sel=~sel;
	end
	end

//Check for success
	initial begin
	 #100 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
        end

//Instantiate the module
	dtl top(
	.rst(rst),
	.clk(clk),
	.button(button),
	.sel(sel),
	.result(result)
	);
endmodule
