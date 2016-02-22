require_relative '../lib/NotesApplication'
require 'spec_helper'

# notes = NotesApplication.new('Tomiiwo')
# subject(:notes) {Note::NotesApplication}
# subject(:note_obj) {notes.new('Tomiiwo') }

RSpec.describe Note::NotesApplication do
  subject(:notes) { Note::NotesApplication }
  subject(:note_obj) {notes.new('Tomiiwo') }

   describe '#initialize' do
    it 'returns an Instance of the class NotesApplication' do
      expect(NotesApplication.new('Tomiiwo')).to be_an_instance_of NotesApplication
    end
    it 'accepts only one argument' do
      expect {NotesApplication.new}.to raise_error ArgumentError
      expect {NotesApplication.new('Tomiiwo','Abosede')}.to raise_error ArgumentError
      expect {NotesApplication.new('Tomiiwo')}.not_to raise_error
    end
  end
  describe '#create' do
    it 'accepts only one argument' do
      expect {NotesApplication.new}.to raise_error ArgumentError
      expect {NotesApplication.new('Tomiiwo','Abosede')}.to raise_error ArgumentError
      expect {NotesApplication.new('Tomiiwo')}.not_to raise_error
    end
    it 'adds content of new note to array Notes' do
      note_obj.create("This is a test message")
      expect(note_obj.instance_variable_get(notes)).to eql ['This is a test message']
      expect(note_obj.instance_variable_get(notes)).to eql 1
      expect {note_obj.create('This is a test message') }.to output("Note has been created.").to_stdout
    end
  end
end



