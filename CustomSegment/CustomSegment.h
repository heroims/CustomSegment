//
//  CustomSegment.h
//  GameCollege
//
//  Created by ZhaoYiQi on 14/11/6.
//  Copyright (c) 2014年 ZhaoYiQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomSegmentDelegate <NSObject>

-(void)selectSubBtnClick:(NSString*)title index:(NSInteger)index sender:(id)sender;

@end

@interface CustomSegment : UIView{
    __unsafe_unretained id<CustomSegmentDelegate> _csdelegate;
}

@property(nonatomic,assign)id<CustomSegmentDelegate> csdelegate;

-(id)initWithFrame:(CGRect)frame titles:(NSArray*)titles font:(UIFont*)font normalColor:(UIColor*)normalColor selectColor:(UIColor*)selectColor borderColor:(UIColor*)borderColor;

-(void)setSelectSubBtn:(NSInteger)index;

@end
