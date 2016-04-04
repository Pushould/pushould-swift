//
//  ViewController.swift
//  pushould-swift
//
//  Created by Yu Hoshino on 04/04/2016.
//  Copyright (c) 2016 Yu Hoshino. All rights reserved.
//

import UIKit
import pushould_swift

class ViewController: UIViewController {
    let pushould = Pushould(url: "your_api_url", client_token: "your_client_token")

    override func viewDidLoad() {
        super.viewDidLoad()

        let channel = pushould.subscribe("private area")
        channel.bind("send", function: { data, ack in
            print(data)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}