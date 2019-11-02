//
//  Configuration.swift
//  GlideUI
//
//  Created by Osama Naeem on 24/10/2019.
//  Copyright © 2019 NexThings. All rights reserved.
//

import UIKit

class Configuration: GlideConfiguration {
    var segmented: Bool = true
    var segmentHeightDictionary: [State : CGFloat] = [State.open : 700,
                                                      State.compressed : 300,
                                                      State.closed : 0]
    
    var concreteDimension: GlideConcreteDimension = .fullScreen
    var popUpIndicator: Bool = true
}
