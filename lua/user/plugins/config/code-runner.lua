local status_ok, code_runner = pcall(require, "code_runner")
if not status_ok then return end
print "Hello world"

code_runner.setup {
  term = {
    --  Position to open the terminal, this option is ignored if mode is tab
    position = "vert", -- vertical
    -- position = "bot", -- bottom
    -- window size, this option is ignored if tab is true
    size = 50,
  },
  filetype = {
    cs = {
      "dotnet run",
    },
  },
}
