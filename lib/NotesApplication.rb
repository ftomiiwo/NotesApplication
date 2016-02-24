module Tomiiwo
  class NotesApplication
    attr_accessor :author
    attr_accessor :notes

    def confirmID note_id
      if !note_id.is_a? Integer
        puts "Enter a number for note_id"
      end
    end
    def handle_error author
      raise "Do not include symbols or number in /
      author's name" if @author.include? (/[\W\D]/)
      raise "Everything must be in letters [A-Za-/
      z]" if !@author.is_a? String
      raise "Author's name must not be /
      empty!" if @author.empty?
    end
    def initialize(author)
      raise "Author's name cannot be empty" if author == ''
      raise "Author's name cannot be a number" if author.is_a? Integer
      raise "Author's name cannot be a number" if author.is_a? Float
      raise "Author's name cannot be empty" if author.is_a? NilClass
      raise "Author's name is not valid!" if !author.is_a? String
      @author = author
      @notes = []
    end

    def create new_content
      raise "You cannot save an empty note" if new_content == nil
      @notes << new_content
      id = @notes.size
      puts "Note ID: #{id.to_i}","\n"
      puts "[#{@notes[id.to_i-1]}]"
      puts "\n"*2
      puts "By Author [#{@author}]"
    end
    def get note_id
      id = note_id.to_i - 1
      raise "Your input is not a number" if !note_id.is_a? Integer
      raise "Note not in the Library, you can create one!" if @notes[id] == nil
      raise "Remember to enter a number" if note_id.is_a? String
      puts "#{@notes[id]}"
    end
    def search search_text
      for x in 1..(@notes.size-1)
        if @notes[x].include? search_text
          puts "Showing results for search '<#{search_text}>'"
          puts "Note ID: #{x}","\n"
          puts "[#{@notes[x]}]","\n"
          puts "By Author [#{@author}]"
        else
          puts "what you're looking for is not here!"
          break
        end
      end
    end
    def delete note_id
      puts "Note not in the Library, you can create one!" if @notes[id] == nil
      return "Enter a valid argument" if note_id == nil
      raise "Your input is not a number" if !note_id.is_a? Integer
      raise "Author's name cannot be a number" if note_id.is_a? Float
      raise "Author's name cannot be empty" if note_id.is_a? NilClass
      raise "Author's name is not valid!" if !note_id.is_a? String
      id = note_id.to_i - 1
      @notes.delete_at(id)
    end
    def edit(note_id, new_content)
      checkNoteId note_id
      checkNoteInput new_content
      checkifNoteExists note_id
      @notes[note_id] = new_content
    end


  end



end
