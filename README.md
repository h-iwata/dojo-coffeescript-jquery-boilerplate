#dojo-coffeescript-jquery-boilerplate

The dojo-coffeescript-jquery-boilerplate is aimed at the best practice for the develop enviroment 
with dojo for baseframework, jquery for dom operation, and coffeescript as languages.

##Quick Start

1. Clone the repository using `git clone https://github.com/h-iwata/dojo-coffeescript-jquery-boilerplate.git`.
2. `cd dojo-coffeescript-jquery-boilerplate/javascripts` for move into the directory, then run `npm install`
3. run `./tools/startCoffeeWatch.sh`, which will compiles demo codes in `./coffee` and place it into the `./src` folder.
4. run `node javascripts/tools/startTestServer.js` for starting test server, then open `localhost:3000/` in your favorite browser. See how the HelloDojoButton works. 
5. Develop your project in `./coffee` until it is amazing.
6. run `./tools/build/startBuild.sh`, which will create an awesome optimised build in the `./release` directory.
8. Upload `/javascripts/release` and `/javascripts/config.js` for millions of people the world over to enjoy.
9. Hapyness.

##Features
* The dojo toolkit via CDN (the dojo files in your local directory are only used for build and test).
* Custormized build script from [dojo-boilerplate](https://github.com/csnover/dojo-boilerplate), 
    which build app in a release folder, delete .uncompressed files, and remove dojo local files in the directory, then rewrite config.js to remove debug mode.
* Light weight node server for test run.
* TDD!

## How you create new pages from this?
To be optimized build, you should create a controller in a page as a main script. 
In the controller, require all Widgets used in the page .
then add the controller name to `/tools/build/profile.js` as follows
```
layers: {
	'App/Controllers/Index' :{},
	'App/Controllers/#{createdControllerName}' :{},`
},
```
After build, you will see all modules required in a controller is now complessed into a single controller file.
but you don't have to change any codes.

## Depandencies
* node.js
* perl

## Contributing
Anyone is welcome.
