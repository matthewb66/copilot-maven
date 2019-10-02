workflow "New workflow" {
  on = "push"
  resolves = ["blackducksoftware/github-action@1.0.1"]
}

action "GitHub Action for Maven" {
  uses = "LucaFeger/action-maven-cli@765e218a50f02a12a7596dc9e7321fc385888a27"
  args = "clean package"
}

action "blackducksoftware/github-action@1.0.1" {
  uses = "blackducksoftware/github-action@1.0.1"
  needs = ["GitHub Action for Maven"]
  secrets = ["BLACKDUCK_URL", "BLACKDUCK_API_TOKEN"]
  args = "--blackduck.url=${{ secrets.BLACKDUCK_URL}} --blackduck.api.token=${{ secrets.BLACKDUCK_API_TOKEN }}"
}
