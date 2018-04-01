#!/usr/bin/env bash

set -e

export PATH=node_modules/.bin:${PATH}

rm -rf public/

hugo -v
