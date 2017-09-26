//
//  ViewController.swift
//  simplewebbrowser
//
//  Created by Asyraf Hussin on 27/09/2017.
//  Copyright © 2017 Asyraf Hussin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UIWebViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func back(_ sender: Any) {
        if(webView.canGoBack){
            webView.goBack()
        }
    }
    
    @IBAction func next(_ sender: Any) {
        if(webView.canGoForward){
            webView.goForward()
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        webView.reload()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        var searchText = searchBar.text
        
        if(searchText?.lowercased().range(of: "https://") == nil || searchText?.lowercased().range(of: "http://") == nil){
            searchText = "http://"+searchText!
        }

        if let url = URL(string: searchText!){
            webView.loadRequest(URLRequest(url: url))
        }else{
            print("Error")
        }
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.loadRequest(URLRequest(url: URL(string: "https://www.google.com")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

