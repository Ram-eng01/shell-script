#!/bin/bash

COURSE="Devops from Current sccript file"

echo "Before calling other script, course: $COURSE"
echo "Process ID of current shell script: $$"


source ./16-other-script.sh

echo "after calloing other script, course: $COURSE"