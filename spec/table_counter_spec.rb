require 'spec_helper'

RSpec.describe 'OoxmlObjectCounter.count_table' do
  it 'single_table.docx' do
    expect(OoxmlObjectCounter.table('spec/table/single_table.docx')).to eq(1)
  end

  it 'table_in_shape.docx' do
    expect(OoxmlObjectCounter.table('spec/table/table_in_shape.docx')).to eq(1)
  end
end
