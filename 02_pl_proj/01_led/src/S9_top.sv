module S9_top#(   
    parameter ILA_DEBUG_LED_EN = 1'b0       ,
    parameter MODE          = 2'd1          ,     //0: all leds twinkle all 0 ->1; 1:流水灯
    parameter CLK_FRE       = 50_000_000    ,     //Hz
    parameter SPARKLE_FRE   = 1             ,     //Hz
    parameter CNT_WIDTH     = 28            ,      
    parameter LED_NUM       = 4
)(
    //PL 
    input   logic                    osc_clk    ,//50M note this clk need you add a clock in the board

    output  logic    [LED_NUM-1:0]   leds       ,

   // PS
    inout logic  [14:0]DDR_addr,
    inout logic  [2:0]DDR_ba,
    inout logic  DDR_cas_n,
    inout logic  DDR_ck_n,
    inout logic  DDR_ck_p,
    inout logic  DDR_cke,
    inout logic  DDR_cs_n,
    inout logic  [3:0]DDR_dm,
    inout logic  [31:0]DDR_dq,
    inout logic  [3:0]DDR_dqs_n,
    inout logic  [3:0]DDR_dqs_p,
    inout logic  DDR_odt,
    inout logic  DDR_ras_n,
    inout logic  DDR_reset_n,
    inout logic  DDR_we_n,
    inout logic  FIXED_IO_ddr_vrn,
    inout logic  FIXED_IO_ddr_vrp,
    inout logic  [53:0]FIXED_IO_mio,
    inout logic  FIXED_IO_ps_clk,
    inout logic  FIXED_IO_ps_porb,
    inout logic  FIXED_IO_ps_srstb

);

logic  FCLK_CLK0_0  ;
logic  FCLK_RESET0_N_0;

logic rst;


global_reset#(
    .rst_num     (8'd10),
    .rst_type    (1'd1 )                 //复位模式 0：低有效  1：高有效
)u_global_reset
(
	.clk    (FCLK_CLK0_0 ),
	.locked (1'b1       ),

	.g_rst  (rst        )
);

led_n_0_twinkle #(
    .ILA_DEBUG_LED_EN(ILA_DEBUG_LED_EN),
    .MODE          ( MODE        )  ,     //0: all leds twinkle all 0 ->1; 1:流水灯
    .CLK_FRE       ( CLK_FRE     )  ,     //Hz
    .SPARKLE_FRE   ( SPARKLE_FRE )  ,     //Hz
    .CNT_WIDTH     ( CNT_WIDTH   )  ,      
    .LED_NUM       ( LED_NUM     )

)u_led_n_0_twinkle(
    .clk                 (FCLK_CLK0_0     ),//input   logic   
    .rst                 (!FCLK_RESET0_N_0       ),//input   logic   
    .en                  (1'b1      ),//input   logic   

    .leds                (leds      ) //output  logic       
);


system_processor system_processor_i
    (
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FCLK_CLK0_0(FCLK_CLK0_0),
        .FCLK_RESET0_N_0(FCLK_RESET0_N_0),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb)
    );

endmodule
