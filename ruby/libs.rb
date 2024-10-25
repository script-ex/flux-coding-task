module Libs
  class LiquidCrystal
    # Sets up the connection between the screen and the microcontroller
    def initialize(pin_num_rs, pin_num_enable, pin_num_d4, pin_num_d5, pin_num_d6, pin_num_d7)
      @pin_num_rs = pin_num_rs
      @pin_num_enable = pin_num_enable
      @pin_num_d4 = pin_num_d4
      @pin_num_d5 = pin_num_d5
      @pin_num_d6 = pin_num_d6
      @pin_num_d7 = pin_num_d7
    end

    # Clears the LCD screen and positions the cursor in the upper-left corner.
    def clear
    end

    # Initializes the interface to the LCD screen, and specifies the dimensions
    # (width and height) of the display.
    # begin() needs to be called before any other LCD library commands.
    def begin(width, height)
    end

    # Position the LCD cursor; that is, set the location at which subsequent
    # text written to the LCD will be displayed.
    def set_cursor(x, y)
    end

    # Prints text to the LCD.
    def print(str)
    end

    # Write a character to the LCD.
    def write(num)
    end

    # Create a custom character (glyph) for use on the LCD.
    def create_char(num, data)
    end
  end


  def self.round(x)
    if x >= 0
      (x + 0.5).to_i
    else
      (x - 0.5).to_i
    end
  end

  def self.constrain(val, min, max)
    [max, [val, min].max].min
  end

  # ----------------------------------------------------------------------
  # Hardware interaction

  # Reads voltage off a microcontroller pin.
  # Again, stub function.
  def self.analog_read(pin_num)
    -1
  end
end
