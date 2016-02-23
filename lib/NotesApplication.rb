class NotesApplication
  @@notes = []
  def initialize author
    @@author = author
    @@notes = []

  end
  def create note_content
      if note_content.size == 0
          puts "You cannot submit an empty note"
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
      puts "By Author [#{@@author}]","\n"
    end
  end
  def get note_id
    id = note_id.to_i - 1
    if @@notes[id] == nil
      puts "Note not in the Library, you can create one!"
    else
      puts "#{@@notes[id]}"
    end
  end
  def search search_text 
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
  def delete note_id
    id = note_id.to_i - 1
    if @@notes[id] == nil
        puts "Note not in the Library, you can create one!"
    else
      @@notes.delete_at(id)
    end
  end

  def edit(
	note_id,
	new_content
	)
    if @@notes[note_id]
      puts "\nThe old content of the Note is: \n#{@@notes[note_id]}\n"
      @@notes[note_id] = new_content
      puts "\nThe new content of the file is: \n#{@@notes[note_id]}\n"
    else
      puts "Note does not exist!."
    end
  end
end 
