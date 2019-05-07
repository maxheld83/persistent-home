workflow "Test persistence" {
 on = "push"
 resolves = "touch in home"
}

action "touch in home" {
  uses = "actions/bin/sh@master"
  args = ["ls -ltr", "cd ..", "ls"]
}
