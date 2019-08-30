## 查看仓库中的大文件
```sh
git rev-list --all --objects | \
grep "$(git verify-pack -v .git/objects/pack/*.idx | sort -k 3 -n | tail -n 3 | awk -F ' '  '{print $1}')"
```
- git rev-list 查看commit
- git verify-pack 检查git打包的文件，输出SHA-1、size等字段
- 另外这里用到$ 先求解git verify-pack 的输出
## 删除仓库中的大文件
```
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch 上一条查到的大文件' --prune-empty --tag-name-filter cat -- --all  
```

- git filter-branch 用于重新branch

## 回收空间
```
rm -rf .git/refs/original/ 
git reflog expire --expire=now --all
git gc --prune=now
git gc --aggressive --prune=now
```
- git reflog 用于管理reflog信息
- git gc 移除不必要的文件并优化本地文件
## 强制推送改动到远端
```
git push origin --force --all
```

> 原文链接：https://blog.csdn.net/wenqibiao8/article/details/81263751





> 本文链接：https://blog.csdn.net/lwfcgz/article/details/49453375
```
简略版
假设要删除的文件是password.txt，运行如下命令：

git filter-branch --force --index-filter 'git \
rm --cached --ignore-unmatch password.txt' \
--prune-empty --tag-name-filter cat -- --all
1
2
3
如果commit已经同步到了github，那么再运行如下命令永久删除远端上的文件。

git push --all --force
1
不用关心各条命令在干什么，大功告成！

详细版
你如果有耐心或者有兴趣知道上面两条命令是如何工作的，就接着往下读。。。

问题的产生
众所周知，git是用来进行版本控制的，可以恢复到任何commit了的历史状态，对于新手来说，经常会把一些不必要的数据或者敏感数据放到github的公开项目中。比如说我，刚接触git时，每次修改之后都用 git add .图省事，结果一些.class， .zip， .exe文件都被commit了，很烦人。要是不小心提交了密码或者机器的SSH key，就容易产生安全隐患。

一个简单但错误的办法就是使用git rm password.txt 命令删除敏感文件，但是这仅仅是把文件从当前版本中删除，历史版本中仍然有。

下面来说说正确命令的每个选项是什么意思：

git filter-branch --force --index-filter 'git \
rm --cached --ignore-unmatch password.txt' \
--prune-empty --tag-name-filter cat -- --all
1
2
3
filter-branch 是让git重写每一个分支， 
--force 假如遇到冲突也让git强制执行， 
--index-filter 选项指定重写的时候应该执行什么命令，要执行的命令紧跟在它的后面，在这里就是git rm --cached --ignore-unmatch password.txt ，让git删除掉缓存的文件，如果有匹配的话。

--prune-empty 选项告诉git，如果因为重写导致某些commit变成了空（比如修改的文件全部被删除），那么忽略掉这个commit。

--tag-name-filter 表示对每一个tag如何重命名，重命名的命令紧跟在后面，当前的tag名会从标注输入送给后面的命令，用cat就表示保持tag名不变。 
紧跟着的-- 表示分割符，最后的--all 表示对所有的文件都考虑在内。

预防措施
今后为了防止再次不小心将敏感数据提交，可以修改.gitignore文件的内容，凡是成功匹配的文件都不会被git看到，比如在本例中可以在.gitignore后面追加一行”password.txt”

参考资料：
1.stackoverflow上的一个讨论： http://stackoverflow.com/questions/2004024/how-to-permanently-delete-a-file-stored-in-git

2.github官方的指南：https://help.github.com/articles/remove-sensitive-data/

3.关于git filter-branch使用的文档：https://git-scm.com/docs/git-filter-branch
```



```
emp:
git filter-branch --force --index-filter "git rm --cached --ignore-unmatch workfile/锐安项目文档/sap/'NEW HANA STUDIO.rar'" --prune-empty --tag-name-filter cat -- --all
```
