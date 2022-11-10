#!/bin/sh

git log2json | jq -r '.[] | select(.message|test("<")) | (.message) + " | " + (.commit)'|sed -E 's/<([^>]+)>.* | (.*)/git tag \1 \2/g'
