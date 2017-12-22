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
    docx.elements.each do |element|
      object_count += table_count_paragraph(element)
    end
    object_count
  end
end
