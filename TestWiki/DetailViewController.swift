//
//  DetailViewController.swift
//  TestWiki
//
//  Created by Alexsander Khitev on 9/7/16.
//  Copyright © 2016 Alexsander Khitev. All rights reserved.
//

import UIKit
import SVProgressHUD

class DetailViewController: UIViewController, UIWebViewDelegate {
    
    // MARK: - UI elements 
    private let webView = UIWebView(frame: CGRectZero)
    
    // MARK: - Data
    var url = NSURL()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // ui functions
        addUIElements()
        // request functions
        loadWikiPage()
    }
    
    // MARK: - Override functions
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUIElementsPositions()
    }

    // MARK: - UI Functions 
    private func addUIElements() {
        view.addSubview(webView)
    }
 
    private func setupUIElementsPositions() {
        webView.frame = view.frame
    }
    
    private func hideProgress() {
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
    }
    
    // MARK: - Request functions
    
    private func loadWikiPage() {
        webView.delegate = self
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
        SVProgressHUD.show()
    }
    
    
    // MARK: - WebView Delegate
    func webViewDidStartLoad(webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        hideProgress()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        hideProgress()
    }

}
