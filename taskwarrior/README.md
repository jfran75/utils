# taskwarrior
- the first time you run the command "task version" will create a config file in ~/.taskrc
- data.location=~/.task # nvim ~/.task
```
brew install task
task version
task help
tldr task
nvim ~/.taskrc
cat ~/.taskrc
la ~/.task

# config command to change the config file
task config regex on
task config confirmation off

task show report.minimal

task list
task add <task>
task <task number> done
task <task number> delete
task <task number> modify <new task>
task <task number> modify project:<project name>
task <task number> modify priority:H
task <task number> modify due:tomorrow
task <task number> modify due:eom
task <task number> modify due:eoy

```

## examples
```
task add Read Taskwarrior documents later
task add priority:H Pay bills
```

- frontend
  - configuracion obtenida de los configmaps(revisar omar)
  - migracion a la version 16 de angular.
  - 