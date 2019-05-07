workflow "Test persistence" {
 on = "push"
 resolves = [
   "look around",
   "check workspace",
   "check github/home",
   "check home"
 ]
}


action "look around" {
  uses = "actions/bin/sh@master"
  args = ["ls ..", "ls ../..", "ls /."]
}


action "touch workspace" {
  uses = "actions/bin/sh@master"
  args = ["touch foo"]
}

action "check workspace" {
  uses = "actions/bin/sh@master"
  args = ["ls -lr foo", "rm foo"]
  needs = "touch workspace"
}


action "touch github/home" {
  uses = "actions/bin/sh@master"
  args = ["touch /github/home/foo"]
}

action "check github/home" {
  uses = "actions/bin/sh@master"
  args = ["ls -lr github/home/foo", "rm github/home/foo"]
  needs = "touch github/home"
}


action "touch home" {
  uses = "actions/bin/sh@master"
  args = ["touch /home/foo"]
}

action "check home" {
  uses = "actions/bin/sh@master"
  args = ["ls -lr /home/foo", "rm -rf /home/foo"]
  needs = "touch home"
}
