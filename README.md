#dojo-coffeescript-jquery-boilerplate
====================================================

##About the boilerplate
---------------------
The dojo-coffeescript-jquery-boilerplate is aimed at the best practice for the develop enviroment 
with dojo for baseframework, jquery for dom operation, and coffeescript as languages.

##Quick Start
---------------------

1. Clone the repository using `git clone --recursive`.
2. Run `resouces/js/tools/startCoffeeWatch.sh`, which compiles test codes to `resources/js/src/` from `resources/js/coffee/`.
3. Open `index.html` in your favorite browser (I recommend opera) and see how it works. 
4. Develop your project in `coffee/` until it is amazing.
5. Run `resources/js/tools/build/startBuild.sh`, which will create an awesome optimised build in `release/`.
6. switch the config.js directory from `<script type="text/javascript" src="/resources/js/src/config.js"></script>` to `<script type="text/javascript" src="/resources/js/release/config.js"></script>`
7. Upload `release/` for millions of people the world over to enjoy.
8. Hapyness.

##Features
* The dojo toolkit via CDN (dojo in local files is only for build).
* The latest jQuery via CDN.
* Custormized build script from [dojo-dojo-boilerplate](https://github.com/csnover/dojo-boilerplate), which build app in a release folder, delete .uncompressed files, place config.js and remove dojo local files in the directory.

## How you create new pages from this?
Create new Controller in the Controllers directory.
Require all modules that are used in the page. 
Add the Controller Name in resources/js/tools/build/profile.js 
```
layers: {
	'App/Controllers/Index' :{},
	'App/Controllers/#{createdControllerName}' :{},` //like this
},
```

## How you rename "App" to your app name? Where is?
The following file name
* src/App/App.profile.js
The following line
* `"dojoBuild": "App.profile.js"` src/App/package.json 
* `var AppName = "App"` src/config.js
* `var AppName = "App"` tools/build/config.js
* `var AppName = 'App'` tools/build/release.config.js
* `'App/Controllers/Index' :{},` tools/build/profile.js
The following directory name
* coffee/App 
* src/App
That's all! (I know the places are too many)

## Contributing
Anyone is welcome. 











