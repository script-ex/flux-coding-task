# Ruby

require_relative 'libs'

# Screen handling
lcd = Libs::LiquidCrystal.new(8, 9, 4, 5, 6, 7)

menu_page = 0
menu_items = ["START CAPTURE", "START SHOWCASE", "PRESETS", "SET TRIGGER", "SETTINGS", "ABOUT"]
max_menu_pages = ((menu_items.size / 2.0).round) + 0.5

# Bitmap icons drawn on screen
down_arrow = [0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b11111, 0b01110, 0b00100]
up_arrow = [0b00100, 0b01110, 0b11111, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100]

def main_menu_draw
  lcd.clear
  lcd.set_cursor(1, 0)
  lcd.print(menu_items[menu_page])
  lcd.set_cursor(1, 1)
  lcd.print(menu_items[menu_page + 1])
  if menu_page == 0
    lcd.set_cursor(15, 1)
    lcd.write(2)
  elsif menu_page > 0 and menu_page < max_menu_pages
    lcd.set_cursor(15, 1)
    lcd.write(2)
    lcd.set_cursor(15, 0)
    lcd.write(1)
  elsif menu_page == max_menu_pages
    lcd.set_cursor(15, 0)
    lcd.write(1)
  end
end

def evaluate_button(x)
  result = 0
  if x < 50
    result = 1  # up
  elsif x < 195
    result = 2  # down
  end
  result
end

def operate_main_menu
  active_button = 0
  while active_button == 0
    read_key = analog_read(0)
    button = evaluate_button(read_key)
    case button
    when 0
      # When button returns as 0 there is no action taken
    when 1
      button = 0
      menu_page -= 1
      menu_page = [menu_page, 0].max
      main_menu_draw
      active_button = 1
    when 2
      button = 0
      menu_page += 1
      menu_page = [menu_page, max_menu_pages].min
      main_menu_draw
      active_button = 1
    end
  end
end

def setup
  lcd.begin(16, 2)
  lcd.create_char(1, up_arrow)
  lcd.create_char(2, down_arrow)
end

def cycle
  main_menu_draw
  operate_main_menu
end

def main
  setup
  loop do
    cycle
  end
end

# Call the main function
main
