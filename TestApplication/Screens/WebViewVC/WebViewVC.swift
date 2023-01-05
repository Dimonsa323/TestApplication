//
//  WebViewVC.swift
//  TestApplication
//
//  Created by Дима Губеня on 03.01.2023.
//

import UIKit
import WebKit

protocol WebViewProtocol {
    
}

class WebViewVC: UIViewController, WKNavigationDelegate, WebViewProtocol {

    var webView: WKWebView!
    private let url: String
    
    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let urlInfo = URL(string: url)  else { return }
        webView.load(URLRequest(url: urlInfo))
        webView.allowsBackForwardNavigationGestures = true
    }
}
