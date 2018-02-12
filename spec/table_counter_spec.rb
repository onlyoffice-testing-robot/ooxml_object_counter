require 'spec_helper'

RSpec.describe 'OoxmlObjectCounter.count_table' do
  it 'single_table.docx' do
    expect(OoxmlObjectCounter.table('spec/table/single_table.docx')).to eq(1)
  end

  it 'table_in_shape.docx' do
    expect(OoxmlObjectCounter.table('spec/table/table_in_shape.docx')).to eq(1)
  end

  it 'table_in_table.docx' do
    expect(OoxmlObjectCounter.table('spec/table/table_in_table.docx')).to eq(2)
  end

  it 'table_with_shape.docx' do
    expect(OoxmlObjectCounter.table('spec/table/table_with_shape.docx')).to eq(1)
  end

  it 'table_without_shape.docx' do
    expect(OoxmlObjectCounter.table('spec/table/table_without_shape.docx')).to eq(1)
  end

  it 'table_with_table_note.docx' do
    expect(OoxmlObjectCounter.table('spec/table/table_with_table_note.docx')).to eq(3)
  end

  it 'text_with_formulas.docx' do
    expect(OoxmlObjectCounter.table('spec/table/text_with_formulas.docx')).to eq(2)
  end

  it 'table_in_file_with_shape_grouping.docx' do
    expect(OoxmlObjectCounter.table('spec/table/table_in_file_with_shape_grouping.docx')).to eq(1)
  end
end
