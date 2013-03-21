#dojo-coffeescript-jquery-boilerplate

The dojo-coffeescript-jquery-boilerplate is aimed at the best practice for the develop enviroment 
with dojo for baseframework, jquery for dom operation, and coffeescript as languages.

##Quick Start

1. Clone the repository using `git clone --recursive git://github.com/h-iwata/dojo-coffeescript-jquery-boilerplate.git` at your `js` or `javascript` directory.
2. `chmod u+x ./tools/startCoffeeWatch.sh` then run `./tools/startCoffeeWatch.sh`, which compiles test codes to `/src` from `/coffee`.
3. Open `/test/index.html` in your favorite browser (I recommend opera) and see how it works. 
4. Develop your project in `/coffee` until it is amazing.
5. `chmod u+x ./tools/build/startbuild.sh` then run `/tools/build/startBuild.sh`, which will create an awesome optimised build in `/release` directory.
6. Open `/config.js` and change a line from `var debug = true;` to `var debug = false;`.
7. Upload `/release` for millions of people the world over to enjoy.
8. Hapyness.

##Features
* The dojo toolkit via CDN (dojo files in your local directory are only used for build).
* The latest jQuery via CDN.
* Custormized build script from [dojo-dojo-boilerplate](https://github.com/csnover/dojo-boilerplate), which build app in a release folder, delete .uncompressed files, and remove dojo local files in the directory.

## How you create new pages from this?
To be optimized build, you should create a controller in a page as a main script,
require all Widgets used in the page in the controller,
then add the Controller in /tools/build/profile.js to build
```
layers: {
	'App/Controllers/Index' :{},
	'App/Controllers/#{createdControllerName}' :{},`
},
```
After build, you will see all modules used by the Widgets is included in the controller file.

## How you change Base path?
change dojoConfig.baseUrl in config.js

## How you rename "App" to your app name?

Rename the following line.
* `var AppName = "App"` /config.js
* `var AppName = "App"` /tools/build/config.js
* `'App/Controllers/Index' :{},` /tools/build/profile.js

Rename The following directory name.
* coffee/App 
* src/App

That's all.

## Contributing
Anyone is welcome.
