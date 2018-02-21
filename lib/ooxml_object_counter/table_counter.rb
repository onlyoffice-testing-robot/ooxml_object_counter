# Module for counting tables
module TableCounter
  private

  # Count table in elements
  # @param object with elements
  # @return [Count] tables
  def table_count_element(object)
    counter = 0
    object.elements.each do |element|
      counter += table_count_in_element_list(element.sdt_content) if element.is_a?(OoxmlParser::StructuredDocumentTag)
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
      counter += table_count_in_graphic_data(run)
      counter += table_count_in_element_list(run.shape)
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

  def table_count_in_docx_shape(shape)
    counter = 0
    counter += table_count_in_element_list(shape)
    return counter unless shape.respond_to?(:text_body) && shape.text_body
    shape.text_body.elements.each do |shape_element|
      counter += 1 if shape_element.is_a?(OoxmlParser::Table)
    end
    counter
  end

  def table_count_in_graphic_data(run)
    return 0 unless run.alternate_content
    data = run.alternate_content.office2010_content.graphic.data
    count = 0
    shapes = if data.is_a?(OoxmlParser::ShapesGrouping)
               data.elements
             else
               [data]
             end
    shapes.each do |shape|
      count += table_count_in_docx_shape(shape)
    end
    count
  end

  # @param shape [OoxmlParser::Shape] shape to count
  # @return [Integer] number of tables
  def table_count_in_element_list(shape)
    return 0 unless shape
    counter = 0
    return counter unless shape.respond_to?(:elements)
    return counter if shape.elements.empty?
    shape.elements.each do |shape_element|
      counter += 1 if shape_element.is_a?(OoxmlParser::Table)
    end
    counter
  end
end
