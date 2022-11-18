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

# Set variables:
FLAGS="--assignee @me --state open --json number,createdAt,updatedAt,title,state,labels,url"
REPO_1=""
REPO_2=""

# Collect and display issues:
( gh issue list --repo "$REPO_1" $FLAGS ; \
    gh issue list --repo "$REPO_2" $FLAGS ) \
    | jq -cs 'add | sort_by(.createdAt) | .[] | {Number: .number, Created: .createdAt | fromdate | strftime("%Y-%m-%d %H:%M"), Updated: .updatedAt | fromdate | strftime("%Y-%m-%d %H:%M"), Title: .title, Labels: [.labels[].name]|join(", "), Link: .url}' | jtbl -t
 
