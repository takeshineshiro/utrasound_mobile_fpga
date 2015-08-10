//altlvds_rx CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" COMMON_RX_TX_PLL="OFF" CYCLONEII_M4K_COMPATIBILITY="ON" DESERIALIZATION_FACTOR=12 DEVICE_FAMILY="Cyclone III" IMPLEMENT_IN_LES="ON" INCLOCK_PERIOD=20000 INCLOCK_PHASE_SHIFT=521 INPUT_DATA_RATE=600 NUMBER_OF_CHANNELS=8 PLL_SELF_RESET_ON_LOSS_LOCK="ON" PORT_RX_CHANNEL_DATA_ALIGN="PORT_UNUSED" PORT_RX_DATA_ALIGN="PORT_UNUSED" REGISTERED_DATA_ALIGN_INPUT="OFF" REGISTERED_OUTPUT="ON" USE_EXTERNAL_PLL="OFF" rx_in rx_inclock rx_locked rx_out rx_outclock CARRY_CHAIN="MANUAL" CARRY_CHAIN_LENGTH=48 LOW_POWER_MODE="AUTO" ALTERA_INTERNAL_OPTIONS=AUTO_SHIFT_REGISTER_RECOGNITION=OFF
//VERSION_BEGIN 13.1 cbx_altaccumulate 2013:10:17:09:48:19:SJ cbx_altclkbuf 2013:10:17:09:48:19:SJ cbx_altddio_in 2013:10:17:09:48:19:SJ cbx_altddio_out 2013:10:17:09:48:19:SJ cbx_altiobuf_bidir 2013:10:17:09:48:19:SJ cbx_altiobuf_in 2013:10:17:09:48:19:SJ cbx_altiobuf_out 2013:10:17:09:48:19:SJ cbx_altlvds_rx 2013:10:17:09:48:19:SJ cbx_altpll 2013:10:17:09:48:19:SJ cbx_altsyncram 2013:10:17:09:48:19:SJ cbx_arriav 2013:10:17:09:48:19:SJ cbx_cyclone 2013:10:17:09:48:19:SJ cbx_cycloneii 2013:10:17:09:48:19:SJ cbx_lpm_add_sub 2013:10:17:09:48:19:SJ cbx_lpm_compare 2013:10:17:09:48:19:SJ cbx_lpm_counter 2013:10:17:09:48:19:SJ cbx_lpm_decode 2013:10:17:09:48:19:SJ cbx_lpm_mux 2013:10:17:09:48:19:SJ cbx_lpm_shiftreg 2013:10:17:09:48:19:SJ cbx_maxii 2013:10:17:09:48:19:SJ cbx_mgl 2013:10:17:09:48:49:SJ cbx_stratix 2013:10:17:09:48:19:SJ cbx_stratixii 2013:10:17:09:48:19:SJ cbx_stratixiii 2013:10:17:09:48:19:SJ cbx_stratixv 2013:10:17:09:48:19:SJ cbx_util_mgl 2013:10:17:09:48:19:SJ  VERSION_END
//CBXI_INSTANCE_NAME="ArrayUltrasound_LVDS_AD_LVDS_AD_inst_A_altlvds_rx_altlvds_rx_component"
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2013 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, Altera MegaCore Function License 
//  Agreement, or other applicable license agreement, including, 
//  without limitation, that your use is for the sole purpose of 
//  programming logic devices manufactured by Altera and sold by 
//  Altera or its authorized distributors.  Please refer to the 
//  applicable agreement for further details.




