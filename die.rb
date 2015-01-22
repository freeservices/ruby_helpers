#!/usr/bin/env ruby

DICE_FACES = { '1' => ["  |       | |",
                       "  |   *   | ;",
                       "  |       |/ "],
               '2' => ["  |   *   | |",
                       "  |       | ;",
                       "  |   *   |/ "],
               '3' => ["  |   *   | |",
                       "  |   *   | ;",
                       "  |   *   |/ "],
               '4' => ["  | *   * | |",
                       "  |       | ;",
                       "  | *   * |/ "],
               '5' => ["  | *   * | |",
                       "  |   *   | ;",
                       "  | *   * |/ "],
               '6' => ["  | *   * | |",
                       "  | *   * | ;",
                       "  | *   * |/ "],
      }
DICE_TOP = ["    .-------.",
            "   /       /|",
            "  '-------' |"]

def print_die(dice)
  rows = Array.new(DICE_TOP.length + DICE_FACES["1"].length, "")
  row_bottom = ""
  for row in 0..(rows.length - 1) do
    if row < DICE_TOP.length
      for die in 0..(dice.length - 1) do
        rows[row].concat(DICE_TOP[row])
      end
    else
      for die in 0..(dice.length - 1) do
        rows[row].concat(DICE_FACES[dice[die].to_s][row - DICE_TOP.length])
      end
    end
    rows[row] << "\n"
  end

  puts rows[0]
  dice.each do
    row_bottom.concat("  '-------'  ")
  end
  puts row_bottom
end

def get_die_roll
  Random.rand(1..6)
end

if ARGV.length == 1 and ARGV[0].to_i > 0 and ARGV[0].to_i <= 10
  dice = ARGV[0].to_i
else
  dice = 1
end

dices = []
sum = 0
for i in 1..dice do
  die_roll = get_die_roll
  sum += die_roll
  dices << die_roll
end

print_die(dices)
puts "You rolled a #{sum}"
if dice == 1
  puts "\nPost Scriptum: you can enter a numer after die"
end
