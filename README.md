#Demo
![demo](http://home.ustc.edu.cn/~sa514014/img/toolbar_demo.gif)

#使用 
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

#其它
感谢:
- CTAssetsPickerController
- HSDatePickerViewController

#How to use
1. Change the icon you want in ZZToolbar.xib
2. Implement protocol methods

#More
Use the following methods(in `viewWillAppear`)can modify button. 

1. Add bades on button with this method.  
`- (void)addBadges:(UIButton *)onButton withNumber:(NSUInteger)number;`  
2. Show a small image on the button.  
`- (void)addImagesOnButton:(UIButton *)onButton withImage:(UIImage *)image;`
3. Show number(or other) on the button.  
`- (void)addNumberOnButton:(UIButton *)onButton withNumber: (NSString *)number;`
    

#Thanks
- CTAssetsPickerController
- HSDatePickerViewController
