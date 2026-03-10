**Git Basic commands**
- Create new file then add,commit it and see the status of each steps

```
echo "my new file" > newfile.txt
ls
git status
git add newfile.txt
cat newfile.txt
git status
git commit -m "new file"
git status
```
- **Git mv** move or rename files
- **Git log** display the commit history
- **Git diff** see the differences between commits ​
```
git mv newfile.txt newfile01.txt
git status
git commit -m "rename"
git log
git log --graph --decorate
git log --oneline
git diff 61f2e9a 55b1459
```

## Git Structure  - untracked, unmodifed, modifed, staged 	
```
# untracked - new file but not in git add yet
vi test-file-02.txt
git status
 				 - msg in cli is: Untracked files
cat test-file-02.txt

	# unmodifed
git add test-file-02.txt
git commit -m "commited"
				- you can combine commit and add with one command:
git commit -am  "am"
git status
				- is committed and unmodifed

	
	# modifed
echo "new line-02" >> test-file-02.txt
git status
				- msg in cli is:  modified:   test-file-02.txt
git commit -am  "am"
				- msg in cli is:  modified:   nothing to commit, working tree clean

	# staged
git status
git diff --cached
echo "new line-03" >> test-file-02.txt
git status
git add test-file-02.txt
git diff --cached
				- msg in cli is: diff of git
git commit -m "staged"
git diff --cached
				- msg in cli is: no diff of git
git status
```


### Git Branches
- **Git branch** to see list of your branches
- **Git branch \<name of new br>** creates a new branch
- **Git checkout \<name of new br>** - command switches ​to the specified branch​
- **Git branch -m \<old br> \<new br>** to rename branch
- **Git branch -d \<name of new br>** to delete branch
- **Git branch -r** view remote branches
- **Git branch -a** view local and remote branches
- **Git branch --all** view all branches

## Let's start with visualizing mode before Git bash exercises
- Open the URL via the browser http://git-school.github.io/visualizing-git

```
git branch feature1​
git commit​
git commit​
git log​
git checkout feature1​
git commit​
git commit​
git checkout <SHA1>​
git tag release1​
git commit​
git commit​
git checkout release1​
git checkout -b feature2​
git commit​
git commit​
git checkout HEAD~3​
git branch​
git branch -d feature1​
git branch​
```
### Open the cli of Git Bash and do the below commands
```
git branch --all
git branch -r
git branch
git branch feature02
git branch
git checkout feature02                 #git checkout -b feature02        #you can create and switch by flag -b
git branch
git branch -m feature02 feature03
git branch
git checkout main
git branch
git branch -d feature03            # you can use -D flag for force delete
git branch
git branch --all
git checkout remotes/origin/bugfix-01              # switch to remote br
```


#### Additinal commands

```
git branch --all
git branch
git branch
git branch --all
git branch -r
git branch feature02
git branch
git checkout feature02
git branch
vi br02.txt
git add .
git commit -m "new br"
git branch
ls
git checkout main
ls
git push --set-upstream origin feature02
```
