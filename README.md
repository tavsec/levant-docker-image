# Levant
This is a Docker image for HashiCorp's Levant package. This image is compatible with CI/CD providers, and can be used in automated deployment cycles.

## Example
### GitLab CICD pipeline
```yaml
deploy:
  image: tavsec/levant:0.3.2
  stage: deploy
  only:
    - develop
  before_script:
    - IMAGE_TAG="$(echo $CI_COMMIT_SHA | head -c 8)"
  script:
    - levant deploy
      -var "image_tag=develop"
      -address="http://nomad.domain.internal:4646"
      -log-level=error
      -force
      deployment/development.nomad
```