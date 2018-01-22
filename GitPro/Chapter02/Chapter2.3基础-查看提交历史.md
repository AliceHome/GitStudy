# 查看提交历史

$git log 
commit ca82a6dff817ec66f44342007202690a93763949 (HEAD -> master, origin/master, origin/HEAD)
Author: Scott Chacon <schacon@gmail.com>
Date:   Mon Mar 17 21:52:11 2008 -0700

    changed the verison number

commit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7
Author: Scott Chacon <schacon@gmail.com>
Date:   Sat Mar 15 16:40:33 2008 -0700

    removed unnecessary test code

commit a11bef06a3f659402fe7563abf99ad00de2209e6
Author: Scott Chacon <schacon@gmail.com>
Date:   Sat Mar 15 10:31:28 2008 -0700

    first commit

默认不添加任何参数的话，git log 会按提交时间列出所有的更新，最近的更新排在最上面。
这个命令会列出：
1. 每次提交的SHA-1校验和；
2. 作者的名字和邮箱地址
3. 提交时间以及提交说明


## 参数 -p
git log 有许多选项可以帮助你搜寻你所有找的提交。 -p 用来显示每次提交的内容差异， -2 仅显示最近两次提交

## --state 
查看每次提交的简略统计信息

## --pretty 
$git log --pretty=oneline
$git log --pretty=short
$git log --pretty=full
$git log --pretty=fuller

## --pretty=fomat

$git log --pretty=format:"%h - %an, %ar : %s"

** git log --pretty=format** 根据提供的格式进行显示，重用选项如下：
1. %H	提交对象（commit） 完整的哈希字符串
2. %h	提交对象（commit) 剪短哈希字符串
3. %T	树对象的剪短哈希字符串
4. %t	树对象的简短哈希字符串



