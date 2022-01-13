`define FORWARD 2'd0
`define TURN_LEFT 2'd1
`define TURN_RIGHT 2'd2
`define STOP 2'd3


// This module take "mode" input and control two motors accordingly.
// clk should be 100MHz for PWM_gen module to work correctly.
// You can modify / add more inputs and outputs by yourself.
module motor(
    input clk,
    input rst,
    input [1:0]mode,
    output  [1:0]pwm,
    output reg [1:0]r_IN,
    output reg [1:0]l_IN
);

    // reg [9:0]next_left_motor, next_right_motor;
    reg [9:0]left_motor, right_motor;
    wire left_pwm, right_pwm;

    motor_pwm m0(clk, rst, left_motor, left_pwm);
    motor_pwm m1(clk, rst, right_motor, right_pwm);

    assign pwm = {left_pwm,right_pwm};

    // TODO: trace the rest of motor.v and control the speed and direction of the two motors
    
    parameter OFF = 2'b00;
    parameter FOR = 2'b10;
    parameter BACK = 2'b01;

    parameter RIGHT_MAGNITUDE = 735;
    parameter LEFT_MAGNITUDE = 745;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            left_motor <= 0;
            right_motor <= 0;
            l_IN <= OFF;
            r_IN <= OFF;
        end else begin
            case (mode)
                `FORWARD: begin
                    l_IN <= FOR;
                    r_IN <= FOR;
                    left_motor <= LEFT_MAGNITUDE;
                    right_motor <= RIGHT_MAGNITUDE;
                end
                `TURN_RIGHT: begin
                    l_IN <= FOR;
                    r_IN <= BACK;
                    left_motor <= LEFT_MAGNITUDE;
                    right_motor <= RIGHT_MAGNITUDE;
                end
                `TURN_LEFT: begin
                    l_IN <= BACK;
                    r_IN <= FOR;
                    left_motor <= LEFT_MAGNITUDE;
                    right_motor <= RIGHT_MAGNITUDE;
                end
                `STOP: begin
                    l_IN <= OFF;
                    r_IN <= OFF;
                    left_motor <= 0;
                    right_motor <= 0;
                end
            endcase
        end
    end

    
endmodule

