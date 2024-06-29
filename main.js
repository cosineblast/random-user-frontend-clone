import { Elm } from './src/Main.elm'

// Mount "Hello" Browser.{element,document} on #root
Elm.Main.init({
  node: document.getElementById('app'),
  flags: "Initial Message"
})
