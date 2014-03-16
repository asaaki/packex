#!/bin/bash
echo "RELEASING PROJECT"
echo
echo "Fetching dependencies and compile ..."
mix do deps.get, compile

echo "Assembling and bundling ..."
mix relex.assemble

echo
echo "- done."
