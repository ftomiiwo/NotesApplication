require './lib/NotesApplication'
# require_relative 'spec_helper'
include Tomiiwo

RSpec.describe "NotesApplication" do

  context 'When several instances are created' do
    it 'should pass' do
      ade = NotesApplication.new("Ade")
      expect(ade.author).to eq "Ade"
    end
    it 'should pass' do
      ade = NotesApplication.new("Ola")
      expect(ade.author).to eq "Ola"
    end
    it 'should pass' do
      new_author = NotesApplication.new("New Author") 
      expect(new_author.author).to eq "New Author"
    end
    it 'should not pass due to less than 1 input' do
      expect {NotesApplication.new}.to raise_error ArgumentError
    end
    it 'should not pass due to more than 1 input' do
      expect {NotesApplication.new 'author_one','auth/
        or_two'}.to raise_error ArgumentError
    end
    it 'should not pass due to more than 1 input' do
      expect {NotesApplication.new 'author_o/
        ne','author_two','author_three'}.to raise_error ArgumentError
    end
  end

  context 'when running #create method' do
    tomiiwo = NotesApplication.new 'Tomiiwo'
    tomiiwo.create "This is a test message"
    tomiiwo.create "This is a another test message"
    tomiiwo.create "This is the third test message"
    it 'should not run' do
      expect {tomiiwo.create }.to raise_error ArgumentError
    end
    it 'should run' do
      expect {tomiiwo.create 'This is an in /
        test'}.not_to raise_error ArgumentError
    end
    it 'should not run' do
      expect {tomiiwo.create 'This is a test/
        ', 'this is another test'}.to raise_error ArgumentError
    end
    it 'should not run' do
      expect {tomiiwo.create 'This is a test', 'this is /
        another test', 'This is yet another test/
        '}.to raise_error ArgumentError
    end
  end

  context 'when running #get method' do
    tomiiwo = NotesApplication.new 'Tomiiwo'
    tomiiwo.create "This is a test message"
    tomiiwo.create "This is a another test message"
    tomiiwo.create "This is the third test message"
    it 'should return nothing' do
      expect {tomiiwo.get }.to raise_error ArgumentError
    end
    it 'should not run' do
      expect {tomiiwo.get 1, 2}.to raise_error ArgumentError
    end
    it 'should not run' do
      expect {tomiiwo.get 1, 2, 3}.to raise_error ArgumentError
    end
    it 'should not run' do
      expect {tomiiwo.get "I'm not a number"}.to raise_error RuntimeError
    end
    it 'it should return the most recent note on the list' do
      expect(tomiiwo.get (-1)) == 'This is the third test message'
    end
  end

  context 'When running #search method' do
    tomiiwo = NotesApplication.new 'Tomiiwo'
    tomiiwo.create "This is a test message"
    tomiiwo.create "This is a another test message"
    tomiiwo.create "This is the third test message"
    it 'should not run' do
      expect {tomiiwo.search }.to raise_error ArgumentError
    end
    it 'should not run' do
      expect {tomiiwo.search 'i am looking for A', 'I am /
        looking for B'}.to raise_error ArgumentError
    end
    it 'should not run' do
      expect {tomiiwo.search 'i am looking for A', 'I am /
        looking for B','I am looking for C'}.to raise_error ArgumentError
    end
    # it 'should run' do
    #   expect {tomiiwo.search 'third'}.to eq "Showing results for search '<third>'Note ID: 2,\n\n[This is the third test message]\n\nBy Author [Tomiiwo]"
    # end
  end
  context 'When running the #delete method' do
    tomiiwo = NotesApplication.new 'Tomiiwo'
    tomiiwo.create "This is a test message"
    tomiiwo.create "This is a another test message"
  end
  it 'should not run' do
    expect {tomiiwo.delete }.to raise_error NameError
  end
  it 'should not run' do
    expect {tomiiwo.delete "this is "}.to raise_error NameError
  end

end
# context "Testing if user writes nothing in a new note" do
#     tomiiwo = NotesApplication.new("Tomiiwo")
#     tomiiwo.create "This is a test note"
#     tomiiwo.create "This is another test note"
#     tomiiwo.create "Stop writing test note"

#     it 'returns array or notes' do
#       expect {tomiiwo.get(0)}.to eq "This is a test note"
#     end

    



#   end
# notes = NotesApplication.new('Tomiiwo')
# subject(:notes) {Note::NotesApplication}
# subject(:note_obj) {notes.new('Tomiiwo') }

# RSpec.describe Note::NotesApplication do
#   subject(:notes) { Note::NotesApplication }
#   subject(:note_obj) {notes.new('Tomiiwo') }

#    describe '#initialize' do
#     it 'returns an Instance of the class NotesApplication' do
#       expect(NotesApplication.new('Tomiiwo')).to be_an_instance_of NotesApplication
#     end
#     it 'accepts only one argument' do
#       expect {NotesApplication.new}.to raise_error ArgumentError
#       expect {NotesApplication.new('Tomiiwo','Abosede')}.to raise_error ArgumentError
#       expect {NotesApplication.new('Tomiiwo')}.not_to raise_error
#     end
#   end
#   describe '#create' do
#     it 'accepts only one argument' do
#       expect {NotesApplication.new}.to raise_error ArgumentError
#       expect {NotesApplication.new('Tomiiwo','Abosede')}.to raise_error ArgumentError
#       expect {NotesApplication.new('Tomiiwo')}.not_to raise_error
#     end
#     it 'adds content of new note to array Notes' do
#       note_obj.create("This is a test message")
#       expect(note_obj.instance_variable_get(notes)).to eql ['This is a test message']
#       expect(note_obj.instance_variable_get(notes)).to eql 1
#       expect {note_obj.create('This is a test message') }.to output("Note has been created.").to_stdout
#     end
#   end

# end




