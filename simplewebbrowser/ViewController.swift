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
    
    // function to go back webview
    @IBAction func back(_ sender: Any) {
        if(webView.canGoBack){
            webView.goBack()
        }
    }
    
    // funtion to go forward webview
    @IBAction func next(_ sender: Any) {
        if(webView.canGoForward){
            webView.goForward()
        }
    }
    
    // function to refresh webview
    @IBAction func refresh(_ sender: Any) {
        webView.reload()
    }
    
    // function to handle click search bar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        var searchText = searchBar.text
        
        // check if input url have https or https
        // if not will append http
        if(searchText?.lowercased().range(of: "https://") == nil || searchText?.lowercased().range(of: "http://") == nil){
            searchText = "http://"+searchText!
        }
        
        // check url and load the url
        if let url = URL(string: searchText!){
            webView.loadRequest(URLRequest(url: url))
        }else{
            print("Error")
        }
    }
    
    // show loading when load url
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    // hide loading when finished load url
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // go to goole as default url
        webView.loadRequest(URLRequest(url: URL(string: "https://www.google.com")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

