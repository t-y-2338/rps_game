require "csv"

@rps_result = nil

def rps_game
  puts "じゃんけん..."
  puts "グー→0 チョキ→1 パー→2 やめる→3"
  rps = ["グー", "チョキ", "パー"]
  rps_player = gets.to_i
  
  if rps_player == 3
    puts "------------------"
    puts "あいて：またね!"
    puts "------------------"
    @rps_result = "end"
  else
    rps_enemy = rand(0..2)
    puts "ポン!"
    puts "------------------"
    puts "あなた：#{rps[rps_player]}!"
    puts "あいて：#{rps[rps_enemy]}!"
    puts "------------------"
    
    if rps_player == rps_enemy
      @rps_result = "draw"
  
      while @rps_result == "draw" do
      puts "あいこで..."
      puts "グー→0 チョキ→1 パー→2"
      rps = ["グー", "チョキ", "パー"]
      rps_player = gets.to_i
      rps_enemy = rand(0..2)
      puts "ショ!"
      puts "------------------"
      puts "あなた：#{rps[rps_player]}!"
      puts "あいて：#{rps[rps_enemy]}!"
      puts "------------------"
  
        if rps_player == rps_enemy
          @rps_result = "draw"
        elsif rps_player == 0 && rps_enemy == 1 || rps_player == 1 && rps_enemy == 2 ||rps_player == 2 && rps_enemy == 0
          @rps_result = "win"
          look_game
        else
          @rps_result = "lose"
          look_game
        end
      end
    elsif rps_player == 0 && rps_enemy == 1 || rps_player == 1 && rps_enemy == 2 ||rps_player == 2 && rps_enemy == 0
      @rps_result = "win"
      look_game
    else
      @rps_result = "lose"
      look_game
    end
  end
end

def look_game
  puts "あっち向いて〜..."
  
  if @rps_result == "win"
    puts "0(上) 1(下) 2(右) 3(左)"
    direction = ["上↑", "下↓", "右→", "左←"]
    direction_player = gets.to_i
    direction_enemy = rand(0..3)
    puts "ホイ!"
    puts "------------------"
    puts "あなた：#{direction[direction_player]}"
    puts "あいて：#{direction[direction_enemy]}"
    puts "------------------"
    
    if direction_player == direction_enemy
      puts "あなたの勝ちです"
    else
      rps_game
    end
  else
    puts "0(上) 1(下) 2(右) 3(左)"
    direction = ["上↑", "下↓", "右→", "左←"]
    direction_player = gets.to_i
    direction_enemy = rand(0..3)
    puts "ホイ!"
    puts "------------------"
    puts "あいて：#{direction[direction_enemy]}"
    puts "あなた：#{direction[direction_player]}"
    puts "------------------"
    
    if direction_enemy == direction_player
      puts "あなたの負けです"
    else
      rps_game
    end
  end
end

rps_game