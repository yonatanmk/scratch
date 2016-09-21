board = [
  [{"1" => " "},{"2" => " "},{"3" => " "},{"4" => " "},{"5" => " "},{"6" => " "},{"7" => " "}],
  [{"1" => " "},{"2" => " "},{"3" => " "},{"4" => " "},{"5" => " "},{"6" => " "},{"7" => " "}],
  [{"1" => " "},{"2" => " "},{"3" => " "},{"4" => " "},{"5" => " "},{"6" => " "},{"7" => " "}],
  [{"1" => " "},{"2" => " "},{"3" => " "},{"4" => " "},{"5" => " "},{"6" => " "},{"7" => " "}],
  [{"1" => " "},{"2" => " "},{"3" => " "},{"4" => " "},{"5" => " "},{"6" => " "},{"7" => " "}],
  [{"1" => "X"},{"2" => " "},{"3" => " "},{"4" => " "},{"5" => " "},{"6" => " "},{"7" => " "}]
]

(3..5).each do |row_num|          #checking for vertical wins
  (0..6).each do |column|
    if board[row_num][column].values != [" "] && board[row_num][column].values == board[row_num - 1][column].values && board[row_num][column].values == board[row_num - 2][column].values && board[row_num][column].values == board[row_num - 3][column].values
      puts "WIN"
    end
  end
end
