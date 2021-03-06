module TX_test (
	input wire clkIN,
	input wire nResetIN,
	input wire [7:0] dataIN,
	input wire sendIN,
	
	output wire txOUT,
	output wire nBusyOUT
	);

parameter clkFreq  = 48_000_000;
parameter baudRate = 9600;

wire baudClk2x;
defparam CD.clkfreq = clkFreq;
defparam CD.outfreq = baudRate * 2;
clkdiv CD(
              .clkIN           ( clkIN     ), 
              .clkOUT          ( baudClk2x )
);
			 
UartTX UTX(
			  .baudClkX2       ( baudClk2x ), 
			  .nResetIN        ( nResetIN  ), 
			  .dataIN          ( dataIN    ), 
			  .sendIN          ( sendIN    ), 
			  .txOUT           ( txOUT     ), 
			  .nBusyOUT        ( nBusyOUT  )
);

endmodule
