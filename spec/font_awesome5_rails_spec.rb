require 'spec_helper'

describe FontAwesome5Rails do
  include RSpecHtmlMatchers
  include ActionView::Context

  describe 'files' do
    it 'should have correct dirs' do
      expect(Dir.exists?('./app/assets/images')).to be_truthy
      expect(Dir.exists?('./app/assets/images/fa5/brands')).to be_truthy
      expect(Dir.exists?('./app/assets/images/fa5/regular')).to be_truthy
      expect(Dir.exists?('./app/assets/images/fa5/solid')).to be_truthy
      expect(Dir.exists?('./app/assets/javascripts')).to be_truthy
      expect(Dir.exists?('./app/assets/stylesheets')).to be_truthy
      expect(Dir.exists?('./app/helpers/font_awesome5/rails')).to be_truthy
    end

    it 'should have correct files' do
      expect(File.exists?('./app/helpers/font_awesome5/rails/icon_helper.rb')).to be_truthy
      expect(File.exists?('./app/assets/javascripts/font_awesome5.js')).to be_truthy
      expect(File.exists?('./app/assets/javascripts/all.min.js')).to be_truthy
      expect(File.exists?('./app/assets/stylesheets/svg-with-js.min.css')).to be_truthy
      expect(File.exists?('./app/assets/stylesheets/font_awesome5.css')).to be_truthy
      expect(File.exists?('./app/assets/stylesheets/all.scss')).to be_truthy
      expect(File.exists?('./app/assets/stylesheets/font_awesome5_webfont.scss')).to be_truthy
      expect(File.exists?('./lib/font_awesome5_rails/engine.rb')).to be_truthy
      expect(File.exists?('./lib/font_awesome5_rails/version.rb')).to be_truthy
      expect(File.exists?('./lib/font_awesome5_rails/parsers/fa_icon_parser.rb')).to be_truthy
      expect(File.exists?('./lib/font_awesome5_rails/parsers/fa_layered_icon_parser.rb')).to be_truthy
      expect(File.exists?('./lib/font_awesome5_rails/parsers/fa_stacked_icon_parser.rb')).to be_truthy
      expect(File.exists?('./lib/font_awesome5_rails/parsers/parse_methods.rb')).to be_truthy
    end
  end

  %w(fa_icon fa5_icon).each do |method|
    describe "#{method} tags" do
      it 'should return correct type tags' do
        expect(send method, 'camera-retro').to eq '<i class="fas fa-camera-retro"></i>'
        expect(send method, 'camera-retro fw').to eq '<i class="fas fa-camera-retro fa-fw"></i>'
        expect(send method, 'camera-retro', type: :fas).to eq '<i class="fas fa-camera-retro"></i>'
        expect(send method, 'camera-retro', type: :far).to eq '<i class="far fa-camera-retro"></i>'
        expect(send method, 'camera-retro', type: :fal).to eq '<i class="fal fa-camera-retro"></i>'
        expect(send method, 'camera-retro', type: :fab).to eq '<i class="fab fa-camera-retro"></i>'
        expect(send method, 'camera-retro', type: :fad).to eq '<i class="fad fa-camera-retro"></i>'
        expect(send method, 'camera-retro', type: :solid).to eq '<i class="fas fa-camera-retro"></i>'
        expect(send method, 'camera-retro', type: :regular).to eq '<i class="far fa-camera-retro"></i>'
        expect(send method, 'camera-retro', type: :light).to eq '<i class="fal fa-camera-retro"></i>'
        expect(send method, 'camera-retro', type: :brand).to eq '<i class="fab fa-camera-retro"></i>'
        expect(send method, 'camera-retro', type: :duotone).to eq '<i class="fad fa-camera-retro"></i>'
      end

      it 'should return correct class tags' do
        expect(send method, 'camera-retro').to eq '<i class="fas fa-camera-retro"></i>'
        expect(send method, 'camera-retro', class: 'test').to eq '<i class="fas fa-camera-retro test"></i>'
        expect(send method, 'camera-retro', class: 'fa-camera-retro').to eq '<i class="fas fa-camera-retro"></i>'
      end

      it 'should return correct size tags' do
        expect(send method, 'camera-retro', size: '3x').to eq '<i class="fas fa-camera-retro fa-3x"></i>'
        expect(send method, 'camera-retro', class: 'fa-3x', size: '3x').to eq '<i class="fas fa-camera-retro fa-3x"></i>'
        expect(send method, 'camera-retro', size: '3x 2x').to eq '<i class="fas fa-camera-retro fa-3x fa-2x"></i>'
      end

      it 'should return correct animation tags' do
        expect(send method, 'camera-retro', animation: 'spin').to eq '<i class="fas fa-camera-retro fa-spin"></i>'
        expect(send method, 'camera-retro', class: 'fa-spin', animation: 'spin').to eq '<i class="fas fa-camera-retro fa-spin"></i>'
        expect(send method, 'camera-retro', animation: 'spin cog').to eq '<i class="fas fa-camera-retro fa-spin fa-cog"></i>'
      end

      it 'should return correct style tags' do
        expect(send method, 'camera-retro', style: 'color: Tomato;').to eq '<i class="fas fa-camera-retro" style="color: Tomato;"></i>'
      end

      it 'should return correct data tags' do
        expect(send method, 'camera-retro', data: {'fa-transform': 'rotate-90'}).to eq '<i class="fas fa-camera-retro" data-fa-transform="rotate-90"></i>'
        expect(send method, 'camera-retro', data: {fa_transform: 'rotate-90'}).to eq '<i class="fas fa-camera-retro" data-fa-transform="rotate-90"></i>'
      end

      it 'should return correct text tags' do
        expect(send method, 'camera-retro', text: 'Camera').to have_tag('i', with: { class: 'fas fa-camera-retro'})
        expect(send method, 'camera-retro', text: 'Camera').to have_tag('span', text: 'Camera')
        expect(send method, 'camera-retro', text: 'Camera', style: 'color: Tomato;').to have_tag('span', text: 'Camera', with: {style: 'color: Tomato;'})
        expect(send method, 'camera-retro', text: 'Camera', size: '3x').to have_tag('span', text: 'Camera', with: {class: 'fa5-text fa-3x'})
      end

      it 'should return correct tags with symbols' do
        expect(send method, :facebook, type: :brand).to eq '<i class="fab fa-facebook"></i>'
        expect(send method, :camera_retro, type: :duotone).to eq '<i class="fad fa-camera-retro"></i>'
        expect(send method, :camera_retro).to eq '<i class="fas fa-camera-retro"></i>'
        expect(send method, [:camera_retro, :circle]).to eq '<i class="fas fa-camera-retro fa-circle"></i>'
      end

      it 'should return correct title tags' do
        expect(send method, 'camera-retro', title: 'camera-title').to eq '<i class="fas fa-camera-retro" title="camera-title"></i>'
        expect(send method, 'camera-retro', text: 'Camera', title: 'camera-title').to eq '<i class="fas fa-camera-retro" title="camera-title"></i><span class="fa5-text">Camera</span>'
      end

      it 'should return correct all tags' do
        expect(send method, 'camera-retro', test: 'test').to eq '<i class="fas fa-camera-retro" test="test"></i>'
        expect(send method, 'camera-retro', 'aria-hidden': true).to eq '<i class="fas fa-camera-retro" aria-hidden="true"></i>'
        expect(send method, 'camera-retro', aria: {hidden: true}).to eq '<i class="fas fa-camera-retro" aria-hidden="true"></i>'
      end

      it 'should return tags with text on right side' do
        expect(send method, 'camera-retro', text: 'Camera', right: true).to eq '<span class="fa5-text-r">Camera</span><i class="fas fa-camera-retro"></i>'
      end
    end
  end

  %w(fa_stacked_icon fa5_stacked_icon).each do |method|
    describe "#{method} tags" do
      it 'should return correct tags' do
        expect(send method, 'camera', base: 'circle')
            .to eq '<span class="fa-stack"><i class="fas fa-circle fa-stack-2x"></i><i class="fas fa-camera fa-stack-1x"></i></span>'

        expect(send method, 'camera inverse', base: 'circle')
            .to eq '<span class="fa-stack"><i class="fas fa-circle fa-stack-2x"></i><i class="fas fa-camera fa-inverse fa-stack-1x"></i></span>'

        expect(send method, 'camera inverse', base: 'circle inverse')
            .to eq '<span class="fa-stack"><i class="fas fa-circle fa-inverse fa-stack-2x"></i><i class="fas fa-camera fa-inverse fa-stack-1x"></i></span>'

        expect(send method, 'camera', base: 'circle', type: :far, reverse: false)
            .to eq '<span class="fa-stack"><i class="far fa-circle fa-stack-2x"></i><i class="far fa-camera fa-stack-1x"></i></span>'

        expect(send method, 'camera', base: 'circle', reverse: true)
            .to eq '<span class="fa-stack"><i class="fas fa-camera fa-stack-1x"></i><i class="fas fa-circle fa-stack-2x"></i></span>'

        expect(send method, 'camera', base: 'circle', text: 'Text!')
            .to eq '<span class="fa-stack"><i class="fas fa-circle fa-stack-2x"></i><i class="fas fa-camera fa-stack-1x"></i></span>Text!'

        expect(send method, 'camera', base: 'circle', type: :fas, base_type: :far, reverse: true)
            .to eq '<span class="fa-stack"><i class="fas fa-camera fa-stack-1x"></i><i class="far fa-circle fa-stack-2x"></i></span>'

        expect(send method, 'camera', base: 'circle', type: :far, base_type: :fas, reverse: true)
            .to eq '<span class="fa-stack"><i class="far fa-camera fa-stack-1x"></i><i class="fas fa-circle fa-stack-2x"></i></span>'
      end

      it 'should return correct tags with symbols' do
        expect(send method, [:camera, :inverse], base: :circle)
            .to eq '<span class="fa-stack"><i class="fas fa-circle fa-stack-2x"></i><i class="fas fa-camera fa-inverse fa-stack-1x"></i></span>'
        expect(send method, :camera, base: :circle, type: :far, reverse: false)
            .to eq '<span class="fa-stack"><i class="far fa-circle fa-stack-2x"></i><i class="far fa-camera fa-stack-1x"></i></span>'
      end

      it 'should return correct tags with title' do
        expect(send method, [:camera, :inverse], base: :circle, title: 'Camera')
            .to eq '<span class="fa-stack" title="Camera"><i class="fas fa-circle fa-stack-2x"></i><i class="fas fa-camera fa-inverse fa-stack-1x"></i></span>'
      end
    end
  end

  describe 'fa_layered_icon tags' do
    it 'should return correct tags' do
      expect(fa_layered_icon{ fa_icon 'circle'}).to eq '<span class="fa-layers fa-fw"><i class="fas fa-circle"></i></span>'
      expect(fa_layered_icon(aligned: true){ fa_icon 'circle' }).to eq '<span class="fa-layers fa-fw"><i class="fas fa-circle"></i></span>'
      expect(fa_layered_icon(aligned: false){ fa_icon 'circle' }).to eq '<span class="fa-layers"><i class="fas fa-circle"></i></span>'
      expect(fa_layered_icon(class: 'test'){ fa_icon 'circle' }).to eq '<span class="fa-layers fa-fw test"><i class="fas fa-circle"></i></span>'

      expect(fa_layered_icon(size: '3x'){ fa_icon 'circle' })
          .to eq '<div class="fa-3x"><span class="fa-layers fa-fw"><i class="fas fa-circle"></i></span></div>'

      expect(fa_layered_icon(style: 'background: MistyRose'){ fa_icon 'circle' })
          .to eq '<span class="fa-layers fa-fw" style="background: MistyRose"><i class="fas fa-circle"></i></span>'


      expect(
        fa_layered_icon do
          (fa_icon 'circle') + (fa_icon 'times')
        end
      ).to eq '<span class="fa-layers fa-fw"><i class="fas fa-circle"></i><i class="fas fa-times"></i></span>'
    end

    it 'should return correct tags with title' do
      expect(fa_layered_icon(style: 'background: MistyRose', title: 'LayeredIcon'){ fa_icon 'circle' })
          .to eq '<span class="fa-layers fa-fw" title="LayeredIcon" style="background: MistyRose"><i class="fas fa-circle"></i></span>'
    end
  end

  describe '[fas, far, fal, fab, fad, far_stacked_icon]_icon helper method' do
    %w(fas far fal fab fad).each do |type|
      it "#{type}_icon should be defined and use the right icon type" do
        method = :"#{type}_icon"

        expect(self).to respond_to(method)
        expect(send(method, 'camera-retro')).to eq "<i class=\"#{type} fa-camera-retro\"></i>"
        expect(send(method, 'camera-retro', type: :fal)).to eq "<i class=\"fal fa-camera-retro\"></i>"
        expect(send(method, 'camera-retro', type: :brand, class: 'test')).to eq "<i class=\"fab fa-camera-retro test\"></i>"
      end
    end
  end

  describe '[fas, far, fal, fab, fad]_stacked_icon helper method' do
    %w(fas far fal fab).each do |type|
      it "#{type}_stacked_icon should be defined and use the right icon type" do
        method = :"#{type}_stacked_icon"

        expect(self).to respond_to(method)

        expect(send(method, 'camera', base: 'circle'))
          .to eq "<span class=\"fa-stack\"><i class=\"#{type} fa-circle fa-stack-2x\"></i><i class=\"#{type} fa-camera fa-stack-1x\"></i></span>"

        expect(send(method, 'camera', base: 'circle', type: :fal))
          .to eq '<span class="fa-stack"><i class="fal fa-circle fa-stack-2x"></i><i class="fal fa-camera fa-stack-1x"></i></span>'

        expect(send(method, 'camera', base: 'circle', type: :brand, reverse: false))
          .to eq '<span class="fa-stack"><i class="fab fa-circle fa-stack-2x"></i><i class="fab fa-camera fa-stack-1x"></i></span>'
      end
    end
  end

end
