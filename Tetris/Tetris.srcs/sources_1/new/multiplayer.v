
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

    reg next_received_block;

    reg [4:0] next_send_buffer;
    reg [4:0] next_receive_buffer;

    reg rx_state;
    reg next_rx_state;
    reg next_tx;

    always @* begin
        next_tx = tx;
        next_send_buffer = send_buffer;
        if (send_block) begin
            next_send_buffer = send_buffer + 1;
        end else begin
            if (send_buffer) begin
                next_tx = ~tx;
                next_send_buffer = send_buffer - 1;
            end
        end
    end

    always @* begin
        next_rx_state = rx_state;
        next_receive_buffer = receive_buffer;
        next_received_block = 0;
        if (rx != rx_state) begin
            next_receive_buffer = receive_buffer + 1;
            next_rx_state = rx;
        end else begin
            // if (receive_buffer) begin
            //     next_received_block = 1;
            //     next_receive_buffer = receive_buffer - 1;
            // end
        end
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            send_buffer <= 0;
            receive_buffer <= 0;
            received_block <= 0;
            tx <= 0;
            rx_state <= 0;
        end else begin
            send_buffer <= next_send_buffer;
            receive_buffer <= next_receive_buffer;
            received_block <= next_received_block;
            tx <= next_tx;
            rx_state <= next_rx_state;
        end
    end

endmodule