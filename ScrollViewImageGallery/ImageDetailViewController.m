//
//  ImageDetailViewController.m
//  ScrollViewImageGallery
//
//  Created by Livleen Rai on 2017-08-07.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController () <UIScrollViewDelegate>


@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 2.0;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
