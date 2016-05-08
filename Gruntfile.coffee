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

  grunt.registerTask 'compile', ['coffee', 'haml', 'copy']
  grunt.registerTask 'server', ['connect:server', 'watch']
