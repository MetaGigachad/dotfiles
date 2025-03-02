return {
  ARCADIA_MODE and { 
    dir = "~/arcadia/junk/moonw1nd/lua/telescope-arc.nvim",
    config = function() require('telescope').load_extension('arc') end,
  } or {},
}
