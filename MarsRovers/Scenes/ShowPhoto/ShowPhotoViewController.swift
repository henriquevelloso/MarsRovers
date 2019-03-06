//
//  ShowPhotoViewController.swift
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

protocol ShowPhotoDisplayLogic: class
{
  func displaySomething(viewModel: ShowPhoto.Something.ViewModel)
}

class ShowPhotoViewController: UIViewController, ShowPhotoDisplayLogic
{
  var interactor: ShowPhotoBusinessLogic?
  var router: (NSObjectProtocol & ShowPhotoRoutingLogic & ShowPhotoDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = ShowPhotoInteractor()
    let presenter = ShowPhotoPresenter()
    let router = ShowPhotoRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = ShowPhoto.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: ShowPhoto.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
