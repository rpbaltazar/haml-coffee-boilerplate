# haml-coffee-boilerplate

Boilerplate for html applications, using haml and coffee.

I enjoy developing my web applications using haml and coffeescript. Usually they all start the same way:

1. setup environment to compile the files to final format
2. setup a watcher to compile automatically based on changes
3. develop

The first two steps are pretty much the same in every other application I develop, so I've come up with this boilerplate that I can just copy and use as my initial setup.

## Quick use

```
rpbaltazar$ git clone git@github.com:rpbaltazar/haml-coffee-boilerplate.git
rpbaltazar$ cd haml-coffee-boilerplate
rpbaltazar$ cd src
rpbaltazar$ npm install
rpbaltazar$ echo 'Hello World' > index.haml
rpbaltazar$ grunt serve
```

This boilerplate assumes that there are a couple of things available in your machine. Please read through to check if you have everything you need.

## NPM

The base of this boilerplate is npm. [https://www.npmjs.com/](NPM) is the package manager for javascript.
I'm using this package manager to get all the development dependencies installed properly (more on the dev dependencies later).

To check if you have npm installed in your machine you can simply open the terminal and type:

```
rpbaltazar$ npm -v
2.1.18
```

In case you don't have npm installed, please take a look at [https://docs.npmjs.com/getting-started/installing-node](NPM's page) and follow their instructions
or if you have [http://brew.sh/](homebrew) you can simply type

```
rpbaltazar$ brew install node
```

## Grunt and dependencies

As I mentioned before, there are a couple of dependencies that need to be installed in the dev environment.
These dependencies are listed in the package.json file that you can find on ./src folder.

You can read a bit more about each one of the dependencies or simply go ahead with the dependencies installation.

```
rpbaltazar$ cd haml-coffee-boilerplate/src
rpbaltazar$ npm install
```

Currently, in order to setup the dev environment we need:

### grunt

Grunt is the javascript task runner. Within this boilerplate, it is used to start the server, listen to changes on your files and compile the needed files.

### grunt-contrib-coffee

Grunt plugin used to compile coffeescript to javascript

### grunt-contrib-connect

Grunt plugin that allows creating a server

### grunt-contrib-copy

Grunt plugin that empowers grunt with file/folder copy capabilities. This is used to copy static assets from the src directory to the final directory.

### grunt-contrib-watch

This Grunt plugin allows to define a group of files/folders to be watched for changes. When properly configured, as soon as a change has been detected, a task can be run.
Within this boilerplate is used to listen to changes of files and trigger the project compilation.

### grunt-haml2html

This Grunt plugin, similarly to grunt-contrib-coffee, allows compiling haml files to pure html. Nevertheless, this plugin has some notes. It needs ruby and haml installed in your machine.
You should have by now ruby installed. You can check by typing in the terminal

```
rpbaltazar$ ruby -v
ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-darwin14]
```

Regarding the other dependency (Haml) you can easily install it by running

```
rpbaltazar$ gem install haml
(...)
Successfully installed haml-4.0.6
Parsing documentation for haml-4.0.6
Done installing documentation for haml after 1 seconds
1 gem installed
```

## Folder structure

This boilerplate expects a specific structure.
If you want to change it, you should explore the Gruntfile.coffee and understand how could you achieve the desired changes.

```
- README.md
|
- src/
  |
  - Gruntfile.coffee
  - node_modules/
  - package.json
  - index.haml
  - css/
    |
    - main.css
  - img/
    |
    - img1.png
    - img2.png
    - img3.png
  - res/
    |
    - data-file.json
  - js/
    |
    - main.coffee
    - massive-code.coffee
```

Once you start the grunt task, the watcher will be looking at index.haml, css, js, img and res folders for changes. Once a change
was detected, it will recompile all the files and get them ready in the root folder of the project (same level as README.md file).
