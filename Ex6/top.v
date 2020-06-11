//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:
// Date: 
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
//define ports
	module dtl(
	input rst,
	input clk,
	input button,
	input sel,
	output [2:0]result
	);
//define wires
	wire [2:0]throw;
	wire [2:0]lights;

	dice dice_out(clk,rst,button,throw);
	trafficlights trafficlights_out(clk,lights[2],lights[1],lights[0]);
	mux mux_out();
endmodule
