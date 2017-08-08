//
//  ViewController.m
//  ScrollViewImageGallery
//
//  Created by Livleen Rai on 2017-08-07.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView.delegate = self;
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.pagingEnabled = YES;
    
    
    UIImageView *image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Image-1"]];
    UIImageView *image2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Image"]];
    UIImageView *image3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    NSArray *images = @[image1, image2, image3];
    
    
    //int i = 0;
    for(UIImageView *imageView in images) {
        /*imageView.frame = CGRectMake(i*_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height); */
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;

       // [_scrollView addSubview:imageView];
        
        //i++;
    }
    
    UIStackView *stackview = [[UIStackView alloc]initWithArrangedSubviews:images];
    stackview.axis = UILayoutConstraintAxisHorizontal;
    stackview.distribution = UIStackViewDistributionFillEqually;
    [_scrollView addSubview:stackview];
    
    stackview.translatesAutoresizingMaskIntoConstraints = NO;
    
    [stackview.heightAnchor constraintEqualToAnchor:_scrollView.heightAnchor multiplier:1].active = YES;
    [stackview.widthAnchor constraintEqualToAnchor:_scrollView.widthAnchor multiplier:images.count].active = YES;
    
    [stackview.topAnchor constraintEqualToAnchor:_scrollView.topAnchor].active = YES;
    [stackview.bottomAnchor constraintEqualToAnchor:_scrollView.bottomAnchor].active = YES;
    [stackview.leadingAnchor constraintEqualToAnchor:_scrollView.leadingAnchor].active = YES;
    [stackview.trailingAnchor constraintEqualToAnchor:_scrollView.trailingAnchor].active = YES;
    
    _pageControl.numberOfPages = images.count;
        
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = _scrollView.frame.size.width;
    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page;
}


@end
