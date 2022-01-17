
module multi_controller (
    input clk,
    input rst,
    input send_block,
    output reg received_block,
    output reg [4:0] receive_buffer,

    input rx,
    output reg tx
);

    reg [4:0] send_buffer;
    // reg [4:0] receive_buffer;

    reg [4:0] next_send_buffer;
    reg [4:0] next_receive_buffer;

    reg rx_state;
    reg next_rx_state;
    reg next_tx;

    reg [4:0] send_counter;
    reg [4:0] next_send_counter;

    always @* begin
        next_tx = tx;
        next_send_buffer = send_buffer;
        next_send_counter = send_counter + 1; // Send at slower rate
        if (send_block) begin
            next_send_buffer = send_buffer + 1;
        end else begin
            if (send_buffer && send_counter >= 10) begin
                next_tx = ~tx;
                next_send_buffer = send_buffer - 1;
                next_send_counter = 0;
            end
        end
    end

    always @* begin
        next_rx_state = rx_state;
        next_receive_buffer = receive_buffer;
        received_block = 0;
        
        if (rx != rx_state) begin
            received_block = 1;
            next_receive_buffer = receive_buffer + 1;
            next_rx_state = rx;
        end
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            send_buffer <= 0;
            receive_buffer <= 0;
            tx <= 0;
            rx_state <= 0;
            send_counter <= 0;
        end else begin
            send_buffer <= next_send_buffer;
            receive_buffer <= next_receive_buffer;
            tx <= next_tx;
            rx_state <= next_rx_state;
            send_counter <= next_send_counter;
        end
    end

endmodule