require_relative 'libs'
require_relative 'liquid_crystal'

class MenuController
  attr_reader :lcd, :menu_items, :current_page, :max_pages

  def initialize(lcd, menu_items)
    @lcd = lcd
    @menu_items = menu_items
    @current_page = 0
    calculate_max_pages
  end

  def setup
    lcd.begin(16, 2)
    lcd.create_char(1, up_arrow)
    lcd.create_char(2, down_arrow)
    draw_menu
  end

  def handle_navigation(input)
    previous_page = @current_page
    case evaluate_input(input)
    when :up then navigate(-1)
    when :down then navigate(1)
    end
    draw_menu if previous_page != @current_page
  end

  private

  def draw_menu
    lcd.clear
    start_index = current_page * 2
    (start_index...(start_index + 2)).each do |index|
      next unless menu_items[index]
      lcd.set_cursor(1, index - start_index)
      lcd.print(menu_items[index])
    end
    draw_arrows
  end

  def draw_arrows
    lcd.set_cursor(15, 1) if current_page < max_pages - 1
    lcd.write(2) if current_page < max_pages - 1
    lcd.set_cursor(15, 0) if current_page > 0
    lcd.write(1) if current_page > 0
  end

  def navigate(direction)
    @current_page += direction
    @current_page = @current_page.clamp(0, max_pages - 1)
  end

  def calculate_max_pages
    @max_pages = (menu_items.size / 2.0).ceil
  end

  def evaluate_input(input)
    input < 50 ? :up : :down
  end

  def up_arrow
    [0b00100, 0b01110, 0b11111, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100]
  end

  def down_arrow
    [0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b11111, 0b01110, 0b00100]
  end
end

def setup
  lcd = LiquidCrystal.new(8, 9, 4, 5, 6, 7)
  menu_items = ["START CAPTURE", "START SHOWCASE", "PRESETS", "SET TRIGGER", "SETTINGS", "ABOUT"]
  @menu_controller = MenuController.new(lcd, menu_items)
  @menu_controller.setup
end

def cycle
  input = Libs.analog_read(0)
  @menu_controller.handle_navigation(input)
end

def main
  setup
  loop do
    cycle
  end
end

main