//alt_lvds_ddio_in ADD_LATENCY_REG="TRUE" CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" WIDTH=8 clock datain dataout_h dataout_l
//VERSION_BEGIN 13.1 cbx_altaccumulate 2013:10:17:09:48:19:SJ cbx_altclkbuf 2013:10:17:09:48:19:SJ cbx_altddio_in 2013:10:17:09:48:19:SJ cbx_altddio_out 2013:10:17:09:48:19:SJ cbx_altiobuf_bidir 2013:10:17:09:48:19:SJ cbx_altiobuf_in 2013:10:17:09:48:19:SJ cbx_altiobuf_out 2013:10:17:09:48:19:SJ cbx_altlvds_rx 2013:10:17:09:48:19:SJ cbx_altpll 2013:10:17:09:48:19:SJ cbx_altsyncram 2013:10:17:09:48:19:SJ cbx_arriav 2013:10:17:09:48:19:SJ cbx_cyclone 2013:10:17:09:48:19:SJ cbx_cycloneii 2013:10:17:09:48:19:SJ cbx_lpm_add_sub 2013:10:17:09:48:19:SJ cbx_lpm_compare 2013:10:17:09:48:19:SJ cbx_lpm_counter 2013:10:17:09:48:19:SJ cbx_lpm_decode 2013:10:17:09:48:19:SJ cbx_lpm_mux 2013:10:17:09:48:19:SJ cbx_lpm_shiftreg 2013:10:17:09:48:19:SJ cbx_maxii 2013:10:17:09:48:19:SJ cbx_mgl 2013:10:17:09:48:49:SJ cbx_stratix 2013:10:17:09:48:19:SJ cbx_stratixii 2013:10:17:09:48:19:SJ cbx_stratixiii 2013:10:17:09:48:19:SJ cbx_stratixv 2013:10:17:09:48:19:SJ cbx_util_mgl 2013:10:17:09:48:19:SJ  VERSION_END

//synthesis_resources = reg 40 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"{-to ddio_h_reg*} PLL_COMPENSATE=ON;ADV_NETLIST_OPT_ALLOWED=\"NEVER_ALLOW\""} *)
module  LVDS_AD_lvds_ddio_in
	( 
	clock,
	datain,
	dataout_h,
	dataout_l) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   [7:0]  datain;
	output   [7:0]  dataout_h;
	output   [7:0]  dataout_l;

	reg	[7:0]	dataout_h_reg;
	reg	[7:0]	dataout_l_latch;
	reg	[7:0]	dataout_l_reg;
	(* ALTERA_ATTRIBUTE = {"LVDS_RX_REGISTER=HIGH;PRESERVE_REGISTER=ON;PRESERVE_FANOUT_FREE_NODE=ON"} *)
	reg	[7:0]	ddio_h_reg;
	(* ALTERA_ATTRIBUTE = {"LVDS_RX_REGISTER=LOW;PRESERVE_REGISTER=ON;PRESERVE_FANOUT_FREE_NODE=ON"} *)
	reg	[7:0]	ddio_l_reg;

	// synopsys translate_off
	initial
		dataout_h_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  dataout_h_reg <= ddio_h_reg;
	// synopsys translate_off
	initial
		dataout_l_latch = 0;
	// synopsys translate_on
	always @ ( negedge clock)
		  dataout_l_latch <= ddio_l_reg;
	// synopsys translate_off
	initial
		dataout_l_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  dataout_l_reg <= dataout_l_latch;
	// synopsys translate_off
	initial
		ddio_h_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock)
		  ddio_h_reg <= datain;
	// synopsys translate_off
	initial
		ddio_l_reg = 0;
	// synopsys translate_on
	always @ ( negedge clock)
		  ddio_l_reg <= datain;
	assign
		dataout_h = dataout_l_reg,
		dataout_l = dataout_h_reg;
endmodule //LVDS_AD_lvds_ddio_in


//dffpipe CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DELAY=3 WIDTH=8 clock d q ALTERA_INTERNAL_OPTIONS=AUTO_SHIFT_REGISTER_RECOGNITION=OFF
//VERSION_BEGIN 13.1 cbx_mgl 2013:10:17:09:48:49:SJ cbx_stratixii 2013:10:17:09:48:19:SJ cbx_util_mgl 2013:10:17:09:48:19:SJ  VERSION_END

