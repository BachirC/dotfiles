print "OKKK"
require('github-theme').setup {
  theme_style = "dimmed",
  --comment_style = "italic",
  --keyword_style = "italic",
  --function_style = "italic",
  --variable_style = "italic",
  colors = {hint = "orange", error = "#ff0000"},
  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      TSFunction={fg="#FFFFFF"},
    }
  end
}
