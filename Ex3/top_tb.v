//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;
//Todo: Regitsers and wires
	reg err;
	reg rst;
	reg enable;
	reg direction;
	reg clk;
	reg [7:0]counter_out_prev;
	wire [7:0]counter_out;

//Todo: Clock generation
	initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic
	initial
    begin

	clk=0;
	err=0;
	rst=1;
	enable=0;
	direction=1;
	#10
	rst=0;
	forever begin
	#10
	if (rst&(counter_out!=0))
	begin
	$display("***TEST FAILED! counter_out==%d, counter_out_prev==%d, rst='%d', enable=%d, direction=%d ***",counter_out,counter_out_prev,rst,enable,direction);
	end
	if ((!enable&(counter_out_prev!=counter_out))|(enable&(counter_out_prev==counter_out)))
	begin
	$display("***TEST FAILED! counter_out==%d, counter_out_prev==%d, rst='%d', enable=%d, direction=%d ***",counter_out,counter_out_prev,rst,enable,direction);
    	end
	if(((direction==1)&(counter_out!=counter_out_prev+1))|((direction==0)&(counter_out!=counter_out_prev-1))&enable&!rst)
	begin
	$display("***TEST FAILED! counter_out==%d, counter_out_prev==%d, rst='%d', enable=%d, direction=%d ***",counter_out,counter_out_prev,rst,enable,direction);
	end

	counter_out_prev=counter_out;
	if (enable==0)
	enable=1;
	if (counter_out==1'b00000011)
	direction=0;
	if((direction==0)&(counter_out==1'b00000001))
	rst=1;
	if(counter_out==0)
	rst=0;
	if(rst==1)
	direction=1;

	end
    end
	

//Todo: Finish test, check for success
	initial begin
	 #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
        end

//Todo: Instantiate counter module
 	counter top(
		
		.clk(clk),
		.rst(rst),
		.enable(enable),
		.direction(direction),
		.counter_out(counter_out)
	);
endmodule 
