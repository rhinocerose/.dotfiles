#!/bin/bash
rclone copy --update --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "remote:.hardware-dev" "$HOME/Drive/.hardware-dev"
rclone copy --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "remote:.school-docs" "$HOME/Drive/.school-docs"
rclone copy --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "remote:.synth-schema" "$HOME/Drive/.synth-schema"
