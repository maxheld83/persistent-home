workflow "Test persistence" {
 on = "push"
 resolves = [
   "look around",
   "touch /github/workspace",
   "check /github/workspace",
   "touch /github/home",
   "check /github/home",
   "touch /home",
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
  args = ["ls -lr foo", "rm foo"]
}


action "touch /github/home" {
  uses = "actions/bin/sh@master"
  args = ["touch /github/home/foo"]
}

action "check /github/home" {
  uses = "actions/bin/sh@master"
  args = ["ls -lr /github/home/foo", "rm /github/home/foo"]
}


action "touch /home" {
  uses = "actions/bin/sh@master"
  args = ["touch /home/foo"]
}

action "check /home" {
  uses = "actions/bin/sh@master"
  args = ["ls -lr /home/foo", "rm -rf /home/foo"]
}
