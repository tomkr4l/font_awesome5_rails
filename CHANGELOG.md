## v 0.4.2
- update FontAwesome to version 5.5.0 (new icons)

## v 0.4.1
- update FontAwesome to version 5.4.1 (new icons)

## v 0.4.0
- update FontAwesome to version 5.3.1
- update project files to correspond with FA filenames

## v 0.3.6
- update FontAwesome to version 5.2.0

## v 0.3.5
- update FontAwesome to version 5.1.1

## v 0.3.4
- update FontAwesome version to 5.1.0
- include fix for getting working with rails 4.2.x thanks to @JNajera [[pull#20](https://github.com/tomkra/font_awesome5_rails/pull/20)]

## v 0.3.3
- update FontAwesome version to 5.0.13
- update parser so tags like ```aria-hidden``` etc. can be used [[#16](https://github.com/tomkra/font_awesome5_rails/issues/16)]
- fix flicker problem after rendering with Turbolinks [[#17](https://github.com/tomkra/font_awesome5_rails/issues/17)]
 
## v 0.3.2
- update FontAwesome version to 5.0.10
- update parser to support symbol notation icon [[#12](https://github.com/tomkra/font_awesome5_rails/issues/12)]
- add support for ```:title ``` [[#15](https://github.com/tomkra/font_awesome5_rails/issues/15)]

## v 0.3.1
- add Rails 5.2.0 support [[#10](https://github.com/tomkra/font_awesome5_rails/issues/10)]
- fix bug that caused icons not showing with turbolinks [[#9](https://github.com/tomkra/font_awesome5_rails/issues/9)]

## v 0.3.0
- update FontAwesome version to 5.0.9
- fixed bug causing that font_awesome5_webfont was not showing in production environment
- automaticly add fa when more params provided [[#5](https://github.com/tomkra/font_awesome5_rails/issues/5)]
- add ```base_type``` option for ```fa_stacked_icon```, so it's now possible to specify icon type for base icon [[#7](https://github.com/tomkra/font_awesome5_rails/issues/7)]

## v 0.2.4

- it's possible to use FontAwesome 5 just as webfont
- you can now use svg icons in your views as images

## v 0.2.2

- add  ```fa_stacked_icon``` helper
- add  ```fa_layered_icon``` helper
- fix ```fa_icon``` size option to change text size too
- change FontAwesome version to 5.0.8