module motor_pwm (
    input clk,
    input reset,
    input [9:0]duty,
	output pmod_1 //PWM
);
        
    PWM_gen pwm_0 ( 
        .clk(clk), 
        .reset(reset), 
        .freq(32'd25000),
        .duty(duty), 
        .PWM(pmod_1)
    );

endmodule

//generte PWM by input frequency & duty cycle
module PWM_gen (
    input wire clk,
    input wire reset,
	input [31:0] freq,
    input [9:0] duty,
    output reg PWM
);
    wire [31:0] count_max = 100_000_000 / freq;
    wire [31:0] count_duty = count_max * duty / 1024;
    reg [31:0] count;
        
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            count <= 0;
            PWM <= 0;
        end else if (count < count_max) begin
            count <= count + 1;
            if(count < count_duty)
                PWM <= 1;
            else
                PWM <= 0;
        end else begin
            count <= 0;
            PWM <= 0;
        end
    end
endmodule


// sonic_top is the module to interface with sonic sensors
// clk = 100MHz
// <Trig> and <Echo> should connect to the sensor
// <distance> is the output distance in cm
module sonic_top(clk, rst, Echo, Trig, distance);
	input clk, rst, Echo;
	output Trig;
    output [19:0] distance;

	wire[19:0] dis;
    wire clk1M;
	wire clk_2_17;

    assign distance = dis;

    div clk1(clk ,clk1M);
	TrigSignal u1(.clk(clk), .rst(rst), .trig(Trig));
	PosCounter u2(.clk(clk1M), .rst(rst), .echo(Echo), .distance_count(dis));
 
endmodule

module PosCounter(clk, rst, echo, distance_count); 
    input clk, rst, echo;
    output[19:0] distance_count;

    parameter S0 = 2'b00;
    parameter S1 = 2'b01; 
    parameter S2 = 2'b10;
    
    wire start, finish;
    reg[1:0] curr_state, next_state;
    reg echo_reg1, echo_reg2;
    reg[19:0] count, distance_register;
    wire[19:0] distance_count; 

    always@(posedge clk) begin
        if(rst) begin
            echo_reg1 <= 0;
            echo_reg2 <= 0;
            count <= 0;
            distance_register  <= 0;
            curr_state <= S0;
        end
        else begin
            echo_reg1 <= echo;   
            echo_reg2 <= echo_reg1; 
            case(curr_state)
                S0:begin
                    if (start) curr_state <= next_state; //S1
                    else count <= 0;
                end
                S1:begin
                    if (finish) curr_state <= next_state; //S2
                    else count <= count + 1;
                end
                S2:begin
                    distance_register <= count;
                    count <= 0;
                    curr_state <= next_state; //S0
                end
            endcase
        end
    end

    always @(*) begin
        case(curr_state)
            S0:next_state = S1;
            S1:next_state = S2;
            S2:next_state = S0;
            default:next_state = S0;
        endcase
    end

    assign start = echo_reg1 & ~echo_reg2;  
    assign finish = ~echo_reg1 & echo_reg2;

    // TODO: trace the code and calculate the distance, output it to <distance_count>
    assign distance_count = distance_register * 340 / 10000 / 2;

endmodule

// send trigger signal to sensor
module TrigSignal(clk, rst, trig);
    input clk, rst;
    output trig;

    reg trig, next_trig;
    reg[23:0] count, next_count;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            count <= 0;
            trig <= 0;
        end
        else begin
            count <= next_count;
            trig <= next_trig;
        end
    end
    // count 10us to set trig high and wait for 100ms
    always @(*) begin
        next_trig = trig;
        next_count = count + 1;
        if(count == 999)
            next_trig = 0;
        else if(count == 24'd9999999) begin
            next_trig = 1;
            next_count = 0;
        end
    end
endmodule

// clock divider for T = 1us clock
module div(clk ,out_clk);
    input clk;
    output out_clk;
    reg out_clk;
    reg [6:0]cnt;
    
    always @(posedge clk) begin   
        if(cnt < 7'd50) begin
            cnt <= cnt + 1'b1;
            out_clk <= 1'b1;
        end 
        else if(cnt < 7'd100) begin
	        cnt <= cnt + 1'b1;
	        out_clk <= 1'b0;
        end
        else if(cnt == 7'd100) begin
            cnt <= 0;
            out_clk <= 1'b1;
        end
    end
endmodule



module tracker_sensor(clk, reset, left_track, right_track, mid_track, state);
    input clk;
    input reset;
    input left_track, right_track, mid_track;
    output reg [1:0] state;

    reg [1:0] next_state;

    reg [1:0] last_turn;
    reg [1:0] next_last_turn;

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            state <= `FORWARD;
            last_turn <= `FORWARD;
        end else begin
            state <= next_state;
            last_turn <= next_last_turn;
        end
    end

    always @* begin
        next_last_turn <= last_turn;
        case ({left_track, mid_track, right_track})
            3'b000, 3'b111, 3'b101: begin
                next_state <= last_turn;
            end
            3'b010: begin
                next_state <= `FORWARD;
            end
            3'b110, 3'b100: begin
                next_state <= `TURN_LEFT;
                next_last_turn <= `TURN_LEFT;
            end
            3'b011, 3'b001: begin
                next_state <= `TURN_RIGHT;
                next_last_turn <= `TURN_RIGHT;
            end
        endcase
    end
endmodule



module Lab9(
    input clk,
    input rst,
    input echo,
    input left_track,
    input right_track,
    input mid_track,
    output trig,
    output IN1,
    output IN2,
    output IN3, 
    output IN4,
    output left_pwm,
    output right_pwm,
    output stop_led,
    output mode_forward_led,
    output mode_left_led,
    output mode_right_led,
    output mode_stop_led
    // You may modify or add more input/ouput yourself.
);
    // We have connected the motor, tracker_sensor and sonic_top modules in the template file for you.
    // TODO: control the motors with the information you get from ultrasonic sensor and 3-way track sensor.

    wire [19:0] distance;
    wire [1:0] tracker_state;
    wire [1:0] mode = (distance < 30)? `STOP: tracker_state;

    assign stop_led = mode == `STOP;

    assign mode_forward_led = tracker_state == `FORWARD;
    assign mode_left_led = tracker_state == `TURN_LEFT;
    assign mode_right_led = tracker_state == `TURN_RIGHT;
    assign mode_stop_led = tracker_state == `STOP;
    

    motor A(
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .pwm({left_pwm, right_pwm}),
        .l_IN({IN1, IN2}),
        .r_IN({IN3, IN4})
    );

    sonic_top B(
        .clk(clk), 
        .rst(rst), 
        .Echo(echo), 
        .Trig(trig),
        .distance(distance)
    );

    div clk1(clk ,clk1M);
    tracker_sensor C(
        .clk(clk1M), 
        .reset(rst), 
        .left_track(~left_track), 
        .right_track(~right_track),
        .mid_track(~mid_track), 
        .state(tracker_state)
    );

endmodule