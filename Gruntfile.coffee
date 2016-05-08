module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      dist:
        expand: true
        flatten: false
        cwd: "src/js"
        src: ["**/*.coffee"]
        dest: 'build/js'
        ext: ".js"
      spec:
        expand: true
        flatten: false
        cwd: 'spec/js'
        src: ["**/*.coffee"]
        dest: 'build/js'
        ext: '.js'

    haml:
      dist:
        files:
          'build/index.html': 'src/index.haml'

    copy:
      main:
        expand: true
        cwd: ''
        src: ['./css/*', './img/*']
        dest: '../'
      spec:
        files:
          'build/js/lib/jasmine-jquery.js': 'node_modules/jasmine-jquery/lib/jasmine-jquery.js'

    jasmine:
      spec:
        src: 'build/**/main.js'
        options:
          specs: 'build/js/**/*-spec.js'
          vendor: [
            'https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js'
            'build/js/lib/jasmine-jquery.js'
          ]

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
          base: 'build'

  #Load Tasks
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-haml2html'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks('grunt-contrib-jasmine')

  grunt.registerTask 'compile', ['coffee', 'haml', 'copy']
  grunt.registerTask 'test', ['coffee', 'haml', 'copy:spec', 'jasmine']
  grunt.registerTask 'server', ['connect:server', 'watch']
