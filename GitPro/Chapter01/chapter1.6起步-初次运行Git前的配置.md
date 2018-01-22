## 初次运行Git前的配置
Git 自带了 git config 工具来控制Git外观和行为配置变量，这些变量存储在不同的位置：

1. /etc/gitconfig 文件： 包含了系统上每一个用户及他们仓库的通用配置。如果使用 --system 选项 git config 时，它会从此文件读写配置变量。

2. ~/.gitconfig 或者 ~/.config/git/config 文件：只针对当前用户，可以船体 --global 选项让 Git 读写此文件
3. 当前使用仓库的Git目录中 config 文件（就是.git/config)：针对该仓库


### 设置 user.name
git config --global user.name 'my name'

### 设置 user.email
git config --global user.email 'myname@gmail.com'

### 查看配置
git config user.name
git config user.email

### 查看所有配置 
git config --list



global 选项是配置了 用户目录先得 config 文件中的用户名，如果要配置当前的git目录中的用户名和邮箱，只需要进入到当前的git目录先，执行 git config user.name 'myName' & git config user.email 'myName@gmail.com'即可。


