module baud_generator #(

    parameter CLOCK_FREQ = 100_000_000,
    parameter BAUD_RATE  = 115200,
    parameter BAUD_DIV   = CLOCK_FREQ / BAUD_RATE

)(
    input  logic clk,
    input  logic reset,

    output logic baud_tick

);

    logic [9:0] counter;

    always_ff @(posedge clk) begin

        if (reset) begin
            counter   <= 0;
            baud_tick <= 0;
        end

        else begin
            // Default: no baud tick
            baud_tick <= 0;
        

            if (counter==BAUD_DIV-1) begin 
                counter <=0;
                baud_tick <=1;
            end

            else begin
                counter <= counter+1;
            end
        end

    end 

endmodule