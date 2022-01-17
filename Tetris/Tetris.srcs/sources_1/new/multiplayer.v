
module multi_controller (
    input clk,
    input rst,
    input send_block,
    output reg received_block,
    output reg [4:0] receive_buffer,

    input rx,
    output reg rx_ack,
    output reg tx,
    input tx_ack
);

    reg [4:0] send_buffer;
    // reg [4:0] receive_buffer;

    reg [4:0] next_send_buffer;
    reg [4:0] next_receive_buffer;

    reg next_tx;

    reg tx_ack_state;
    reg next_tx_ack_state;

    reg transmitting;
    reg next_transmitting;


    always @* begin // Transmit
        next_send_buffer = send_buffer;
        next_tx = tx;
        next_tx_ack_state = tx_ack_state;
        next_transmitting = transmitting;

        if (send_block) begin
            next_send_buffer = send_buffer + 1;
        end else begin
            if (tx_ack != tx_ack_state) begin
                next_transmitting = 0;
                next_tx_ack_state = tx_ack;
            end else if (send_buffer && !next_transmitting) begin
                next_send_buffer = send_buffer - 1;
                next_tx = ~tx;
                next_transmitting = 1;
            end
        end
    end

    reg rx_state;
    reg next_rx_state;

    reg next_rx_ack;

    reg next_received_block;

    always @* begin // Receive
        next_receive_buffer = receive_buffer;
        next_rx_state = rx_state;
        next_rx_ack = rx_ack;
        next_received_block = 0;

        if (rx != rx_state) begin
            next_rx_state = rx;
            next_received_block = 1;
            next_rx_ack = ~rx_ack;
            next_receive_buffer = receive_buffer + 1;
        end
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            send_buffer <= 0;
            receive_buffer <= 0;

            tx <= 0;
            tx_ack_state <= 0;
            transmitting <= 0;

            rx_state <= 0;
            rx_ack <= 0;
            received_block <= 0;
        end else begin
            send_buffer <= next_send_buffer;
            receive_buffer <= next_receive_buffer;

            tx <= next_tx;
            tx_ack_state <= next_tx_ack_state;
            transmitting <= next_transmitting;
            
            rx_state <= next_rx_state;
            rx_ack <= next_rx_ack;
            received_block <= next_received_block;
        end
    end

endmodule