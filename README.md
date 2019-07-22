# release-branch-merger

## What is this?
Script I use for creating and updating release branches for my Development flow.


## How it works?

#### Create a new release branch from the active release branch

1. Pull latest from release branch (active branch, usually ready for release)
2. Merge the active branch to develop branch
3. Create the new branch from the develop branch
4. Push the develop branch to origin
5. Push the newly created branch to the origin 

#### Update the existing release branch from the active release branch.

This is the case where there is bugfix to the active release branch and the existing branch must be updated

1. Pull latest from release branch (active branch, usually ready for release)
2. Merge the active branch to develop branch
3. Merge new changes from develop to the existing branch
4. Push the develop branch to origin
5. Push the new updated branch to the origin 

## How I use it?

For creating a new branch from the active release branch

```./release_to_release_branch.sh create <project-folder> release/active-branch release/new-branch```

For updating the new branch from the active release branch

```./release_to_release_branch.sh update <project-folder> release/active-branch release/existing-branch```
