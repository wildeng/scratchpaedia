require 'rails_helper'
describe ApplicationHelper do
  context 'when flash message' do
    def perform(flash_type)
      bootstrap_class_for(flash_type)
    end

    it 'gets success class' do
      expect(perform('success')).to eq('alert-success')
    end

    it 'gets alert class' do
      expect(perform('alert')).to eq('alert-warning')
    end

    it 'gets notice class' do
      expect(perform('notice')).to eq('alert-info')
    end

    it 'gets error class' do
      expect(perform('error')).to eq('alert-danger')
    end
  end

  context 'when markdown context' do
    describe 'markdown content' do
      let(:content) { '**asterisks**' }

      it 'returns formatted text' do
        result = markdown(content)
        expect(result).to eq("<p><strong>asterisks</strong></p>\n")
      end

      it 'it does not return html when content is html' do
        result = markdown('<h1>foo</h1>')
        expect(result).to eq("<p>foo</p>\n")
      end
    end
  end
end
