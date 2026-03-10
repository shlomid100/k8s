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

