set -e

time=$(date "+%Y-%m-%d %H:%M:%S")

echo $time

git add -A
git commit -m "commit at $time"

git push origin master