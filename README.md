# Demo
![demo][http://home.ustc.edu.cn/~sa514014/img/toolbar_demo.gif]

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
>>>>>>> c4398d57f5d6312445026dc32e8e08d83f4d3f26

# 其它
Thanks:
- CTAssetsPickerController
- HSDatePickerViewController

