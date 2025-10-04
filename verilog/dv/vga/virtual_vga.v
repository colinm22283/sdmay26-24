`define VIRTUAL_VGA_MAX_BUFFER_SIZE (1048576)
`define VIRTUAL_VGA_MAX_COLOR_SIZE (32)

`define COLOR_TYPE_RGB332 (1)

`define COLOR_SIZE(color) (((color) == `COLOR_TYPE_RGB332) ? 8 : 1)

`define VGA_WRITE(path, buffer, offset, width, height, color_type) \
    begin : VGA_WRITE_PROC_`__LINE__ \
        integer i; \
        reg [((width) * (height) * `COLOR_SIZE((color_type))) - 1:0] flat_buffer; \
        \
        for (i = 0; i < (width) * (height); i = i + 1) begin \
            flat_buffer[i * 8+:8] = buffer[i]; \
        end \
        \
        virtual_vga_m._VGA_WRITE ($fopen((path), "wb"), (width), (height), (color_type), flat_buffer); \
    end

module virtual_vga_m();
    task _VGA_WRITE;
        input integer fd;
        input integer WIDTH;
        input integer HEIGHT;
        input integer COLOR_TYPE;
        input [`VIRTUAL_VGA_MAX_BUFFER_SIZE - 1:0] buffer;

        reg [31:0] size_bytes;
        reg [31:0] image_offset;
    begin
        size_bytes = 14 + 12 + WIDTH * HEIGHT * 3;
        image_offset = 14 + 12;

        $fwrite(
            fd,
            "BM%c%c%c%c%c%c%c%c%c%c%c%c",
            size_bytes[7:0],
            size_bytes[15:8],
            size_bytes[23:16],
            size_bytes[31:24],
            0,
            0,
            0,
            0,
            image_offset[7:0],
            image_offset[15:8],
            image_offset[23:16],
            image_offset[31:24]
        );

        $fwrite(
            fd,
            "%c%c%c%c%c%c%c%c%c%c%c%c",
            8'h0C,
            0,
            0,
            0,
            WIDTH[7:0],
            WIDTH[15:8],
            HEIGHT[7:0],
            HEIGHT[15:8],
            1,
            0,
            24,
            0
        );

        begin : DRAW_IMAGE
            integer x, y;

            for (y = 0; y < HEIGHT; y = y + 1) begin
                for (x = 0; x < WIDTH; x = x + 1) begin : INNER
                    integer i;
                    reg [`VIRTUAL_VGA_MAX_COLOR_SIZE - 1:0] color;
                    real r, g, b;

                    for (i = 0; i < `COLOR_SIZE(COLOR_TYPE); i = i + 1) begin
                        color[i] = buffer[(y * WIDTH + x) * `COLOR_SIZE(COLOR_TYPE) + i];
                    end

                    case (COLOR_TYPE)
                        `COLOR_TYPE_RGB332: begin
                            r = color[2:0] * 255.0 / 7.0;
                            g = color[5:3] * 255.0 / 7.0;
                            b = color[7:6] * 255.0 / 3.0;
                        end
                    endcase

                    begin : WRITE
                        reg [7:0] red;
                        reg [7:0] green;
                        reg [7:0] blue;

                        red = r;
                        green = g;
                        blue = b;

                        $fwrite(
                            fd,
                            "%c%c%c",
                            red,
                            green,
                            blue
                        );
                    end
                end
            end
        end

        $fclose(fd);
    end
    endtask
endmodule