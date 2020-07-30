//
//  RemoteImageView.swift
//  Articles
//
//  Created by Suraj on 29/07/20.
//  Copyright © 2020 Suraj. All rights reserved.
//

import Foundation
import SwiftUI

struct RemoteImageView: View {
    @ObservedObject var remoteImageModel: RemoteImageModel
    var defaultImage = UIImage(named: "Profile_Pic")
    
    init(urlString: String?, defaultImageString: String?) {
        self.defaultImage = UIImage(named: defaultImageString!)
        remoteImageModel = RemoteImageModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: remoteImageModel.image ?? self.defaultImage!)
            .resizable()
    }
}

struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView(urlString: nil, defaultImageString: nil)
    }
}
