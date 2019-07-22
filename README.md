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

#### Update the new (existing) release branch from the active release branch.

This is the case where there is bugfix to the active release branch and the new branch must be updated

1. Pull latest from release branch (active branch, usually ready for release)
2. Merge the active branch to develop branch
3. Merge new changes from develop to the new branch
4. Push the develop branch to origin
5. Push the newly created branch to the origin 
