// ============================================================================
// Copyright (c) 2015 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Tue Mar  3 15:11:40 2015
// ============================================================================

module UAB_RV_top (

	///////// FPGA /////////
	input              FPGA_CLK1_50,

	///////// HPS /////////
	output      [14:0] HPS_DDR3_ADDR,
	output      [2:0]  HPS_DDR3_BA,
	output             HPS_DDR3_CAS_N,
	output             HPS_DDR3_CKE,
	output             HPS_DDR3_CK_N,
	output             HPS_DDR3_CK_P,
	output             HPS_DDR3_CS_N,
	output      [3:0]  HPS_DDR3_DM,
	inout       [31:0] HPS_DDR3_DQ,
	inout       [3:0]  HPS_DDR3_DQS_N,
	inout       [3:0]  HPS_DDR3_DQS_P,
	output             HPS_DDR3_ODT,
	output             HPS_DDR3_RAS_N,
	output             HPS_DDR3_RESET_N,
	input              HPS_DDR3_RZQ,
	output             HPS_DDR3_WE_N,
	
	///////// KEY /////////
	input       [1:0]  KEY,

	///////// LED /////////
	output      [7:0]  LED
);


//=======================================================
//  REG/WIRE declarations
//=======================================================



//=======================================================
//  Structural coding
//=======================================================

 UAB_RV_System u0 (
	.clk_clk             (FPGA_CLK1_50),      // clk.clk
	.leds_export         (LED),               // leds.export
	.memory_mem_a        (HPS_DDR3_ADDR),     // memory.mem_a
	.memory_mem_ba       (HPS_DDR3_BA),       //       .mem_ba
	.memory_mem_ck       (HPS_DDR3_CK_P),     //       .mem_ck
	.memory_mem_ck_n     (HPS_DDR3_CK_N),     //       .mem_ck_n
	.memory_mem_cke      (HPS_DDR3_CKE),      //       .mem_cke
	.memory_mem_cs_n     (HPS_DDR3_CS_N),     //       .mem_cs_n
	.memory_mem_ras_n    (HPS_DDR3_RAS_N),    //       .mem_ras_n
	.memory_mem_cas_n    (HPS_DDR3_CAS_N),    //       .mem_cas_n
	.memory_mem_we_n     (HPS_DDR3_WE_N),     //       .mem_we_n
	.memory_mem_reset_n  (HPS_DDR3_RESET_N),  //       .mem_reset_n
	.memory_mem_dq       (HPS_DDR3_DQ),       //       .mem_dq
	.memory_mem_dqs      (HPS_DDR3_DQS_P),    //       .mem_dqs
	.memory_mem_dqs_n    (HPS_DDR3_DQS_N),    //       .mem_dqs_n
	.memory_mem_odt      (HPS_DDR3_ODT),      //       .mem_odt
	.memory_mem_dm       (HPS_DDR3_DM),       //       .mem_dm
	.memory_oct_rzqin    (HPS_DDR3_RZQ),      //       .oct_rzqin
	.uabchip_reset_reset (KEY[0])  			  // uabchip_reset.reset
);

endmodule
