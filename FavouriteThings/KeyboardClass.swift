//
//  KeyboardClass.swift
//  FavouriteThings
//
//  Created by Mitchell Gorham on 13/5/20.
//  Copyright © 2020 Mitchell Gorham. All rights reserved.
//

import SwiftUI

class Keyboard: ObservableObject {
    @Published var frame = CGRect ()
    var x: Int { Int(frame.origin.x) }
    var y: Int { Int(frame.origin.y) }
    var w: Int { Int(frame.size.width) }
    var h: Int { Int(frame.size.height) }
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        //print("Keyboard Active")
        guard let rect = notification.userInfo?[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        frame = rect
    }
    
    @objc func keyboardDidHide(notification: Notification) {
        //print("Keyboard Hidden")
        frame = .zero
    }
}
