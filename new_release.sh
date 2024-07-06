helm package upylab
helm repo index --url https://bperraud.github.io/upylab-helm-depot/ .
git add --all && git commit -m "new release"
git push
