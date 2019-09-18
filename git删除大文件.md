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


场景
适用于从一个git项目中，将体积较大的资源彻底从git中删除，包括历史提交记录。

如果仅仅在目录中删除一个文件是不够的，只要在提交记录中有这个文件，那么 .git 中就会有这个文件的信息。

用 filter-branch 可以强制修改提交信息，将某个文件的历史提交痕迹也抹去，就像从来没有过这个文件一样。

做法
0、确保本地仓库是最新版本。

1、在项目根目录下运行

git rev-list --all | xargs -rL1 git ls-tree -r --long | sort -uk3 | sort -rnk4 | head -10

列出所有仓库中的对象（包括SHA值、大小、路径等），并按照大小降序排列，列出TOP 10。

$ git rev-list --all | xargs -rL1 git ls-tree -r --long | sort -uk3 | sort -rnk4 | head -10
100644 blob 71ac1de8ee83566cca68f69d54acd82b9abf607d 7701044    "attr_matching/\346\240\207\346\263\250\346\226\207\344\273\266Win\346\216\222\345\272\2171-54000.xlsx"
100644 blob d610f01bc315becaaa1c6d04772689d80ad4d010 7532106    "attr_matching/\346\240\207\346\263\250\346\226\207\344\273\266Win\346\216\222\345\272\2171-58000.xlsx"
100644 blob 72b8fd2eeb1c951a7f680e6f4031fa57d643ebe1 5717635    personal_label_project/personal_label_ocr/result/matrix.csv
100644 blob 89363c480afb229b5df4e2f6a6a951fdebca5ce2 5501428    cloth_attribute_classification/nohup_1103.out
100644 blob 7cdba6a4e584a49dcab693111a90f2bdb0030a3c 5392316    sheos_category_classification/nohup_gpu_category_33_0.out
100644 blob 84149a46904f87495df4896698ca5dd6fb53bdf3 5226094    cloth_attribute_classification/nohup_1105.out
100644 blob c77db27ae9fbb5450586daa3c9622766d7a4a9bc 5151535    attr_matching/OCR_result_correct.txt
100644 blob 58e4647427c443a44fbc66d584f6bda21b7c9036 2785190    image_check/out_tmp/nohup_5w_test_sheos.out
100644 blob 58e4647427c443a44fbc66d584f6bda21b7c9036 2785190    image_check/out_tmp/nohup_50000_sheos.out
100644 blob 58e4647427c443a44fbc66d584f6bda21b7c9036 2785190    image_check/nohup_5w.out

1
2
3
4
5
6
7
8
9
10
11
12
2、根据最大文件的路径 {filepath}，修改此文件的commit历史：

git filter-branch --tree-filter "rm -f {filepath}" -- --all

3、强制提交到远程分支：

git push -f --all

4、完成。可以重新下载项目，列出所有仓库中的对象，看是否还存在刚刚删除的文件。

useful：

找过大文件 ：
git verify-pack -v .git/objects/pack/pack-*.idx | sort -k 3 -g | tail -5

第一行的字母其实相当于文件的id,用以下命令可以找出id 对应的文件名：
git rev-list --objects --all | grep 8f10eff91bb6aa2de1f5d096ee2e1687b0eab007

file_name 可以 是文件 夹名，加-r参数

git filter-branch --index-filter 'git rm --cached --ignore-unmatch <your-file-name>'
rm -rf .git/refs/original/
git reflog expire --expire=now --all
git fsck --full --unreachable
git repack -A -d
git gc --aggressive --prune=now
git push --force [remote] master
