# ECNUThesis-Undergraduate

[![](https://img.shields.io/badge/Overleaf-ECNUthesis-brightgreen.svg)](https://www.overleaf.com/latex/templates/ecnuthesis-latex-thesis-template-for-east-china-normal-university/szppdtkvgvpk)

## 华东师范大学本科生学士学位论文模版

本模版使用 LaTeX3 重构了 [YijunYuan](https://github.com/YijunYuan) 的 [ECNU-Undergraduate-LaTeX](https://github.com/YijunYuan/ECNU-Undergraduate-LaTeX)，
并将个人信息的填写、个性化设置、命令、环境等进行了一定的封装，让使用者可以更加方便地使用 LaTeX 进行创作。

### Ver 0.1.4

1. 更改脚注编号为上标
2. 将摘要等标题加粗，目录标题改为宋体
3. 将页眉改为论文题目，页眉页脚字体改为小五号
4. 将中文“摘要：”的字体改为宋体
5. 将中文关键词的分隔符改为全角逗号
6. 使目录只显示到两级
7. 使附录中的章节不显示在目录中

### Ver 0.1.3

1. 修正了标题字号
2. 改进了输出非打印版 pdf 文件的内嵌页码 (与页脚显示的效果无关)
3. 取消了参考文献输出时缺失出版地的显示
4. 修正了在正文中交叉引用附录的内容时错误的超链接

### Ver 0.1.2

1. 模板中默认添加了对 `bicaption` 和 `booktabs` 两个宏包的引用，前者提供了符合学校要求的双语图表注释，后者提供了三线表所需要的组件。
2. 修正了附录中章节的编号及显示。
3. 修正了英文摘要及关键词的字体。

### Ver 0.1.1

在 `style` 设置中增加了 `fontMath` 的设置接口，以便使用者更加方便地更换数学公式字体。

## 使用环境

本模版只能使用 XeLaTeX 进行编译，使用其它 LaTeX 引擎将会导致编译失败。所以请安装最新版的 TeX Live ，并使用 XeLaTeX 进行编译。

若您的个人计算机中仍安装了老旧的 CTeX 套装，请毫不犹豫地卸载它，并安装最新版的 TeX Live。

## 使用方法

请移步 [Wiki](https://github.com/Koyamin/ECNUThesis-Undergraduate/wiki) 阅读相关文档。

**注意：为了保证正确的参考文献显示，请使用 `latexmk` 命令编译！！！**

## 不足与改进

本模版仍有一些不足与值得改进之处。已知的不足如下所示。

- 尾注功能未实现；
- 附录中 `\caption` 不会另起新页
- ……

## 参考

- Kunth D E. 的 The TeXBook: Computers & Typesetting.
- CTEX.ORG 的 CTeX 宏集手册
- CTEX.ORG 的 xeCJK 宏包
- The LaTeX3 Project 的 The LaTeX3 Sources
- [stone-zeng](https://github.com/stone-zeng) 的 [fduthesis](https://github.com/stone-zeng/fduthesis)
- [YijunYuan](https://github.com/YijunYuan) 的 [ECNU-Undergraduate-LaTeX](https://github.com/YijunYuan/ECNU-Undergraduate-LaTeX)

## 软件许可证

华东师范大学校徽图案 (`inner-cover(contains_font).eps`) 版权归华东师范大学所有。

其他部分使用 LPPL 授权。
