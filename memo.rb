require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集する)"
memo_type = gets.chomp

if memo_type == "1" || memo_type == "１" then
  puts "新規作成：拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp

  puts "メモしたい内容を記入してください(Ctrl+Dで終了)"
  memo = readlines(chomp: true)
  CSV.open("#{file_name}.csv", "w") do |file|
    file << memo
  end

elsif memo_type == "2" || memo_type == "２" then
  puts "編集：拡張子を除いて編集したいファイル名を入力してください"
  file_name = gets.chomp
  
  if File.exist?("#{file_name}.csv") then
    puts "現在のメモの内容はこちらです"
    CSV.foreach("#{file_name}.csv") do |row|
      puts row.join(",")
    end
    
    puts "メモに追加したい内容を記入してください(Ctrl+Dで終了)"
    memo = readlines(chomp: true)
    CSV.open("#{file_name}.csv", "a") do |file|
      file << memo
    end 
  else
    puts "ファイル名が存在しません。初めからやり直して下さい"
  end
else
  puts "入力が無効です。初めからやり直して下さい"
end