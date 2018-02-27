require 'spec_helper'

describe FontAwesome5Rails do
  include RSpecHtmlMatchers
  include ActionView::Context

  describe 'tags' do
    it 'should return correct type tags' do
      expect(fa_icon 'camera-retro').to eq '<i class="fas fa-camera-retro"></i>'
      expect(fa_icon 'camera-retro', type: :fas).to eq '<i class="fas fa-camera-retro"></i>'
      expect(fa_icon 'camera-retro', type: :far).to eq '<i class="far fa-camera-retro"></i>'
      expect(fa_icon 'camera-retro', type: :fal).to eq '<i class="fal fa-camera-retro"></i>'
      expect(fa_icon 'camera-retro', type: :fab).to eq '<i class="fab fa-camera-retro"></i>'
    end

    it 'should return correct class tags' do
      expect(fa_icon 'camera-retro').to eq '<i class="fas fa-camera-retro"></i>'
      expect(fa_icon('camera-retro', class: 'test')).to eq '<i class="fas fa-camera-retro test"></i>'
      expect(fa_icon('camera-retro', class: 'fa-camera-retro')).to eq '<i class="fas fa-camera-retro"></i>'
    end

    it 'should return correct size tags' do
      expect(fa_icon 'camera-retro', size: '3x').to eq '<i class="fas fa-camera-retro fa-3x"></i>'
      expect(fa_icon 'camera-retro', class: 'fa-3x', size: '3x').to eq '<i class="fas fa-camera-retro fa-3x"></i>'
      expect(fa_icon 'camera-retro', size: '3x 2x').to eq '<i class="fas fa-camera-retro fa-3x fa-2x"></i>'
    end

    it 'should return correct animation tags' do
      expect(fa_icon 'camera-retro', animation: 'spin').to eq '<i class="fas fa-camera-retro fa-spin"></i>'
      expect(fa_icon 'camera-retro', class: 'fa-spin', animation: 'spin').to eq '<i class="fas fa-camera-retro fa-spin"></i>'
      expect(fa_icon 'camera-retro', animation: 'spin cog').to eq '<i class="fas fa-camera-retro fa-spin fa-cog"></i>'
    end

    it 'should return correct style tags' do
      expect(fa_icon 'camera-retro', style: 'color: Tomato;').to eq '<i class="fas fa-camera-retro" style="color: Tomato;"></i>'
    end

    it 'should return correct data tags' do
      expect(fa_icon 'camera-retro', data: {'fa-transform': 'rotate-90'}).to eq '<i class="fas fa-camera-retro" data-fa-transform="rotate-90"></i>'
      expect(fa_icon 'camera-retro', data: {fa_transform: 'rotate-90'}).to eq '<i class="fas fa-camera-retro" data-fa-transform="rotate-90"></i>'
    end

    it 'should return correct text tags' do
      expect(fa_icon 'camera-retro', text: 'Camera').to have_tag('i', with: { class: 'fas fa-camera-retro'})
      expect(fa_icon 'camera-retro', text: 'Camera').to have_tag('span', text: 'Camera')
      expect(fa_icon 'camera-retro', text: 'Camera', style: 'color: Tomato;').to have_tag('span', text: 'Camera', with: {style: 'padding-left: 5px;color: Tomato;'})
    end
  end
  
end