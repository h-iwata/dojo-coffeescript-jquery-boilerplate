#dojo-coffeescript-jquery-boilerplate

The dojo-coffeescript-jquery-boilerplate is aimed at the best practice for the develop enviroment 
with dojo for baseframework, jquery for dom operation, and coffeescript as languages.

##Quick Start

1. Clone the repository using `git clone --recursive`.
2. Run `resouces/js/tools/startCoffeeWatch.sh`, which compiles test codes to `resources/js/src/` from `resources/js/coffee/`.
3. Open `index.html` in your favorite browser (I recommend opera) and see how it works. 
4. Develop your project in `coffee/` until it is amazing.
5. Run `resources/js/tools/build/startBuild.sh`, which will create an awesome optimised build in `release/`.
6. switch the config.js directory from `<script type="text/javascript" src="/resources/js/src/config.js"></script>` to `<script type="text/javascript" src="/resources/js/release/config.js"></script>`
7. Upload `release/` for millions of people the world over to enjoy.
8. Hapyness.

##Features
* The dojo toolkit via CDN (dojo files in your local directory are only used for build).
* The latest jQuery via CDN.
* Custormized build script from [dojo-dojo-boilerplate](https://github.com/csnover/dojo-boilerplate), which build app in a release folder, delete .uncompressed files, place config.js and remove dojo local files in the directory.

## How you create new pages from this?
To be optimized build, you should create a controller in a page as a main script,
require all Widgets used in the page in the controller,
then add the Controller in resources/js/tools/build/profile.js to build
```
layers: {
	'App/Controllers/Index' :{},
	'App/Controllers/#{createdControllerName}' :{},`
},
```
After build, you will see all modules used by the Widgets is included in the controller file.

## How you rename "App" to your app name?

Rename the following line.
	`var AppName = "App"` src/config.js
	`var AppName = "App"` tools/build/config.js
	`var AppName = 'App'` tools/build/release.config.js
	`'App/Controllers/Index' :{},` tools/build/profile.js

Rename The following directory name.
	coffee/App 
	src/App

That's all! (I know the places are too many).

## Contributing
Anyone is welcome. 
