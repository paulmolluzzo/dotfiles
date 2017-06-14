module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 13,

    // font family with optional fallbacks
    fontFamily: '"Hack", Source Code Pro for Powerline", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: '#e3bf21',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'UNDERLINE',

    // color of the text
    foregroundColor: '#f8f8f2',

    // terminal background color
    backgroundColor: 'rgba(43, 62, 80, 0.6)',

    // border color (window, tabs)
    borderColor: '#2b3e50',

    // custom css to embed in the main window
    css: `.divider_horizontal_1o3q3oz {
      height: 1px;
      margin: 0;
      border-top: 1px solid rgba(255, 255, 255, 0.5);
      border-bottom: none;
      cursor: row-resize;
      width: 100%;
    }
    .divider_vertical_1oumag6 {
      border-left: 1px solid rgba(255, 255, 255, 0.5);
      border-right: none;
      width: 1px;
      margin: 0;
      cursor: col-resize;
    }
    .tab_active, .term_active {
      background-color: rgba(43, 62, 80, 1);
    }`,

    // custom css to embed in the terminal window
    termCSS: `
    x-screen a {
      color: #00ccff;
    }

    x-screen a.hover {
      text-decoration: underline;
    }`,

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '10px 10px 20px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#777777',
      red: '#c7735f',
      green: '#fbb036',
      yellow: '#f2f200',
      blue: '#5796ed',
      magenta: '#df64dd',
      cyan: '#00ccff',
      white: '#f8f8f2',
      lightBlack: '#aaa',
      lightRed: '#cf8775',
      lightGreen: '#fbce81',
      lightYellow: '#ffffa7',
      lightBlue: '#9dc3f4',
      lightMagenta: '#ff73fd',
      lightCyan: '#87e7ff',
      lightWhite: '#f8f8f2'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: false,

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
    hyperline: {
      background: '#2b3e50',
      plugins: [
        {
          name: 'ip',
          options: {
            color: 'magenta'
          }
        },
        {
          name: 'battery',
          options: {
            colors: {
              fine: 'lightGreen',
              critical: 'lightRed'
            }
          }
        }
      ]
    },
    hyperBorder: {
      borderWidth: '3px'
    }
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hypertheme',
    'hypercwd',
    'hyperlinks',
    'hyperterm-tab-icons',
    'hyperborder',
    'hyperlayout'
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [
    'hyperline'
  ]
};
