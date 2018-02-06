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
end
