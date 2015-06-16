# Demo
![demo][image-1]

# 使用
- 在ZZToolbar.xib中修改button的样式
- 实现相应的协议方法

# 更多
可以调用下面的方法改变button的样式
1. 在button上添加badges<br>
`- (void)addBadges:(UIButton *)onButton withNumber:(NSUInteger)number;`
2. 在button上显示图片<br>
`- (void)addImagesOnButton:(UIButton *)onButton withImage:(UIImage *)imag    e;`
3. 在button上显示文字(字符串)<br>
`- (void)addNumberOnButton:(UIButton *)onButton withNumber: (NSString *)n    umber;`

# 其它
Thanks:
- CTAssetsPickerController
- HSDatePickerViewController

[image-1]:	http://home.ustc.edu.cn/~sa514014/img/toolbar_demo.gif