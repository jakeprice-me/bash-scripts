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
REPO_1="Edgefolio/configuration"
REPO_2="Edgefolio/api"

( \
    gh issue list --repo "$REPO_1" "$FLAGS" ; \
    gh issue list --repo "$REPO_2" "$FLAGS" ) \
    | jq -cs 'add | sort_by(.createdAt) | .[] | {Number: .number, Created: .createdAt, Title: .title, Labels: [.labels[].name]}' | jtbl
 
