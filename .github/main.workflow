workflow "Test persistence" {
 on = "push"
 resolves = [
   "look around",
   "check /github/workspace",
   "check /github/home",
   "check /home"
 ]
}


action "look around" {
  uses = "actions/bin/sh@master"
  args = ["ls ..", "ls ../..", "ls /."]
}


action "touch /github/workspace" {
  uses = "actions/bin/sh@master"
  args = ["touch foo"]
}

action "check /github/workspace" {
  uses = "actions/bin/sh@master"
  args = ["ls -lr", "rm foo"]
  needs = "touch /github/workspace"
}


action "touch /github/home" {
  uses = "actions/bin/sh@master"
  args = ["touch /github/home/foo"]
}

action "check /github/home" {
  uses = "actions/bin/sh@master"
  args = ["ls /github/home", "rm /github/home/foo"]
  needs = "touch /github/home"
}


action "touch /home" {
  uses = "actions/bin/sh@master"
  args = ["touch /home/foo"]
}

action "check /home" {
  uses = "actions/bin/sh@master"
  args = ["ls /home", "rm -rf /home/foo"]
  needs = "touch /home"
}
