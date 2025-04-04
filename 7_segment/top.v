//------------------------------------------------------------------
//-- Blinking LED
//-- The Green LED is blinking. The other LEDs are turned off
//------------------------------------------------------------------
module top (
	input CLK,      //-- 12 Mhz
	output reg SS_A_n, SS_B_n, SS_C_n, SS_D_n, SS_E_n, SS_F_n, SS_G_n, SS_right
);

reg [23:0] one_sec_counter = 0; // counts [0, 12M) on 12MHz clock so it zeros every 1s
reg [7:0] SS_counter = 4'h0;  // counts up every 1 second (when one_sec_counter completes a count to 12M)

// Flicker that is visible to the human eye will operate at a frequency of up to 80 Hz
// 12Mhz / 2**16 == 183.11 Hz or 5.46 ms
// left lit up for 5.46ms then right lit up for 5.46ms
// total period of 10.92 ms per digit with 50% duty cycle
// therfore flickers at 91.55 Hz, undetectable to the human eye
// increase it to 17 or 18 bits and you will see flicker
reg [15:0] SS_oscillator = 0;

reg [3:0] SS_display = 0;

// 12 MHz XTAL oscillator (shared with FPGA)
  always @(posedge CLK) begin

	// 12M - 1 for 1 second
	if (one_sec_counter == 24'd11999999) begin  // 0xB71AFF
		one_sec_counter <= 0;
		// SS_right <= ~SS_right;  // alternate left right each time
		SS_counter <= SS_counter + 1;
	end
	else begin
		one_sec_counter <= one_sec_counter + 1;
	end
  end

  always @(posedge CLK) begin 
	SS_oscillator <= SS_oscillator + 1;
	if (SS_oscillator == 0) begin
		SS_right <= ~SS_right;
		SS_display <= SS_right ? SS_counter[7:4] : SS_counter[3:0]; // display the MSB or the LSB
	end
	case (SS_display)
		4'd0 : begin
			SS_A_n <= 0;
			SS_B_n <= 0;
			SS_C_n <= 0;
			SS_D_n <= 0;
			SS_E_n <= 0;
			SS_F_n <= 0;
			SS_G_n <= 1;
		end 
		4'd1 : begin
			SS_A_n <= 1;
			SS_B_n <= 0;
			SS_C_n <= 0;
			SS_D_n <= 1;
			SS_E_n <= 1;
			SS_F_n <= 1;
			SS_G_n <= 1;
		end 
		4'd2 : begin
			SS_A_n <= 0;
			SS_B_n <= 0;
			SS_C_n <= 1;
			SS_D_n <= 0;
			SS_E_n <= 0;
			SS_F_n <= 1;
			SS_G_n <= 0;
		end 
		4'd3 : begin
			SS_A_n <= 0;
			SS_B_n <= 0;
			SS_C_n <= 0;
			SS_D_n <= 0;
			SS_E_n <= 1;
			SS_F_n <= 1;
			SS_G_n <= 0;
		end 
		4'd4 : begin
			SS_A_n <= 1;
			SS_B_n <= 0;
			SS_C_n <= 0;
			SS_D_n <= 1;
			SS_E_n <= 1;
			SS_F_n <= 0;
			SS_G_n <= 0;
		end
		4'd5 : begin
			SS_A_n <= 0;
			SS_B_n <= 1;
			SS_C_n <= 0;
			SS_D_n <= 0;
			SS_E_n <= 1;
			SS_F_n <= 0;
			SS_G_n <= 0;
		end
		4'd6: begin
			SS_A_n <= 0;
			SS_B_n <= 1;
			SS_C_n <= 0;
			SS_D_n <= 0;
			SS_E_n <= 0;
			SS_F_n <= 0;
			SS_G_n <= 0;
		end
		4'd7: begin
			SS_A_n <= 0;
			SS_B_n <= 0;
			SS_C_n <= 0;
			SS_D_n <= 1;
			SS_E_n <= 1;
			SS_F_n <= 1;
			SS_G_n <= 1;
		end
		4'd8: begin
			SS_A_n <= 0;
			SS_B_n <= 0;
			SS_C_n <= 0;
			SS_D_n <= 0;
			SS_E_n <= 0;
			SS_F_n <= 0;
			SS_G_n <= 0;
		end
		4'd9: begin
			SS_A_n <= 0;
			SS_B_n <= 0;
			SS_C_n <= 0;
			SS_D_n <= 1;
			SS_E_n <= 1;
			SS_F_n <= 0;
			SS_G_n <= 0;
		end
		4'hA: begin
			SS_A_n <= 0;
			SS_B_n <= 0;
			SS_C_n <= 0;
			SS_D_n <= 1;
			SS_E_n <= 0;
			SS_F_n <= 0;
			SS_G_n <= 0;
		end
		4'hb: begin
			SS_A_n <= 1;
			SS_B_n <= 1;
			SS_C_n <= 0;
			SS_D_n <= 0;
			SS_E_n <= 0;
			SS_F_n <= 0;
			SS_G_n <= 0;
		end
		4'hC: begin
			SS_A_n <= 0;
			SS_B_n <= 1;
			SS_C_n <= 1;
			SS_D_n <= 0;
			SS_E_n <= 0;
			SS_F_n <= 0;
			SS_G_n <= 1;
		end
		4'hd: begin
			SS_A_n <= 1;
			SS_B_n <= 0;
			SS_C_n <= 0;
			SS_D_n <= 0;
			SS_E_n <= 0;
			SS_F_n <= 1;
			SS_G_n <= 0;
		end
		4'hE: begin
			SS_A_n <= 0;
			SS_B_n <= 1;
			SS_C_n <= 1;
			SS_D_n <= 0;
			SS_E_n <= 0;
			SS_F_n <= 0;
			SS_G_n <= 0;
		end
		4'hF: begin
			SS_A_n <= 0;
			SS_B_n <= 1;
			SS_C_n <= 1;
			SS_D_n <= 1;
			SS_E_n <= 0;
			SS_F_n <= 0;
			SS_G_n <= 0;
		end
		default: begin
			SS_A_n <= 1;
			SS_B_n <= 1;
			SS_C_n <= 1;
			SS_D_n <= 1;
			SS_E_n <= 1;
			SS_F_n <= 1;
			SS_G_n <= 1;
		end
	endcase
  end


endmodule
