class NotesApplication
#  @@notes = ["Ada is a girl","Tomi is here","The way down is up","Elizabeth is cool","The way up is down"]
  @@notes = []

  def initialize(author)
    @@author = author
#    @@notes = ["Ada is a girl","Tomi is here","The way down is up","Elizabeth is cool","The way up is down"]
    @@notes = []

  end
  def create(note_content)
    # puts "Enter the content of the note here: "
    # note_content = gets.chomp
      if note_content.size == 0
          puts "You cannot submit an empty note"
          note_content = gets.chomp
      else
        @@notes << note_content
        id = @@notes.size
        puts "Note ID: #{id.to_i}","\n"
        puts "[#{@@notes[id.to_i-1]}]"
        puts "\n"*2
        puts "By Author [#{@@author}]"
      end
  end
  def list
    for i in 1..(@@notes.length - 1)
      puts "Note ID: #{i}","\n"
      puts "[#{@@notes[i]}]","\n"
      puts "\n"*2
#      puts "#{self}"
      puts "By Author [#{@@author}]","\n"
    end
  end
  def get(note_id)
    id = note_id.to_i - 1
#    while @@notes[id] == nil
#      puts "Note not in the Library, you can create one or you can read another one!"
#      puts "Enter a number to read another note!"
    if @@notes[id] == nil
      puts "Note not in the Library, you can create one!"
    else
      puts "#{@@notes[id]}"
    end
  end
  def search(search_text)
    for x in 1..(@@notes.size-1)
      if @@notes[x].include? search_text
        puts "Showing results for search '<#{search_text}>'"
        puts "Note ID: #{x}","\n"
        puts "[#{@@notes[x]}]","\n"
        puts "By Author [#{@@author}]"
      else
        puts "what you're looking for is not here!"
        break
      end
    end
  end
  def delete(note_id)
    id = note_id.to_i - 1
    if @@notes[id] == nil
        puts "Note not in the Library, you can create one!"
    else
      @@notes.delete_at(id)
    end
  end

  def edit(note_id, new_content)
    if @@notes[note_id]
      puts "\nThe old content of the Note is: \n#{@@notes[note_id]}\n"
      @@notes[note_id] = new_content
      puts "\nThe new content of the file is: \n#{@@notes[note_id]}\n"
    else
      puts "Note does not exist!."
    end
  end
#  def search(search_text)
#      for x in 1..(@@notes.size-1)
#        puts search_text,
#      if @@notes[x].include? search_text
#        puts "Showing results for search '[#{search_text}]'"
#        puts "Note ID: #{x}","\n"
#        puts "[#{@@notes[x]}]"
#        puts "By Author [#{@@author}]"
#      end
#    end
#  end

end




  # puts "Enter the Operation you'll like to perform!"
  # puts "if you want to create a note, enter 'Create'"
  # puts "To list all the notes you've created, Enter 'List' "
  # puts "if you want read a note, enter 'Read'"
  # puts "You can search by typing the word 'Search'"
  # puts "You can delete a Note by typing 'Delete'"
  # puts "if you want to update the content of a note, Type in 'Update'"


  # operation = gets.chomp.downcase
  # case operation
  # when "create"
  #   puts "Create a note!"
  #   puts "Enter the content of the note here "
  #   note_content = gets.chomp
  #   create(note_content)
  # when "list"
  #   puts "you want list abi"
  #   list
  #   puts "Author is : #{@@author}"
  #   @author.class
  # when "read"

  #   puts "what note do you want to read? Enter the id: "
  #   note_id = gets.chomp
  #   if (/\d+/).match(note_id) == nil
  #       puts "Enter a valid Number... e.g. 1, 3, .. 50!"
  #   elsif note_id.to_i < 1
  #       puts "Enter an ID that is greater than 0"
  #   elsif @notes[note_id.to_i - 1] == nil
  #       puts "Note not in the Library, you can create one!"
  #   else
  #     puts "The content of Note #{note_id} is: ","\n"
  #   end
  #   get(note_id)
  # when "search"
  #   puts "enter search text"
  #   search_text = gets.chomp
  #   if search.size == 0
  #     puts "You cannot search from 'Nothing'!"
  #   else
  #     search(search_text)
  #   end
  # when "delete"
  #   puts "what note do you want to read? Enter the id: "
  #   note_id = gets.chomp
  #   if (/\d+/).match(note_id) == nil
  #       puts "Enter a valid Number... e.g. 1, 3, .. 50!"
  #   elsif note_id.to_i < 1
  #       puts "Enter an ID that is greater than 0"
  #   elsif @notes[note_id.to_i - 1] == nil
  #       puts "Note not in the Library, you can create one!"
  #   else
  #     puts "The content of Note #{note_id} has been deleted!."
  #   end
  #   delete(note_id)
  # when "search"
  #   puts "What are you looking for?, Enter the text below!."
  #   search_text = gets.chomp
  # else
  #   puts "The Operation you want to perform is not available!. Follow the instructions above."
  # end



# end
# require 'NotesApplication'




