//
//  ViewController.swift
//  RxLocation
//
//  Created by ShabanKamell on 06/11/2019.
//  Copyright (c) 2019 ShabanKamell. All rights reserved.
//

import UIKit
import RxLocation
import RxSwift

class ViewController: UIViewController {
    private var rxLocation: RxLocation?
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        rxLocation =  RxLocation(authorization: .authorizeAlways)

        rxLocation?.requestCurrentLocation()
                .subscribe(onNext: { location in
                    print(location)
                }).disposed(by: disposeBag)
    }

    deinit {
        // this is useful only in case of using .requestLocationUpdates()
        rxLocation?.stopLocationUpdates()
    }

}

