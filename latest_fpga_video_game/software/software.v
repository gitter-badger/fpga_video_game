///////////////////////////////////////////////////////////////////////////////////////////
// Copyright � 2010-2013, Xilinx, Inc.
// This file contains confidential and proprietary information of Xilinx, Inc. and is
// protected under U.S. and international copyright and other intellectual property laws.
///////////////////////////////////////////////////////////////////////////////////////////
//
// Disclaimer:
// This disclaimer is not a license and does not grant any rights to the materials
// distributed herewith. Except as otherwise provided in a valid license issued to
// you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE
// MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY
// DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
// INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT,
// OR FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable
// (whether in contract or tort, including negligence, or under any other theory
// of liability) for any loss or damage of any kind or nature related to, arising
// under or in connection with these materials, including for any direct, or any
// indirect, special, incidental, or consequential loss or damage (including loss
// of data, profits, goodwill, or any type of loss or damage suffered as a result
// of any action brought by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-safe, or for use in any
// application requiring fail-safe performance, such as life-support or safety
// devices or systems, Class III medical devices, nuclear facilities, applications
// related to the deployment of airbags, or any other applications that could lead
// to death, personal injury, or severe property or environmental damage
// (individually and collectively, "Critical Applications"). Customer assumes the
// sole risk and liability of any use of Xilinx products in Critical Applications,
// subject only to applicable laws and regulations governing limitations on product
// liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
//
///////////////////////////////////////////////////////////////////////////////////////////
//
// Production definition of a 2K program for KCPSM6 in a 7-Series device using a 
// RAMB36E1 primitive.
//
// Note: The complete 12-bit address bus is connected to KCPSM6 to facilitate future code 
//       expansion with minimum changes being required to the hardware description. 
//       Only the lower 11-bits of the address are actually used for the 2K address range
//       000 to 7FF hex.  
//
// Program defined by 'F:\fpga_video_game\latest_fpga_video_game\software\software.psm'.
//
// Generated by KCPSM6 Assembler: 27 Nov 2015 - 04:20:42. 
//
///////////////////////////////////////////////////////////////////////////////////////////
 
