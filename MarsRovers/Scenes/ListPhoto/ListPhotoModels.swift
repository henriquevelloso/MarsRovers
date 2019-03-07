//
//  ListPhotoModels.swift
//  MarsRovers
//
//  Created by Henrique Velloso on 06/03/19.
//  Copyright (c) 2019 Henrique Velloso. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum ListPhoto
{
  // MARK: Use cases
  
  enum Load
  {
    struct Request
    {
        var rover: String
        var earthDate: String
    }
    struct Response
    {
        var photos: [Photo]
    }
    struct ViewModel
    {
        var photos: [Photo]
    }
  }
}
