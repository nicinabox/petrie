$ ->
  $st = $('.sir-trevor-area')
  if $st.length
    new SirTrevor.Editor
      el: $st
      blockTypes: ["Heading", "Text", "Quote", "List", "Image"]