//synthesis_resources = reg 24 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"AUTO_SHIFT_REGISTER_RECOGNITION=OFF"} *)
module  LVDS_AD_dffpipe
	( 
	clock,
	d,
	q) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   [7:0]  d;
	output   [7:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[7:0]	dffe17a;
	reg	[7:0]	dffe18a;
	reg	[7:0]	dffe19a;
	wire clrn;
	wire ena;
	wire prn;
	wire sclr;

	// synopsys translate_off
	initial
		dffe17a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe17a <= {8{1'b1}};
		else if (clrn == 1'b0) dffe17a <= 8'b0;
		else if  (ena == 1'b1)   dffe17a <= (d & {8{(~ sclr)}});
	// synopsys translate_off
	initial
		dffe18a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe18a <= {8{1'b1}};
		else if (clrn == 1'b0) dffe18a <= 8'b0;
		else if  (ena == 1'b1)   dffe18a <= (dffe17a & {8{(~ sclr)}});
	// synopsys translate_off
	initial
		dffe19a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe19a <= {8{1'b1}};
		else if (clrn == 1'b0) dffe19a <= 8'b0;
		else if  (ena == 1'b1)   dffe19a <= (dffe18a & {8{(~ sclr)}});
	assign
		clrn = 1'b1,
		ena = 1'b1,
		prn = 1'b1,
		q = dffe19a,
		sclr = 1'b0;
endmodule //LVDS_AD_dffpipe

//synthesis_resources = cycloneiii_pll 1 reg 280 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"AUTO_SHIFT_REGISTER_RECOGNITION=OFF;{-to lvds_rx_pll} AUTO_MERGE_PLLS=OFF"} *)
module  LVDS_AD_lvds_rx
	( 
	rx_in,
	rx_inclock,
	rx_locked,
	rx_out,
	rx_outclock) /* synthesis synthesis_clearbox=1 */;
	input   [7:0]  rx_in;
	input   rx_inclock;
	output   rx_locked;
	output   [95:0]  rx_out;
	output   rx_outclock;

	wire  [7:0]   wire_ddio_in_dataout_h;
	wire  [7:0]   wire_ddio_in_dataout_l;
	reg	[5:0]	h_shiftreg10a;
	reg	[5:0]	h_shiftreg12a;
	reg	[5:0]	h_shiftreg14a;
	reg	[5:0]	h_shiftreg16a;
	reg	[5:0]	h_shiftreg2a;
	reg	[5:0]	h_shiftreg4a;
	reg	[5:0]	h_shiftreg6a;
	reg	[5:0]	h_shiftreg8a;
	reg	[5:0]	l_shiftreg11a;
	reg	[5:0]	l_shiftreg13a;
	reg	[5:0]	l_shiftreg15a;
	reg	[5:0]	l_shiftreg1a;
	reg	[5:0]	l_shiftreg3a;
	reg	[5:0]	l_shiftreg5a;
	reg	[5:0]	l_shiftreg7a;
	reg	[5:0]	l_shiftreg9a;
	reg	[95:0]	rx_reg;
	wire  [7:0]   wire_h_dffpipe_q;
	wire  [7:0]   wire_l_dffpipe_q;
	wire  [4:0]   wire_lvds_rx_pll_clk;
	wire  wire_lvds_rx_pll_fbout;
	wire  wire_lvds_rx_pll_locked;
	wire  [7:0]  ddio_dataout_h;
	wire  [7:0]  ddio_dataout_h_int;
	wire  [7:0]  ddio_dataout_l;
	wire  [7:0]  ddio_dataout_l_int;
	wire  fast_clock;
	wire  [95:0]  rx_out_wire;
	wire  slow_clock;

	LVDS_AD_lvds_ddio_in   ddio_in
	( 
	.clock(fast_clock),
	.datain(rx_in),
	.dataout_h(wire_ddio_in_dataout_h),
	.dataout_l(wire_ddio_in_dataout_l));
	// synopsys translate_off
	initial
		h_shiftreg10a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg10a <= {h_shiftreg10a[4:0], ddio_dataout_l[4]};
	// synopsys translate_off
	initial
		h_shiftreg12a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg12a <= {h_shiftreg12a[4:0], ddio_dataout_l[5]};
	// synopsys translate_off
	initial
		h_shiftreg14a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg14a <= {h_shiftreg14a[4:0], ddio_dataout_l[6]};
	// synopsys translate_off
	initial
		h_shiftreg16a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg16a <= {h_shiftreg16a[4:0], ddio_dataout_l[7]};
	// synopsys translate_off
	initial
		h_shiftreg2a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg2a <= {h_shiftreg2a[4:0], ddio_dataout_l[0]};
	// synopsys translate_off
	initial
		h_shiftreg4a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg4a <= {h_shiftreg4a[4:0], ddio_dataout_l[1]};
	// synopsys translate_off
	initial
		h_shiftreg6a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg6a <= {h_shiftreg6a[4:0], ddio_dataout_l[2]};
	// synopsys translate_off
	initial
		h_shiftreg8a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg8a <= {h_shiftreg8a[4:0], ddio_dataout_l[3]};
	// synopsys translate_off
	initial
		l_shiftreg11a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg11a <= {l_shiftreg11a[4:0], ddio_dataout_h[5]};
	// synopsys translate_off
	initial
		l_shiftreg13a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg13a <= {l_shiftreg13a[4:0], ddio_dataout_h[6]};
	// synopsys translate_off
	initial
		l_shiftreg15a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg15a <= {l_shiftreg15a[4:0], ddio_dataout_h[7]};
	// synopsys translate_off
	initial
		l_shiftreg1a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg1a <= {l_shiftreg1a[4:0], ddio_dataout_h[0]};
	// synopsys translate_off
	initial
		l_shiftreg3a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg3a <= {l_shiftreg3a[4:0], ddio_dataout_h[1]};
	// synopsys translate_off
	initial
		l_shiftreg5a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg5a <= {l_shiftreg5a[4:0], ddio_dataout_h[2]};
	// synopsys translate_off
	initial
		l_shiftreg7a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg7a <= {l_shiftreg7a[4:0], ddio_dataout_h[3]};
	// synopsys translate_off
	initial
		l_shiftreg9a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg9a <= {l_shiftreg9a[4:0], ddio_dataout_h[4]};
	// synopsys translate_off
	initial
		rx_reg = 0;
	// synopsys translate_on
	always @ ( posedge slow_clock)
		  rx_reg <= rx_out_wire;
	LVDS_AD_dffpipe   h_dffpipe
	( 
	.clock(fast_clock),
	.d(ddio_dataout_h_int),
	.q(wire_h_dffpipe_q));
	LVDS_AD_dffpipe   l_dffpipe
	( 
	.clock(fast_clock),
	.d(ddio_dataout_l_int),
	.q(wire_l_dffpipe_q));
	cycloneiii_pll   lvds_rx_pll
	( 
	.activeclock(),
	.clk(wire_lvds_rx_pll_clk),
	.clkbad(),
	.fbin(wire_lvds_rx_pll_fbout),
	.fbout(wire_lvds_rx_pll_fbout),
	.inclk({1'b0, rx_inclock}),
	.locked(wire_lvds_rx_pll_locked),
	.phasedone(),
	.scandataout(),
	.scandone(),
	.vcooverrange(),
	.vcounderrange()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.areset(1'b0),
	.clkswitch(1'b0),
	.configupdate(1'b0),
	.pfdena(1'b1),
	.phasecounterselect({3{1'b0}}),
	.phasestep(1'b0),
	.phaseupdown(1'b0),
	.scanclk(1'b0),
	.scanclkena(1'b1),
	.scandata(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		lvds_rx_pll.clk0_divide_by = 1,
		lvds_rx_pll.clk0_multiply_by = 6,
		lvds_rx_pll.clk0_phase_shift = "-312",
		lvds_rx_pll.clk1_divide_by = 6,
		lvds_rx_pll.clk1_multiply_by = 6,
		lvds_rx_pll.clk1_phase_shift = "-312",
		lvds_rx_pll.inclk0_input_frequency = 20000,
		lvds_rx_pll.operation_mode = "source_synchronous",
		lvds_rx_pll.self_reset_on_loss_lock = "on",
		lvds_rx_pll.lpm_type = "cycloneiii_pll";
	assign
		ddio_dataout_h = wire_h_dffpipe_q,
		ddio_dataout_h_int = wire_ddio_in_dataout_h,
		ddio_dataout_l = wire_l_dffpipe_q,
		ddio_dataout_l_int = wire_ddio_in_dataout_l,
		fast_clock = wire_lvds_rx_pll_clk[0],
		rx_locked = wire_lvds_rx_pll_locked,
		rx_out = rx_reg,
		rx_out_wire = {l_shiftreg15a[5], h_shiftreg16a[5], l_shiftreg15a[4], h_shiftreg16a[4], l_shiftreg15a[3], h_shiftreg16a[3], l_shiftreg15a[2], h_shiftreg16a[2], l_shiftreg15a[1], h_shiftreg16a[1], l_shiftreg15a[0], h_shiftreg16a[0], l_shiftreg13a[5], h_shiftreg14a[5], l_shiftreg13a[4], h_shiftreg14a[4], l_shiftreg13a[3], h_shiftreg14a[3], l_shiftreg13a[2], h_shiftreg14a[2], l_shiftreg13a[1], h_shiftreg14a[1], l_shiftreg13a[0], h_shiftreg14a[0], l_shiftreg11a[5], h_shiftreg12a[5], l_shiftreg11a[4], h_shiftreg12a[4], l_shiftreg11a[3], h_shiftreg12a[3], l_shiftreg11a[2], h_shiftreg12a[2], l_shiftreg11a[1], h_shiftreg12a[1], l_shiftreg11a[0], h_shiftreg12a[0], l_shiftreg9a[5], h_shiftreg10a[5], l_shiftreg9a[4], h_shiftreg10a[4], l_shiftreg9a[3], h_shiftreg10a[3], l_shiftreg9a[2], h_shiftreg10a[2], l_shiftreg9a[1], h_shiftreg10a[1], l_shiftreg9a[0], h_shiftreg10a[0], l_shiftreg7a[5], h_shiftreg8a[5], l_shiftreg7a[4], h_shiftreg8a[4], l_shiftreg7a[3], h_shiftreg8a[3], l_shiftreg7a[2], h_shiftreg8a[2], l_shiftreg7a[1], h_shiftreg8a[1], l_shiftreg7a[0], h_shiftreg8a[0], l_shiftreg5a[5], h_shiftreg6a[5], l_shiftreg5a[4], h_shiftreg6a[4], l_shiftreg5a[3], h_shiftreg6a[3], l_shiftreg5a[2], h_shiftreg6a[2], l_shiftreg5a[1], h_shiftreg6a[1], l_shiftreg5a[0], h_shiftreg6a[0], l_shiftreg3a[5], h_shiftreg4a[5], l_shiftreg3a[4], h_shiftreg4a[4], l_shiftreg3a[3], h_shiftreg4a[3], l_shiftreg3a[2], h_shiftreg4a[2], l_shiftreg3a[1], h_shiftreg4a[1], l_shiftreg3a[0], h_shiftreg4a[0], l_shiftreg1a[5], h_shiftreg2a[5], l_shiftreg1a[4], h_shiftreg2a[4], l_shiftreg1a[3], h_shiftreg2a[3], l_shiftreg1a[2], h_shiftreg2a[2], l_shiftreg1a[1], h_shiftreg2a[1], l_shiftreg1a[0], h_shiftreg2a[0]},
		rx_outclock = slow_clock,
		slow_clock = wire_lvds_rx_pll_clk[1];
endmodule //LVDS_AD_lvds_rx
//VALID FILE
