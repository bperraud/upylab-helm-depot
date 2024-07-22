if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <commit-message>"
    exit 1
fi

COMMIT_MESSAGE=$1

helm package upylab
helm repo index --url https://bperraud.github.io/upylab-helm-depot/ .
git add --all && git commit -m "$COMMIT_MESSAGE"
git push
