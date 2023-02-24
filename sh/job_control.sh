#!/usr/bin/env bash

TIMEOUT=10   # Timeout value in seconds
count=0

bash -c ./test_long_running_job.sh & {
        while ((count < TIMEOUT )); do
                eval '[ ! -d "/proc/$!" ] && ((count = TIMEOUT))'
                # /proc is where information about running processes is found.
                # "-d" tests whether it exists (whether directory exists).
                # So, we're waiting for the job in question to show up.
                ((count++))
                sleep 1
        done
        eval '[ -d "/proc/$!" ] && kill -15 $!'
        # If the hanging job is running, kill it.
}
