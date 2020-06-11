//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Parameters
	parameter CLK_PERIOD = 10;

//Registers and wires
	reg clk;
	wire [2:0]lights;
	reg [2:0]lights_prev;
	reg err;

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
	clk=0;
	#10
	lights_prev=lights;
	forever
	begin
	 #10
	 
	 //check logic
	  if ((lights_prev == 3'b111)|(lights_prev == 3'b101)|(lights_prev == 3'b011)|(lights_prev == 3'b000))
          begin
 	   if ((lights!=3'b100)|(lights!=3'b110)|(lights!=3'b001)|(lights!=3'b010)) 
	   begin
           $display("***TEST FAILED! lights_prev==%d, lights='%d'***", lights_prev,lights,);
           err=1;
	   end
          end

	 lights_prev = lights;
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
	trafficlights top(
	.clk(clk),
	.red(lights[2]),
	.amber(lights[1]),
	.green(lights[0])
	);

endmodule
