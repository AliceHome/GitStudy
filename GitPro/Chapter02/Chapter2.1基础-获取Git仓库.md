#Git基础 - 获取Git仓库

## 获取 Git 仓库

### 从现有目录中初始化仓库
如果你打算使用 Git 来对现有的项目进行管理，你只需要进入该项目目录并输入：
$git init
该命令将创建一个名为 .git 的子目录，这个子目录含有你初始化git仓库中所有的必须文件，这些文件是Git的主要文件。
但是这个时候，我们仅仅是做了Git的初始化操作，在仓库中的项目文件并没有被跟踪。

git add 命令实现对指定文件的跟踪
git commit 将跟踪的信息进行提交成快照


### 克隆现有的仓库
$git clone https://github.com/libgit2/libgit2

克隆远程仓库的时候，自定义本地仓库名字：

$git clone https://github.com/libgit2/libgit2 mylibgit



