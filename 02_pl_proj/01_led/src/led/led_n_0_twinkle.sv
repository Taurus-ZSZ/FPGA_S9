module led_n_0_twinkle #(
    parameter ILA_DEBUG_LED_EN = 1'b0       ,
    parameter MODE          = 2'd0          ,     //0: all leds twinkle all 0 ->1; 1:流水灯
    parameter CLK_FRE       = 50_000_000    ,     //Hz
    parameter SPARKLE_FRE   = 1             ,     //Hz
    parameter CNT_WIDTH     = 28            ,      
    parameter LED_NUM       = 4

)(
    input   logic   clk                 ,   
    input   logic   rst                 ,
    input   logic   en                  ,

    output  logic   [LED_NUM-1:0]   leds    
);

localparam CNT_NUM =  CLK_FRE/SPARKLE_FRE -1;
logic [CNT_WIDTH-1:0] cnt;
logic flag;

// cnt 
always_ff @ (posedge clk) begin
    if (rst) begin
        cnt <= 'd0;
        flag <= 'd0;
    end else begin
        if (en) begin
            if (cnt < CNT_NUM) begin
                cnt <= cnt + 1'b1;
                flag <= 'd0;
            end else begin
                flag <= 1'd1;
                cnt <= 'd0;
            end
        end else begin
            flag <= 'd0;
            cnt <= 'd0;
        end
    end
end

// output 

int i;

generate
    if (MODE == 2'd0) begin : MODE_0    //all leds 0 to all bits 1 -> 0
        always_ff @ (posedge clk ) begin
            if (rst || (!en) ) begin
                leds <= 'd0;
            end else begin
                if (flag) begin
                    for (i =0; i< LED_NUM; i = i+ 1) begin
                        leds[i] <= !leds[i];
                    end
                end else begin
                    leds <= leds;
                end
            end          
        end
    end else if(MODE == 2'd1) begin : MODE_1
        if (LED_NUM == 1) begin
            always_ff @ (posedge clk ) begin
                if (rst || (!en) ) begin
                    leds <= 'd1;
                end else begin
                    if (flag) begin
                        leds[0] <= !leds[0];
                    end else begin
                        leds[0] <= leds[0];
                    end
                end          
            end
        end else begin
            always_ff @ (posedge clk ) begin
                if (rst || (!en)) begin
                    leds <= 'd1;
                end else begin
                    if (flag) begin
                        leds <= {leds[LED_NUM-2:0],leds[LED_NUM-1]};
                    end else begin 
                        leds <= leds;
                    end 
                end
            end
        end
        
    end 
endgenerate


generate if (ILA_DEBUG_LED_EN) begin : LED_DEBUG
    ila_led_n_0 u_ila_led_n_0 (
        .clk    (clk), // input wire clk


        .probe0(rst         ), // input wire [0:0]  probe0  
        .probe1({en,flag}   ), // input wire [1:0]  probe1 
        .probe2(leds        ), // input wire [3:0]  probe2 
        .probe3(cnt         ) // input wire [27:0]  probe3
    );

    end
endgenerate

endmodule
