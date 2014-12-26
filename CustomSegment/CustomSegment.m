//
//  CustomSegment.m
//  GameCollege
//
//  Created by ZhaoYiQi on 14/11/6.
//  Copyright (c) 2014年 ZhaoYiQi. All rights reserved.
//

#import "CustomSegment.h"

@interface CustomSegmentButton : UIButton

@property(nonatomic,retain)UIColor *SelectColor;

@end

@implementation CustomSegmentButton

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        [self setBackgroundColor:_SelectColor];
    }
    else{
        [self setBackgroundColor:[UIColor clearColor]];
    }
}

@end

@interface CustomSegment(){
    NSInteger selectIndex;
}

@property(nonatomic,retain)UIColor *borderColor;
@property(nonatomic,retain)NSArray *titles;

@end

@implementation CustomSegment

@synthesize csdelegate=_csdelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame titles:(NSArray*)titles font:(UIFont*)font normalColor:(UIColor*)normalColor selectColor:(UIColor*)selectColor borderColor:(UIColor*)borderColor{
    self=[super initWithFrame:frame];
    if (self) {
        self.clipsToBounds=YES;
        self.layer.masksToBounds=YES;
        self.layer.cornerRadius=8;
        self.layer.borderWidth=1;
        self.layer.borderColor=[borderColor CGColor];
        self.backgroundColor=[UIColor whiteColor];
        
        self.borderColor=borderColor;
        self.titles=titles;
        NSInteger count=_titles.count;
        for (int i=0; i<count; i++) {
            CustomSegmentButton *subBtn=[CustomSegmentButton buttonWithType:UIButtonTypeCustom];
            subBtn.titleLabel.font=font;
            subBtn.tag=1000+i;
            subBtn.SelectColor=borderColor;
            subBtn.frame=CGRectMake(frame.size.width/count*i, 0, frame.size.width/count, frame.size.height);
            [subBtn setTitle:titles[i] forState:UIControlStateNormal];
            [subBtn setTitleColor:normalColor forState:UIControlStateNormal];
            [subBtn setTitleColor:selectColor forState:UIControlStateSelected];
            [subBtn addTarget:self action:@selector(subBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:subBtn];
        }
        
        self.autoresizesSubviews=NO;
        
        ((UIButton*)self.subviews[0]).selected=YES;
        selectIndex=0;
    }
    return self;
}

-(void)setSelectSubBtn:(NSInteger)index{
    
    for (UIButton *subBtn in self.subviews) {
        if (subBtn.tag!=100001) {
            subBtn.selected=NO;
            if (subBtn.tag%1000==index) {
                subBtn.selected=YES;
                [self subBtnClick:subBtn];
            }
        }
    }
}

-(void)subBtnClick:(UIButton*)sender{
    for (UIButton *subBtn in self.subviews) {
        if (subBtn.tag!=100001) {
            subBtn.selected=NO;
            if (subBtn.tag==sender.tag) {
                subBtn.selected=YES;
            }
        }
    }
    selectIndex=sender.tag%1000;
    
    if (_csdelegate!=nil&&[_csdelegate respondsToSelector:@selector(selectSubBtnClick:index:sender:)]) {
        [_csdelegate selectSubBtnClick:sender.titleLabel.text index:selectIndex sender:self];
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [_borderColor CGColor]);
    CGContextSetLineWidth(context, 1);
    CGContextSetShouldAntialias(context, YES);

    NSInteger count=_titles.count;
    for (int i=0; i<count-1; i++) {
        CGContextMoveToPoint(context, self.frame.size.width/count*(i+1), 0);
        CGContextAddLineToPoint(context, self.frame.size.width/count*(i+1), self.frame.size.height);
        CGContextDrawPath(context, kCGPathStroke);
    }

}


@end
