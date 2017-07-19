module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    run: {
      options: {

      },
      create_svgs: {
        cmd: 'node',
        args: [
          'render.js',
          'config.json',
          'create-svgs'
        ]
      },
      render_all: {
        cmd: 'node',
        args: [
          'render.js',
          'config.json',
          'render-all'
        ]
      }
    },
    bump: {
      options: {
        files: ['package.json'],
        commit: true,
        commitMessage: 'Release v%VERSION%',
        commitFiles: ['-a'],
        createTag: true,
        tagName: 'v%VERSION%',
        tagMessage: 'v%VERSION%',
        push: true,
        pushTo: 'origin',
        globalReplace: false,
        prereleaseName: false,
        metadata: '',
        regExp: false
      }
    },
    publish: {
        main: {
            src: [
                '.'
            ]
        }
    },
  });

  grunt.loadNpmTasks('grunt-run');
  grunt.loadNpmTasks('grunt-bump');
  grunt.loadNpmTasks('grunt-publish');

  // Default task(s).
  grunt.registerTask('default', ['run:create_svgs']);
  grunt.registerTask('create-svgs', ['run:create_svgs'])
  grunt.registerTask('render-all', ['run:create_svgs', 'run:render_all'])
  grunt.registerTask('patch-release', ['bump:patch', 'publish'])
  grunt.registerTask('minor-release', ['bump:minor', 'publish'])
  grunt.registerTask('major-release', ['bump:major', 'publish'])
};