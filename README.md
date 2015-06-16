#Demo
![demo](http://home.ustc.edu.cn/~sa514014/img/toolbar_demo.gif)

#使用 
- 在ZZToolbar.xib中修改button的样式
- 实现相应的协议方法

#更多
可以调用下面的方法改变button的样式
1. 在button上添加badges<br>
`- (void)addBadges:(UIButton *)onButton withNumber:(NSUInteger)number;`
2. 在button上显示图片<br>
`- (void)addImagesOnButton:(UIButton *)onButton withImage:(UIImage *)imag    e;`
3. 在button上显示文字(字符串)<br>
`- (void)addNumberOnButton:(UIButton *)onButton withNumber: (NSString *)n    umber;`

#其它
感谢:
- CTAssetsPickerController
- HSDatePickerViewController

#How to use
1. Change the icon you want in ZZToolbar.xib
2. Implement protocol methods

#More
Use the following methods in `viewWillAppear` can modify button with something user selected, like date, images, etc. 

1. `- (void)addBadges:(UIButton *)onButton withNumber:(NSUInteger)number;`
    Add bades on button with this method.
2. `- (void)addImagesOnButton:(UIButton *)onButton withImage:(UIImage *)image;`
    Show a small image on the button.
3. `- (void)addNumberOnButton:(UIButton *)onButton withNumber: (NSString *)number;`
    Show number(or other) on the button.

#Thanks
- CTAssetsPickerController
- HSDatePickerViewController
