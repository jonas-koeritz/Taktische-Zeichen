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
    zip: {
      release: {
        src: ['128x128/**', '256x256/**', '512x512/**', '1024x1024/**', 'symbols/**'],
        dest: 'release-v<%= pkg.version %>.zip',
        router: function(filepath) {
          if(filepath.startsWith('symbols/')) {
            filepath = filepath.replace(/symbols/, 'svg');
          }
          console.log(filepath);
          return filepath;
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-run');
  grunt.loadNpmTasks('grunt-bump');
  grunt.loadNpmTasks('grunt-publish');
  grunt.loadNpmTasks('grunt-zip');

  // Default task(s).
  grunt.registerTask('default', ['run:create_svgs']);
  grunt.registerTask('create-svgs', ['run:create_svgs'])
  grunt.registerTask('render-all', ['run:create_svgs', 'run:render_all'])
  grunt.registerTask('patch-release', ['bump:patch', 'zip:release', 'publish'])
  grunt.registerTask('minor-release', ['bump:minor', 'zip:release', 'publish'])
  grunt.registerTask('major-release', ['bump:major', 'zip:release', 'publish'])
};