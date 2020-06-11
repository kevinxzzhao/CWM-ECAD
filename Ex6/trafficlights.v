//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
//define ports
module trafficlights(
	input clk,
	output reg red,
	output reg amber,
	output reg green
	);
//logics
	always@(posedge clk)
	 begin
	 if((red)&(amber==0))
	  begin
	  red<=1;
	  amber<=1;
	  green<=0;
	  end
	 else if ((red)&(amber))
	  begin
	  red<=0;
	  amber<=0;
	  green<=1;
	  end
	 else if ((amber==0)&(green))
	  begin
	  red<=0;
	  amber<=1;
	  green<=0;
	  end
	 else if ((amber)&(red==0))
	  begin
	  red<=1;
	  amber<=0;
	  green<=0;
	  end
	 else
	 red<=1;
	 amber<=1;
	 green<=0;
	end
endmodule
