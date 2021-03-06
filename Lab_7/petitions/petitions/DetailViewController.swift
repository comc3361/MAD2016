//
//  DetailViewController.swift
//  petitions
//
//  Created by Connor McGuinness on 3/15/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!

    @IBOutlet weak var webSpinner: UIActivityIndicatorView!
    
    var detailItem: String?

    func configureView() {
        // Update the user interface for the detail item.
        if let url = detailItem {
            loadWebPage(url)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        webView.delegate = self
        
    }
    
    func loadWebPage(urlString: String) {
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        webSpinner.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        webSpinner.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

