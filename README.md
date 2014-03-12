DragButton
============

DragButton is a subclass of UIButton. It can be dragged in the view.

![](DragButton.gif)

---
##Usage#
The usage is like UIButton's.

```Obj-c
	DragButton *bt_drag = [[DragButton alloc]initWithFrame:CGRectMake(20, 20, 64, 64)];
	[bt_drag setImage:[UIImage imageNamed:@"Ubuntu.png"] forState:UIControlStateNormal];
	[bt_drag addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:bt_drag];
```

