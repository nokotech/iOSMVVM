//
//  Page1ViewController.swift
//  iOSMVVM
//
//  Created by takenaka on 2018/05/15.
//  Copyright © 2018年 nokotech inc. All rights reserved.
//
import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class Page1ViewController: BaseViewController {
    
    /** Presenter */
    var presenter: Page1Presenter?
    
    /** UI */
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    /**
     * Dependency Injection
     */
    override func inject() {
        super.inject()
        presenter = Page1Presenter()
    }
    
    /**
     *data binding
     */
    override func databinding() {
        super.databinding()
        textField.rx.text.orEmpty.bind(to: presenter!.viewModel.text1).disposed(by: rx.disposeBag)
        presenter!.viewModel.text2.asObservable().bind(to: label.rx.text).disposed(by: rx.disposeBag)
        button.rx.tap.asObservable().bind(onNext: { () in self.presenter?.onTouchEvent() }).disposed(by: rx.disposeBag)
    }
    
    /**
     * 初期描画
     */
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
     * 画面遷移
     */
    public func instantiateViewControllerWithMessage(string: NSString?) -> UIViewController {
        let storyBoard: UIStoryboard = R.storyboard.page1()
        let vc: UIViewController = storyBoard.instantiateViewController(withIdentifier: "Page1")
        return vc
    }
}
