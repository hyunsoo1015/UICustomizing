//
//  CustomNavigationBar.swift
//  UICustomizing
//
//  Created by 김현수 on 2020/09/18.
//  Copyright © 2020 Hyun Soo Kim. All rights reserved.
//

import UIKit

class CustomNavigationBar: UINavigationBar {
    
    //높이로 사용할 값을 설정
    var customHeight: CGFloat = 200
    
    //크기를 설정하는 메소드 재정의
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: customHeight)
    }
    
    //하위 뷰들의 배치를 해주는 메소드
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //상태 바의 높이를 가져옴
        let y = UIApplication.shared.statusBarFrame.height
        frame = CGRect(x: frame.origin.x, y: y, width: frame.size.width, height: customHeight)
        
        //모든 하위 뷰들을 순회
        for subView in self.subviews {
            var stringFromClass = NSStringFromClass(subView.classForCoder)
            if stringFromClass.contains("Background") {
                subView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: customHeight)
                subView.backgroundColor = self.backgroundColor
            }
            
            stringFromClass = NSStringFromClass(subView.classForCoder)
            if stringFromClass.contains("BarContent") {
                subView.frame = CGRect(x: 0, y: 20, width: self.frame.width, height: customHeight)
                subView.backgroundColor = self.backgroundColor
            }
        }
    }
}