`timescale 1 ns / 1 ps
 
module software (
  input  [11:0] address,
  output [17:0] instruction,
  input         bram_enable,
  input         clk
  );
 
  wire [15:0] address_a;
  wire [35:0] data_in_a;
  wire [35:0] data_out_a;
  wire [15:0] address_b;
  wire [35:0] data_in_b;
  wire [35:0] data_out_b;
  wire        enable_b;
  wire        clk_b;
  wire [7:0]  we_b;
  
  assign address_a = {1'b1, address[10:0], 4'b1111};
  assign instruction = {data_out_a[33:32],  data_out_a[15:0]};
  assign data_in_a = {35'b000000000000000000000000000000000000, address[11]};
  
  assign address_b = 16'b1111111111111111;
  assign data_in_b = {2'h0,  data_out_b[33:32], 16'h0000, data_out_b[15:0]};
  assign enable_b = 1'b0;
  assign we_b = 8'h00;
  assign clk_b = 1'b0;
 
  RAMB36E1 #(
    .READ_WIDTH_A              (18),
    .WRITE_WIDTH_A             (18),
    .DOA_REG                   (0),
    .INIT_A                    (36'h000000000),
    .RSTREG_PRIORITY_A         ("REGCE"),
    .SRVAL_A                   (36'h000000000),
    .WRITE_MODE_A              ("WRITE_FIRST"),
    .READ_WIDTH_B              (18),
    .WRITE_WIDTH_B             (18),
    .DOB_REG                   (0),
    .INIT_B                    (36'h000000000),
    .RSTREG_PRIORITY_B         ("REGCE"),
    .SRVAL_B                   (36'h000000000),
    .WRITE_MODE_B              ("WRITE_FIRST"),
    .INIT_FILE                 ("NONE"),
    .SIM_COLLISION_CHECK       ("ALL"),
    .RAM_MODE                  ("TDP"),
    .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),
    .EN_ECC_READ               ("FALSE"),
    .EN_ECC_WRITE              ("FALSE"),
    .RAM_EXTENSION_A           ("NONE"),
    .RAM_EXTENSION_B           ("NONE"),
    .SIM_DEVICE                ("7SERIES"),
    .INIT_00                   (256'h910E900F8001D505150FD50615031F621EFF1D051C8014001300120011001000),
    .INIT_01                   (256'h0075D510950F0025950F9001001B00FFD40CD30BD20A940F930E920F200ED008),
    .INIT_02                   (256'hD500150000FFD503150FD50215FFD501150FD500150050000105003C00690038),
    .INIT_03                   (256'hA045C65016E105E0500000B600EB0077500000FFD50315F0D50215FFD50115F0),
    .INIT_04                   (256'hD502950AD5002050D6021600D5002050D502950AD500204D2049A049C560160A),
    .INIT_05                   (256'h05E000FFD503153C05F0DF01DE02DE0000FFD503D501153C05F000FFDF03DF01),
    .INIT_06                   (256'hE071D50F95075000606C206DDE00500000FFD503153C05F0DF01D502D500950A),
    .INIT_07                   (256'h00FFD6039603D5029501D60106C0D500156450009C0250000F50E06DD5B4A06D),
    .INIT_08                   (256'h9501D60106C0D500156400FFD6039602D5029504D601960306C0D50095011564),
    .INIT_09                   (256'h156400FFD6031602D5029504D601160306C0D5009501156400FFD6031603D502),
    .INIT_0A                   (256'hD601160506C0D5009505156400FFD6031605D5029507D601960506C0D5009505),
    .INIT_0B                   (256'h00FFD603D5029507D601960206C0D500950A1564500000FFD6039605D5029507),
    .INIT_0C                   (256'hD601960206C0D5009508950A156400FFD603D5029508D60106C0D500950C1564),
    .INIT_0D                   (256'h156400FFD6031601D502D60106C0D5009509950C156400FFD6039602D5029502),
    .INIT_0E                   (256'h960506C0D50095051564500000FFD6031605D502D601960406C0D500950A950A),
    .INIT_0F                   (256'h1501500000FFD603D502950AD601960706C0D500156400FFD6039602D502D601),
    .INIT_10                   (256'h173C07E016012116C56007C006E061132109D56405F050002101D5019504D504),
    .INIT_11                   (256'h000000000000000000000000000000000000500050001C019E01610B2113C670),
    .INIT_12                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F                   (256'h2012000000000000000000000000000000000000000000000000000000000000),
    .INITP_00                  (256'hA6622637D2F6A4A9292AA92A9A8A9AF4D0AAA8888A2222AAD22AA80A0A200000),
    .INITP_01                  (256'h2A99229A492A692529A252999252A624A9924A99924A6649299924A662299924),
    .INITP_02                  (256'h0000000000000000000000000000000000000000000000000000297D4743D2D2),
    .INITP_03                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F                  (256'h8000000000000000000000000000000000000000000000000000000000000000))
  rom_2048x18 (
    .ADDRARDADDR               (address_a),
    .ENARDEN                   (bram_enable),
    .CLKARDCLK                 (clk),
    .DOADO                     (data_out_a[31:0]),
    .DOPADOP                   (data_out_a[35:32]), 
    .DIADI                     (data_in_a[31:0]),
    .DIPADIP                   (data_in_a[35:32]), 
    .WEA                       (4'h0),
    .REGCEAREGCE               (1'b0),
    .RSTRAMARSTRAM             (1'b0),
    .RSTREGARSTREG             (1'b0),
    .ADDRBWRADDR               (address_b),
    .ENBWREN                   (enable_b),
    .CLKBWRCLK                 (clk_b),
    .DOBDO                     (data_out_b[31:0]),
    .DOPBDOP                   (data_out_b[35:32]), 
    .DIBDI                     (data_in_b[31:0]),
    .DIPBDIP                   (data_in_b[35:32]), 
    .WEBWE                     (we_b),
    .REGCEB                    (1'b0),
    .RSTRAMB                   (1'b0),
    .RSTREGB                   (1'b0),
    .CASCADEINA                (1'b0),
    .CASCADEINB                (1'b0),
    .CASCADEOUTA               (),
    .CASCADEOUTB               (),
    .DBITERR                   (),
    .ECCPARITY                 (),
    .RDADDRECC                 (),
    .SBITERR                   (),
    .INJECTDBITERR             (1'b0),
    .INJECTSBITERR             (1'b0));
 
endmodule
