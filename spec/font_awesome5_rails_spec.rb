require 'spec_helper'

describe FontAwesome5Rails do
  include RSpecHtmlMatchers
  include ActionView::Context

  describe 'files' do
    it 'should have correct dirs' do
      expect(Dir.exists?('./app/assets/images')).to be_truthy
      expect(Dir.exists?('./app/assets/javascripts')).to be_truthy
      expect(Dir.exists?('./app/assets/stylesheets')).to be_truthy
      expect(Dir.exists?('./app/helpers/font_awesome/rails')).to be_truthy
    end

    it 'should have correct files' do
      expect(File.exists?('./app/helpers/font_awesome/rails/icon_helper.rb')).to be_truthy
      expect(File.exists?('./app/assets/images/fa-brands.svg')).to be_truthy
      expect(File.exists?('./app/assets/images/fa-regular.svg')).to be_truthy
      expect(File.exists?('./app/assets/images/fa-solid.svg')).to be_truthy
      expect(File.exists?('./app/assets/javascripts/font_awesome5.js')).to be_truthy
      expect(File.exists?('./app/assets/javascripts/fontawesome-all.min.js')).to be_truthy
      expect(File.exists?('./app/assets/stylesheets/fa-svg-with-js.css')).to be_truthy
      expect(File.exists?('./app/assets/stylesheets/font_awesome5.css')).to be_truthy
    end
  end

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