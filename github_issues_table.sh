#!/bin/bash
# *****************************************************************************
# Title: GitHub Issues Table
# =============================================================================
# Description: This script uses the GitHub CLI to retrieve issues assigned to
# you from specified repositories, merges them, sorts them by date, and outputs
# the list in a table.
#
# Dependencies:
# - GitHub CLI
# - https://github.com/kellyjonbrazil/jtbl
# *****************************************************************************

JSON_KEYS="number,createdAt,title,state,labels"
FLAGS="--assignee @me --state open --json $JSON_KEYS"
REPO_1=""
REPO_2=""

( \
    gh issue list --repo $REPO $FLAGS ; \
    gh issue list --repo $REPO $FLAGS ) \
    | jq -cs 'add | sort_by(.createdAt) | .[] | {Number: .number, Created: .createdAt, Title: .title, Labels: [.labels[].name]}' | jtbl
 

