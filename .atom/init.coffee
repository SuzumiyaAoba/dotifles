process.env.PATH = [ "/usr/local/bin", "~/go/bin", process.env.PATH ].join(":")

atom.commands.add 'atom-text-editor', 'custom:copy-selected-area', ->
  atom.commands.dispatch(this, 'core:copy')
  atom.commands.dispatch(this, 'text-select-mode:toggle')
