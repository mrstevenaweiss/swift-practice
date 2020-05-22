//
//  DetailViewController.swift
//  Project7
//
//  Created by steven weiss on 5/9/20.
//  Copyright © 2020 Mr Steven A Weiss. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?

    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        // Injecting HTML into the webView
        super.viewDidLoad()
        guard let detailItem = detailItem else { return }

        let html = """
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <style> body { font-size: 150%; } </style>
            </head>
        <body>
            \(detailItem.body)
        </body>
        </html>
        """

        webView.loadHTMLString(html, baseURL: nil)
    }
}
