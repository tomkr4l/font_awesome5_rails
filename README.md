# FontAwesome5Rails
[![HitCount](http://hits.dwyl.io/tomkra/tomkra/font_awesome5_rails.svg)](http://hits.dwyl.io/tomkra/tomkra/font_awesome5_rails)

font_awesome5_rails provides the [Font-Awesome5](https://fontawesome.com/) web fonts, stylesheets and javascripts as a Rails engine for use with the asset pipeline and with backwards compatibility with [font-awesome-rails](https://github.com/bokmann/font-awesome-rails) gem.

This gem provides only Free icons from Font-Awesome.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'font_awesome5_rails'
```

In your `application.css`, include the css file:
```css
 *= require font_awesome5
```
or if you prefer scss add this to your `application.css.scss` file:
```sass
@import 'font_awesome5';
```

In your `application.js`, include the javascript file:
```javascript
#= require font_awesome5
```

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
```

### Solid, Regular, Light, Brand icon types
In Font Awesome 5 there are several different types of icons. In font_awesome5_rails gem default icon type is ```solid```.
If you want to use different icon style you can do this through ```type``` attribute.

| Style         | type: | type:  |
| ------------- |-------|--------|
| Solid         | :fas  |:solid  |
| Regular       | :far  |:regular|
| Light         | :fal  |:light  |
| Brand         | :fab  |:brand  | 


```ruby
fa_icon('camera-retro', type: :solid) #Default
# => <i class="fas fa-camera-retro"></i>
 
fa_icon('camera-retro', type: :regular)
# => <i class="far fa-camera-retro"></i>
  
fa_icon('camera-retro', type: :light)
# => <i class="fal fa-camera-retro"></i>
 
fa_icon('camera-retro', type: :brand)
# => <i class="fab fa-camera-retro"></i>
     
fa_icon('camera-retro', type: :fab)
# => <i class="fab fa-camera-retro"></i>
     
```  

### Animations and data attributes
FontAwesome 5 provides new animations and data attributes. Here are some examples how to use them:
```ruby
fa_icon('camera-retro', animation: 'spin')
# => <i class="fas fa-camera-retro fa-spin"></i>
 
fa_icon('camera-retro', data: {'fa-transform': 'rotate-90'})
# => <i class="fas fa-camera-retro" data-fa-transform="rotate-90"></i>

```

More animation and data attributes can be found on [FontAwesome documentation](https://fontawesome.com/how-to-use/svg-with-js).

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[Font Awesome5 License](https://fontawesome.com/license).
