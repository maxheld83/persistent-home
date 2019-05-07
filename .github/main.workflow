workflow "Test persistence" {
 on = "push"
 resolves = [
   "look around",
   "check home",
   "check workspace",
   "check root"
 ]
}

action "look around" {
  uses = "actions/bin/sh@master"
  args = ["ls ..", "ls ../..", "ls /."]
}

action "touch home" {
  uses = "actions/bin/sh@master"
  args = ["touch ../home/foo"]
}

action "check home" {
  uses = "actions/bin/sh@master"
  args = ["ls -lr ../home/foo", "rm ../home/foo"]
  needs = "touch home"
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

action "touch root" {
  uses = "actions/bin/sh@master"
  args = ["touch /foo"]
}

action "check root" {
  uses = "actions/bin/sh@master"
  args = ["ls -lr /foo", "rm -rf /foo"]
  needs = "touch root"
}
