#关于
一个类似于Day One编辑界面的键盘的toolbar.

# Demo
![效果图](http://home.ustc.edu.cn/~sa514014/img/toolbar.gif)

# 使用
- 在ZZToolbar.xib中修改button的样式
- 实现相应的协议方法

#更多
可以调用下面的方法改变button的样式  
1. 在button上添加badges  
`- (void)addBadges:(UIButton *)onButton withNumber:(NSUInteger)number;`  
2. 在button上显示图片  
`- (void)addImagesOnButton:(UIButton *)onButton withImage:(UIImage *)image;`  
3. 在button上显示文字(字符串)  
`- (void)addNumberOnButton:(UIButton *)onButton withNumber: (NSString *)number;`


# 其它
Thanks:
- CTAssetsPickerController
- HSDatePickerViewController

