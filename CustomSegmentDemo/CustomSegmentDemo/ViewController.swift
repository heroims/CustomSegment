//
//  ViewController.swift
//  CustomSegmentDemo
//
//  Created by ZhaoYiQi on 14/12/26.
//  Copyright (c) 2014年 ZhaoYiQi. All rights reserved.
//


import UIKit

class ViewController: UIViewController , CustomSegmentDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var obj:CustomSegment=CustomSegment(frame:CGRectMake(10, 10, 280, 30),titles:["123","456","789"],font:UIFont.systemFontOfSize(13),normalColor:UIColor(red: 1, green: 1.0*180/255, blue: 0, alpha: 1),selectColor:UIColor.whiteColor(),borderColor:UIColor(red: 1, green: 1.0*180/255, blue: 0, alpha: 1))
        obj.center=self.view.center
        obj.csdelegate=self
        self.view.addSubview(obj)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func selectSubBtnClick(title: String!, index: Int, sender: AnyObject!) {
        print(title,index)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

