# Font Awesome 5 Rails
[![Gem Version](https://d25lcipzij17d.cloudfront.net/badge.svg?id=rb&type=6&v=1.1.0&x2=0)](https://badge.fury.io/rb/font_awesome5_rails)
[![FA5 version](https://d25lcipzij17d.cloudfront.net/badge.svg?id=gh&type=6&v=5.13.1&x2=0)](https://github.com/tomkra/font_awesome5_rails/blob/master/lib/font_awesome5_rails/version.rb)
[![Build Status](https://travis-ci.org/tomkra/font_awesome5_rails.svg?branch=master)](https://travis-ci.org/tomkra/font_awesome5_rails)
[![HitCount](http://hits.dwyl.io/tomkra/tomkra/font_awesome5_rails.svg)](http://hrits.dwyl.io/tomkra/tomkra/font_awesome5_rails)

**font_awesome5_rails** provides the [Font-Awesome5](https://fontawesome.com/) web fonts, stylesheets and javascripts as a Rails engine for use with the asset pipeline and with backwards compatibility with [font-awesome-rails](https://github.com/bokmann/font-awesome-rails) gem.

This gem provides only Free icons from Font-Awesome.

Keep track of changes in [Changelog](https://github.com/tomkra/font_awesome5_rails/blob/master/CHANGELOG.md).

## Table of Contents
**[Installation](#installation)** <br />
  - **[Install as webfont with CSS](#install-as-webfont-with-css)** <br />  
  - **[Install as SVG with JS](#install-as-SVG-with-JS)** <br />
  - **[Install with webpack](#install-with-webpack)** <br />
   
**[Usage](#usage)** <br />
  - **[Basic usage](#basic-usage)** <br />
  - **[Solid, Regular, Light, Brand icon types](#solid-regular-light-brand-icon-types)** <br />
  - **[Animations and data attributes](#animations-and-data-attributes)** <br />
  - **[Layered and Stacked icons](#layered-and-stacked-icons)** <br />

**[Use as images](#use-as-images)** <br />
**[FontAwesome 5 Pro icons](#fontawesome-5-pro-icons)** <br />
**[Release notes](#release-notes)** <br />

## Installation
Now you have two options how to include FontAwesome 5 icons. First option is to use ```SVG``` and ```JS``` files which is recommended by FontAwesome team. However you can use icons as ```webfont with CSS``` but you will not be able to use new FA5 features as animations or ```layered_icons```. Choose one installation option from above:

Check out the differences in [here](https://fontawesome.com/how-to-use/on-the-web/setup/getting-started?using=svg-with-js&explain=using).

Add this line to your application's Gemfile:

```ruby
gem 'font_awesome5_rails'
```

### 1. Install as webfont with CSS
In your `application.css`, include the css file:
```css
 *= require font_awesome5_webfont
```
or if you prefer scss add this to your `application.css.scss` file:
```sass
@import 'font_awesome5_webfont';
```

### 2. Install as SVG with JS
In your `application.css`, include the css file:
```css
 *= require font_awesome5
```
or if you prefer scss add this to your `application.scss` file:
```sass
@import 'font_awesome5.css';
```

In your `application.js`, include the javascript file:
```javascript
#= require font_awesome5
```

### 3. Install with webpack
If you want to install Font Awesome with ```yarn``` or ```npm``` and still use helpers from this gem It's possible.

First add Font Awesome to your ```package.json```.
```shell
$ yarn add @fortawesome/fontawesome-free
```

Next import font in your ```app/javascript/packs/application.js```. You can find more about import in [FA pages](https://fontawesome.com/how-to-use/with-the-api/setup/importing-icons).

Now you have icons installed through webpack and still you can use ```fa_icon``` helpers.

## Usage
Gem provides FontAwesome icons through helper. In your views just call `fa_icon`.

### Basic usage
```ruby
fa_icon('camera-retro')
# => <i class="fas fa-camera-retro"></i>

fa_icon('camera-retro', style: 'color: Tomato')
# => <i class="fas fa-camera-retro" style="color:Tomato"></i>

fa_icon('camera-retro', class: 'my-class', text: 'Camera', size: '3x')
# => <i class="fas fa-camera-retro my-class fa-3x"></i>
# =>  <span>Camera</span>

fa_icon(:camera_retro, class: 'my-class')
# => <i class="fas fa-camera-retro my-class"></i>

fa_icon(:camera_retro, text: 'Camera', right: true)
# =>  <span class="fa5-text-r">Camera</span>
# => <i class="fas fa-camera-retro"></i>
```

### Solid, Regular, Light, Brand, Duotone icon types
In Font Awesome 5 there are several different types of icons. In font_awesome5_rails gem default icon type is ```solid```.
If you want to use different icon style you can do this through ```type``` attribute.

| Style         | type: | type:  |
| ------------- |-------|--------|
| Solid         | :fas  |:solid  |
| Regular       | :far  |:regular|
| Light         | :fal  |:light  |
| Brand         | :fab  |:brand  |
| Duotone       | :fad  |:duotone|


```ruby
fa_icon('camera-retro', type: :solid) #Default
# => <i class="fas fa-camera-retro"></i>

fa_icon('camera-retro', type: :regular)
# => <i class="far fa-camera-retro"></i>

fa_icon('camera-retro', type: :light)
# => <i class="fal fa-camera-retro"></i>

fa_icon('camera-retro', type: :brand)
# => <i class="fab fa-camera-retro"></i>

fa_icon('camera-retro', type: :duotone)
# => <i class="fad fa-camera-retro"></i>

fa_icon('camera-retro', type: :fab)
# => <i class="fab fa-camera-retro"></i>

```

Each icon type has its own helper method so you don't need to provide the ```type``` attribute in every call.
Which can be overridden, if it is provided.
```ruby
far_icon('camera-retro')
# => <i class="far fa-camera-retro"></i>

far_icon('camera-retro', type: :fab)
# => <i class="fab fa-camera-retro"></i>

far_stacked_icon('camera', base: 'circle')
# => <span class="fa-stack">
# =>   <i class="far fa-circle fa-stack-2x"></i>
# =>   <i class="far fa-camera fa-stack-1x"></i>
# => </span>

far_stacked_icon('camera', base: 'circle', type: :fal)
# => <span class="fa-stack">
# =>   <i class="fal fa-circle fa-stack-2x"></i>
# =>   <i class="fal fa-camera fa-stack-1x"></i>
# => </span>

```

### Animations and data attributes
FontAwesome 5 provides new animations and data attributes. Here are some examples how to use them:
```ruby
fa_icon('camera-retro', animation: 'spin')
# => <i class="fas fa-camera-retro fa-spin"></i>

fa_icon('camera-retro', data: {'fa-transform': 'rotate-90'})
# => <i class="fas fa-camera-retro" data-fa-transform="rotate-90"></i>

```

In FontAwesome5 the text is right behind icon. For better readability text has defaultly set to ```padding-left: 5px;```. If you want to override this setting, you can do that through ```.fa5-text``` class in css styles.

### Layered and Stacked icons
FontAwesome 5 newly provides layered icons. For backward compatibility there were preserved ```fa_stacked_icon``` helper, but you can acomplish the same result with ```fa_layered_icon```.

#### Layered icon examples
```fa_layered_icon``` takes options and block of code that will be rendered inside.

Following ```fa_layered_icon``` examples are written in ```haml```.
```ruby
= fa_layered_icon do
  = fa_icon 'circle'
# => <span class="fa-layers fa-fw">
# =>   <i class="fas fa-circle"></i>
# => </span>

= fa_layered_icon style: 'background: MistyRose', size: '4x' do
  = fa_icon 'circle', style: 'color: Tomato'
  = fa_icon 'times', class: 'fa-inverse', data: { fa_transform: 'shrink-6' }
# => <div class="fa-4x">
# =>   <span class="fa-layers fa-fw" style="background: MistyRose">
# =>     <i class="fas fa-circle" style="color: Tomato"></i>
# =>     <i class="fas fa-times fa-inverse" data-fa-transform="shrink-6"></i>
# =>   </span>
# => </div>

= fa_layered_icon aligned: :false do
  = fa_icon 'circle'
  %span.fa-layers-text= "Text"
  %span.fa-layers-counter= "1,419"
# => <span class="fa-layers">
# =>   <i class="fas fa-circle"></i>
# =>   <span class="fa-layers-counter">1,419</span>
# => </span>
```

#### Stacked icon examples
For different base icon type you can use ```base_type``` option.
```ruby
fa_stacked_icon('camera', base: 'circle')
# => <span class="fa-stack">
# =>   <i class="fas fa-circle fa-stack-2x"></i>
# =>   <i class="fas fa-camera fa-stack-1x"></i>
# => </span>

fa_stacked_icon('camera inverse', base: 'circle', type: :fas, class: 'my-class') #Default :fas is default type
# => <span class="fa-stack my-class">
# =>   <i class="fas fa-circle fa-stack-2x"></i>
# =>   <i class="fas fa-camera fa-inverse fa-stack-1x"></i>
# => </span>

fa_stacked_icon('camera', base: 'circle', reverse: true, text: 'Text!') #Default: reverse: false
# => <span class="fa-stack">
# =>   <i class="fas fa-circle fa-stack-1x"></i>
# =>   <i class="fas fa-camera fa-stack-2x"></i>
# => </span>Text!

fa_stacked_icon('camera', base: 'circle', type: :fas, base_type: :fab)
# => <span class="fa-stack">
# =>   <i class="fab fa-circle fa-stack-2x"></i>
# =>   <i class="fas fa-camera fa-stack-1x"></i>
# => </span>

```

## Use as images
From version ```0.2.3``` you can include icons as images in your views.
```ruby
image_tag('fa5/solid/camera.svg')
image_tag('fa5/brand/facebook.svg')
image_tag('fa5/regular/bell.svg', width: '100px', class: 'my-img')
```

More examples can be found in specs.

More animation and data attributes can be found on [FontAwesome documentation](https://fontawesome.com/how-to-use/svg-with-js).

## FontAwesome 5 Pro icons
Due to licence policy this gem pack only free FA5 icons. However ```fa_icon``` helper support all types of icons. If you purchased FA5 Pro icons and want to use helpers provided by this gem it's possible.
1. Add this gem to your ```Gemfile``` without including anything to ```application.css``` and ```application.js```.
2. Create a [Kit](https://fontawesome.com/kits) on Font Awesome.
3. Add `= javascript_include_tag "//kit.fontawesome.com/[YOUR-KIT-ID].js"` in the head of your layout(s).
4. You should now be able to use all FA5 Pro icons with helpers provided by this gem.

If you have any questions feel free to create a new issue.

## Release notes
If you're upgrading from ```0.3.x``` version to ```0.4.x```, you might need to change assets version in ```assets.rb```, due to filename changes.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[Font Awesome5 License](https://fontawesome.com/license).
