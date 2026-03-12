# Practice Branches - workfolw via visualizing-git 
## Make sure you are not lossing the head
**Git losing the head** refers to the "detached HEAD" state,
a normal (though less common) Git state where your HEAD pointer points directly
to a specific commit rather than a branch name.
This means any new commits you make are not part of a branch and risk being lost

- Go to http://git-school.github.io/visualizing-git
  
```
git commit "01"
git commit "02"
git commit "03"
git checkout -b "new-branch"
git commit "new-branch-01"
git commit "new-branch-02"
git checkout head~3
git checkout -b "feature-01"	
git commit "feature-01"
git commit "feature-02"
git commit "feature-03"
git checkout master 
git checkout -b "feature-02"
git commit "feature-02-01"
git commit "feature-02-02"
git commit "feature-02-03"
git commit "feature-02-04"

	# lossing the head				
git checkout head~6 
git commit "lossing the head"
git commit "lossing the head 02"
git checkout -b "loss-head-br"           # fix lossing the head
git branch
git checkout master
git branch -d "loss-head-br"             # delete branch
git branch
```

## Branches - workfolw via Visual Studio Code  or Git bash

```
git status
git branch
git branch --all
git branch -r
git checkout -b feature01
git branch
git branch --all
ls
ls -la
cat .gitignore
vi README.md
cat README.md
git add .
git commit -m "first commit in feature br"
echo "add second line in feature br" >> README.md
git diff --cached
git add .
git diff --cached
git commit -m "second commit in feature br"
git status
git branch
git branch --all
git pull
git push 					# the message is since we need to sync the branches
git push --set-upstream origin feature01
git push
```

# Practie - Git hook 

- Hooks live in the .git/hooks/ directory of every Git repository.
When you initialize a repo, Git puts sample scripts there (e.g., commit-msg).

```
cd .git/hooks/
cp commit-msg.sample commit-msg
```

- **vi commit-msg** and add below contant
  
```
#!/bin/sh
echo "Checking commit message for JIRA ID..."

# Ensure a commit message file was passed
if [ -z "$1" ]; then
  echo "❌ No commit message file provided."
  exit 1
fi

# Read the commit message from the file Git passes as $1
commit_msg=$(cat "$1")

# Require a JIRA ID like "JIRA-123"
if ! echo "$commit_msg" | grep -qE '\bJIRA-[0-9]+\b'; then
  echo "❌ Commit message must include a JIRA ID like 'JIRA-123'"
  exit 1
fi

echo "✅ Commit message contains a valid JIRA ID."
```

- vi index.html
- git add index.html
- git commit -m "fix typo bug-123"              

- You should get an error message

![Alt text](pic-gh-error-hook.png) 

- vi index.html
- git add index.html
- git commit -m "JIRA-123 fix typo bug-123"    		

- You should get a success message Commit message contains a valid JIRA ID

![Alt text](pic-gh-success-hook.png) 

- Hook disabled

```
mv .git/hooks/commit-msg .git/hooks/commit-msg.disabled
```


