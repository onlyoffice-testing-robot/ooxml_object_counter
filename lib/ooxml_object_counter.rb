require 'ooxml_parser'
require 'ooxml_object_counter/table_counter'
require 'ooxml_object_counter/version'

# Module to count object in ooxml structure
module OoxmlObjectCounter
  extend TableCounter

  # Count tables in document
  # @param file [String] path to file
  # @return [Integer] count of table in docx
  def self.table(file)
    object_count = 0
    docx = OoxmlParser::Parser.parse(file)
    object_count += table_count_element(docx)

    docx.notes.each do |note|
      object_count += table_count_element(note)
    end
    object_count
  end
end
