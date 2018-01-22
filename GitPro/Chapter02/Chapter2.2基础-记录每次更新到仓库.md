# Git基础-记录每次更新到仓库


工作目录下每个文件只有两种状态：
1. 已跟踪
2. 未跟踪

未跟踪文件不是我们关心的。
已跟踪文件的状态有：未修改、已修改、已经放入暂存区

## 检查当前文件状态
$git status
On branch master
nothing to commit, working directory clean

从上面的信息看到，当前的工作空间是干净的，没有任何修改，并且分支在 master 上。
接下来，在当前工作目录项创建 README 文件，并且写入内容--- My project ,重新查看当前 git 的状态：

$ echo 'My porject' > README
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	README

nothing added to commit but untracked files present (use "git add" to track)

在状态中，我们看到了 README 文件在未跟踪的文件下面。未跟踪意味着 Git 之前的快照中没有这些文件；Git 不会自动将之纳入跟踪范围，除非你明明白白地告诉他“我需要跟中这个文件”,这样处理让你不需要担心将生成的二进制文件或其他不想跟踪的文件包含进来。

## 跟踪新文件 - git add
跟踪 README 文件
$git add README 
$git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   README

通过 git status 命令查看当前git状态，发现README文件已经被跟踪，并且处于暂存状态：
只要在 “Changes to be committed”这行下面，就说明是暂存状态。

git add 命令使用文件或者目录的路径作为参数，如果参数是目录的路径，该命令将递归地跟踪该目录下所有文件。

## 暂存已修改文件
如果 git 仓库中原本有一个文件 CONTRIBUTING.md，该文件已经被跟踪。如果我们修改了这个文件，那么运行git status命令结果如下：
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)
	new file:   README

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   CONTRIBUTING.md

文件CONTRIBUTING.md出现在 “Changes not staged for commit' 这一行下面，说明了已跟踪的文件内容发生了变化，但是没有放到暂存区中。
如果要暂存这次变化，需要运行 git add 命令。

git add 命令是个多功能命令：
1. 开始跟踪一个新文件 -- 该文件是新添加到仓库中的，通过 git add 命令对该文件进行跟踪；
2. 把已跟踪的文件放入到暂存区中 -- 该文件已经在git仓库中，并且该文件已经被跟踪了，如果对该文件进行了修改，那么通过 git add 命令可以将修改的内容添加到暂存区中
3. 在合并分支的时候把有冲突的文件标记为已解决状态

执行 git add CONTRIBUTING.md ，然后在执行 git status 

On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   CONTRIBUTING.md
	new file:   README


文件 CONTRIBUTING.md 的修改也被加入到了暂存区中。

## 状态概览 git status -s
git status 命令的输出十分详细，但是其用于有些繁琐。通过 git status -s 或 git status --short 可以的到更加紧凑的输出：
git status -s
M  CONTRIBUTING.md
A  README

文件前面字母解释：
 M: 表示文件被修改过了但是还没有放入到暂存区
A:  新添加的文件放入到了暂存区
M : 表示该文件被修改了并放入了暂存区
??: 新添加未跟踪文件

## 忽略文件 .gitignore 
一般我们总会有些文件无需纳入Git管理，也不希望它们总是出现在未跟踪的文件列表。
通常都是自动生成的文件，比如日志文件，或者编译过程中创建的临时文件等。在这种情况下，我们可以创建一个名字为 .gitignore 的文件，列出要忽略的文件模式。

$ cat .gitignore
*.[ao]
*~

第一行告诉 Git 忽略所有以 .o 或者 .a 结尾的文件。
第二行告诉 Git 忽略所有以 ~ 结尾的文件
此外，可能还需要忽略log，tmp或者pid目录，以及自动生成的文档等等。
要养成一开始就设置好 .gitignore 文件的习惯，以免将来误提交这类无用文件到远程Git仓库上去。

文件 *.gitignore* 的格式规范如下：
* 所有空行或者以 *#* 开头的行都会被 Git 忽略；
* 可以使用标准的 global 模式匹配；
* 匹配模式可以以(/) 开头防止递归；
* 匹配模式可以以（/）结尾指定目录；
* 要忽略指定模式意外的文件或目录，可以在模式前加上惊叹号（i）取反。

什么是 glob 模式：
shell 所使用的简化了的正则表达式。
1. * 匹配零个或者多个任意字符；
2. 【abc] 匹配任何一个列在方括号中的字符（这个例子要么匹配一个 a, 要么匹配一个 b, 要么匹配一个 c);
3. ? 只匹配一个字符
4. 如果在方括号中使用短划线分隔开两个字符，表示所有在这两个字符范围内的都可以匹配([0-9] 表示匹配0到9的数字)
5. 使用两个(\*)表示匹配任意中间目录，比如 'a/**/z' 可以匹配 a/z, a/b/z 或者 a/b/c/z 等

看一个例子：

```bash

# no .a files
*.a

# but do track lib.a, even though you're ignoring .a files above
!lib.a

# only ignore the TODO files in the current directory, not subdir/TODO
/TODO

# ignore all files in the build/ directory
build/

# ignore doc/notes.txt, but not doc/server/arch.txt
doc/*.txt

# ignore all .pdf files in the doc/ directory
doc/**/\*.pdf

```

## 查看已暂存和未暂存的修改
git diff ： 查看尚未暂存的改动；
git diff --cached / --staged 查看已经暂存起来的变化

## 提交更新
$git commit 
这种方式会启动文本编辑器以便输入提交本次的说明信息。默认会启动sell环境变量$EDITOR所指定的软件，一般都是vim或者EMACS。当然可以通过 git config --global core.editor 命令设定你喜欢的编辑器。

$git commit -v 会在文编编辑器中显示 git diff 的输入内容，从而让提交者知道本次提交做了哪些具体的修改。

$git commit -m "this is the first commit"  -m 后面是提交的说明信息


## 跳过使用暂存区
尽管使用暂存区的方式可以精心准备要提交的细节，但是有时候这么做略显繁琐。Git 提供了一个跳过使用暂存区的方式，只要在提交的时候， 给 git commit 加上 -a 选项， Git就会自动把所有已经跟踪过的文件暂存起来一并提交，从而跳过git add 操作。
例如：
$git commit -a -m 'commit msg'

## 移除文件
要从 Git 中移除某个文件，就必须从已跟踪文件清单中移除



















