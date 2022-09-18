#!/usr/bin/env bash
echo "Well Known Dir Setup init"


mkdir -p .well-known/
cd .well-known/

sleep 1
echo "Well Know Dir Init!"

mkdir -p apple-app-site-association/
touch apple-app-site-association/.gitkeep
sleep 1

mkdir -p security/
touch security/.gitkeep
sleep 1

mkdir -p canary/
toch canary/.gitkeep

sleep 1
echo "setup finished..."
