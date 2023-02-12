//
//  OnBoardingItem.swift
//  finalcialapp
//
//  Created by Keiner Calpabire on 10/02/23.
//  Copyright © 2023 Keiner Calpabire. All rights reserved.
//

import UIKit

class OnBoardingItem{

    private var title : String?
    private var description : String?
    private var imageUrl : String?
    
    public func getTitle () -> String{
        return self.title!
    }
    
    public func getDescription () -> String{
        return self.description!
    }
    
    public func getImageUrl () -> String{
        return self.imageUrl!
    }
    
    init(){
        
    }
    
    init(title : String, description : String, imageUrl : String){
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
    }
    
}
