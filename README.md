# Ontology hygiene tests (Github template)
This is a template Github repository that enables ontologies to be tested against a set of predefined validations.

## Applying the tests to your project
You can use the contents in the repository to enable tests of your ontologies as part of continuous integration pipeline. This repository can be used in new projects (new Github repos) as well as included in existing projects. The instructions for both cases follow.

### New project (new Github repo)
When creating your new Github repo that host your project, make sure to select this project `tetherless-world/ontology-hygiene-tests` under the `Repository template` section. There is no need to check the option `Include all branches`. See the image below.

### Existing project (existing Github repo)
TBD.

### Verify that you repository has the correct hygiene tests content
Check the root directory of your repository. You should have (alogside your own content) the following content:
```
| .circleci
| | config.yml
| .hygiene
| | docker/compose/hygiene
| | - docker-compose.yml
| | tests
| | - (a list of .sparql files)
| | copy-to-container.sh
| | create-directories.sh
| | start-container.sh
```

## Configuring

### Update references
Update the following contents to meet your needs
1. In `.hygiene/docker/compose/hygiene/docker-compose.yml`
- Change line 7 from `- ONTPUB_FAMILY=${ONTPUB_FAMILY:-ontology-hygiene-tests}` to match your repository name. If the name is `my-repo` it should be `- ONTPUB_FAMILY=${ONTPUB_FAMILY:-my-repo}`
- Change line 13 from `- ONTPUB_SUBDIR=/ontology` to match the directory your ontologies reside. If the dir is `my_ontologies` it should be `- ONTPUB_SUBDIR=/my_ontologies`
- Change line 14 from `- ONTPUB_EXCLUDED=/archived` to match the directory you want to exclude from the tests. If the dir is `exclude` it shoule be `- ONTPUB_EXCLUDED=/exclude`

2. In `.hygiene/copy-to-container.sh`
- Change line 3 from `docker cp . hygiene:/input/ontology-hygiene-tests` to match your repository name. If the name is `my-repo` it should be `docker cp . hygiene:/input/my-repo`

3. In `.circleci/config.yml`
- Change the line `working_directory: /git/ontology-hygiene-tests` to match your repository name. If the name is `my-repo` it should be `working_directory: /git/my-repo`
- Change this block
```
      - run:
          name: Copy tests results back
          command: |
            docker cp hygiene:/output/ontology-hygiene-tests /output
```
to match your repository name. If the name is `my-repo` it should be
```
      - run:
          name: Copy tests results back
          command: |
            docker cp hygiene:/output/my-repo /output
```

### Enable CircleCI in your repository
You need to enable CircleCI in your repository. If it's already enabled, you can skip this step.
1. Go to https://app.circleci.com/dashboard and log in with yout Github account
2. Select the appropriate organization where your Github repository is
3. In the Project list, click `Set Up Project` to start the cofiguration of CircleCI for your repository
4. In the next screen, click `Use Existing Config` as you will be using an already created `.circleci/config.yml` configuration

## Testing
TBD.
