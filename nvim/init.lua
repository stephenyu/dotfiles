-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("gen").prompts["Generate"] = {
  prompt = "For a given $filetype, accomplish the follow command:\n$input",
  replace = true,
}

require("gen").prompts["Complete_Selection"] = {
  prompt = "For a given filetype: '$filetype', finish writing the remainder of this code.\nWrite appropriate comments including function comments.\n\n### Code ###\n$text",
  replace = true,
  extract = "```$filetype\n(.-)```",
}
