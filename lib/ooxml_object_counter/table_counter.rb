# Module for counting tables
module TableCounter
  private

  # Count table in paragraph
  # @param paragraph [OoxmlParser::DocxParagraph] paragraph to count
  # @return [Integer] count of elements
  def table_count_paragraph(paragraph)
    counter = 0
    return 1 if paragraph.is_a?(OoxmlParser::Table)
    paragraph.nonempty_runs.each do |run|
      run.alternate_content.office2010_content
         .graphic.data.text_body
         .elements.each do |shape_element|
        counter += 1 if shape_element.is_a?(OoxmlParser::Table)
      end
    end
    counter
  end
end
