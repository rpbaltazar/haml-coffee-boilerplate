module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      coffee_to_js:
        expand: true
        flatten: false
        cwd: "./js"
        src: ["**/*.coffee"]
        dest: '../js'
        ext: ".js"
    haml:
      dist:
        files:
          '../index.html': 'index.haml'

    copy:
      main:
        expand: true
        cwd: ''
        src: ['./css/*', './img/*']
        dest: '../'

    watch:
      coffee:
        files: ["./js/**/*.coffee"]
        tasks: ["compile:coffee"]
      haml:
        files: ["./index.haml"]
        tasks: ["compile:haml"]
      static:
        files: ['./res/*', './css/*', './img/*']
        tasks: ["compile:copy"]

    connect:
      server:
        options:
          port: 8000
          base: '../'

  #Load Tasks
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-haml2html'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.registerTask 'compile', ['coffee', 'haml', 'copy']
  grunt.registerTask 'server', ['connect:server', 'watch']
