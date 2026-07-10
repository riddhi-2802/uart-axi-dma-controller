module tb_baud_generator;
    logic clk;
    logic reset;

    logic baud_tick;

    baud_generator dut (
        .clk(clk),
        .reset(reset),
        .baud_tick(baud_tick)
    
    );
         
    initial begin
         clk=0;

         forever begin
            #5 clk=~clk;
        end
    end
    
    initial begin
        reset=1;
        #20 reset=0;
    end

    initial begin
        #10000;
        $finish;
    end

    initial begin
        $dumpfile("baud_generator.vcd");
        $dumpvars(0, tb_baud_generator);
    end
    
endmodule