require_relative '../lib/NotesApplication'


puts "Welcome to a Ruby based Note Application"
appOn = true
# class Program < NotesApplication
# end
puts "Enter Author's Name: "
author1 = gets.chomp
NA = NotesApplication.new(author1)
notes1 = ["Ada is a girl","Tomi is here","The way down is up","Elizabeth is cool","The way up is down"]

while appOn
  puts "-------Follow the Instructions below--------"
  puts "     Enter the Operation you'll like to perform!"
  puts "i.   If you want to Create a Note, enter 'Create'."
  puts "ii.  To List all the notes you've created, Enter 'List'. "
  puts "iii. if you want read a note, enter 'Read'."
  puts "iv.  You can search by typing the word 'Search'."
  puts "v.   You can delete a Note by typing 'Delete'."
  puts "v.   If you want to update the content of a note, Type in 'Update'."

  # p local_variables
  operation = gets.chomp.downcase
  case operation
  when "create"
    puts "Create a note!"
    puts "Enter the content of the note here "
    note_content = gets.chomp
    NA.create(note_content)
  when "list"
    puts "you want list abi"
    puts NA.list
  #  puts "Author is : #{@@author}"
  when "read"
    puts "what note do you want to read? Enter the id: "
    note_id = gets.chomp
  #  note_id = note_id.to_i
    if (/\d+/).match(note_id) == nil
        puts "Enter a valid Number... e.g. 1, 3, .. 50!"
    elsif note_id.to_i < 1
        puts "Enter an ID that is greater than 0"
    else
      puts "The content of Note #{note_id} is: ","\n"
      NA.get(note_id)
    end

  when "search"
    puts "enter search text"
    search_text = gets.chomp
    if search_text.size == 0
      puts "You cannot search from 'Nothing'!"
    else
      NA.search(search_text)
    end
  when "delete"
    puts "what note do you want to delete? Enter the id: "
    note_id = gets.chomp
    if (/\d+/).match(note_id) == nil
        puts "Enter a valid Number... e.g. 1, 3, .. 50!"
    elsif note_id.to_i < 1
        puts "Enter an ID that is greater than 0"
    else
      puts "The content of Note #{note_id} has been deleted!."
      NA.delete(note_id)
    end

  when "edit"
    puts "\nEnter the ID of the Note you want to Edit:"
    note_id = gets.chomp.to_i
    puts "Enter the new content:"
    new_content = gets.chomp
    NA.edit(note_id, new_content)
  else
    puts "\nThe Operation you want to perform is not available!. Follow the instructions above."
  end




  puts "\n\nDo you want to perform another Operation? (Yes(Y)/No(N))"
  operateOn = gets.chomp.downcase

  if operateOn[0] == "y"
    appOn = true
  elsif operateOn[0] == "n"
    puts "\nGood Bye"
    appOn = false
    break
  end
end











