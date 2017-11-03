import Elm from '../todo'

document.addEventListener('DOMContentLoaded', () => {
  const target = document.createElement('div')

  document.body.appendChild(target)
  Elm.Main.embed(target)
})
