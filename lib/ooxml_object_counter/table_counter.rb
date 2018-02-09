# Module for counting tables
module TableCounter
  private

  # Count table in elements
  # @param object with elements
  # @return [Count] tables
  def table_count_element(object)
    counter = 0
    object.elements.each do |element|
      counter += table_count_paragraph(element) if element.is_a?(OoxmlParser::DocxParagraph)
      counter += table_count_table(element) if element.is_a?(OoxmlParser::Table)
    end
    counter
  end

  # Count table in paragraph
  # @param paragraph [OoxmlParser::DocxParagraph] paragraph to count
  # @return [Integer] count of table
  def table_count_paragraph(paragraph)
    counter = 0
    paragraph.nonempty_runs.each do |run|
      next if run.is_a?(OoxmlParser::DocxFormula)
      next unless run.alternate_content
      text_body = run.alternate_content.office2010_content.graphic.data.text_body
      next unless text_body
      text_body.elements.each do |shape_element|
        counter += 1 if shape_element.is_a?(OoxmlParser::Table)
      end
    end
    counter
  end

  # Count table in table
  # @param table [OoxmlParser::Table] table to count
  # @return [Integer] count of table
  def table_count_table(table)
    counter = 1
    table.rows.each do |row|
      row.cells.each do |cell|
        counter += table_count_element(cell)
      end
    end
    counter
  end
end
