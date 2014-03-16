#!/bin/bash
echo "RELEASING PROJECT"
echo
echo "Fetching dependencies and precompile (for mix tasks) ..."
mix do deps.get, compile

echo
echo "Compiling project ..."
mix compile

echo "Assembling and bundling ..."
mix relex.assemble

echo
echo "- done."
