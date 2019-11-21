//
//  SDAnimatedImageBugTestView.swift
//  Floatr-SwiftUI
//
//  Created by Tyson Parks on 11/20/19.
//  Copyright © 2019 Tyson Parks. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct SDAnimatedImageBugTestView: View {
  
  private var url: URL {
    let urlImages = TestImages.urlImages
    let first = URL(string: urlImages.first!)!
    let last = URL(string: urlImages.last!)!
    return self.$toggle.wrappedValue == false ? first : last
  }
  
  private var name: String {
    let namedImages = TestImages.namedImages
    let first = namedImages.first!
    let last = namedImages.last!
    return self.$toggle.wrappedValue == false ? first : last
  }
  
  @State private var toggle: Bool = false
  @State private var playbackSpeed: Double = 1.0
  
  var body: some View {
    VStack {
      
      Text("SDWebImageSwiftUI Tests:").bold()
      
      Divider()
      
      HStack(alignment: .top) {
        
        // MARK:  Test using WebImage
        //        VStack {
        //
        //          Text("WebImage").bold()
        //
        //          WebImage(url: self.url)
        //            .resizable()
        //            .scaledToFit()
        //        }
        
        // MARK:  Test using AnimatedImage(url:)
        VStack {
          
          Text("AnimatedImage(url:)")
            .font(Font.system(size: 16, weight: .bold, design: .default))
          
          AnimatedImage(url: self.url)
            .playBackRate(self.playbackSpeed)
            .resizable()
            .scaledToFit()
          
          Text(verbatim: "Active url:")
            .font(Font.system(size: 16, weight: .bold, design: .default))
          
          Text(self.url.absoluteString)
            .font(Font.system(size: 12))
        }
        
        // MARK:  Test using AnimatedImage(name:)
        VStack {
          
          Text("AnimatedImage(name:)")
            .font(Font.system(size: 16, weight: .bold, design: .default))
          
          AnimatedImage(name: name)
            .playBackRate(self.playbackSpeed)
            .resizable()
            .scaledToFit()
          
          Text(verbatim: "Active name:")
            .font(Font.system(size: 16, weight: .bold, design: .default))
          
          Text(self.name).font(Font.system(size: 12))
        }
      }
      .padding()
      
      
      
      // MARK:  Button and Active url Section
      Button(action: {
        self.$toggle.wrappedValue.toggle()
      }) {
        Text(verbatim: "Toggle images")
          .bold()
          .padding()
          .background(Color.green)
          .cornerRadius(10)
      }
      
      //      Spacer()
      
      
      
      
      
      HStack {
        Slider(value: self.$playbackSpeed, in: (0.1...4.0), step: 0.1)
        
        Text(
          String(format: "Speed: %.1f", Double(self.$playbackSpeed.wrappedValue))
        )
      }
      .padding(.top)
      .padding(.horizontal)
      
      
      
      // MARK:  Test Images Section
      //      Divider()
      //
      //      Text(verbatim: "Test Images:")
      //        .bold()
      //
      //      HStack {
      //
      //        VStack {
      //          AnimatedImage(url: TestData.gifUrlOne)
      //            .resizable()
      //            .scaledToFit()
      //
      //          Text(TestData.gifUrlOne.absoluteString)
      //        }
      //
      //        VStack {
      //          AnimatedImage(url: TestData.gifURLTwo)
      //            .resizable()
      //            .scaledToFit()
      //
      //          Text(TestData.gifURLTwo.absoluteString)
      //        }
      //      }
      //      .padding()
    }
    
  }
}



// MARK: -
struct SDAnimatedImageBugTestView_Previews: PreviewProvider {
  static var previews: some View {
    SDAnimatedImageBugTestView()
  }
}


// MARK: -
struct TestImages {
  
  static let namedImages = [
    "Lofty_TysonParks_APNG.png",
    "SensualSoother_TysonParks_APNG.png"
  ]
  
  static let urlImages = [
    "https://66.media.tumblr.com/39d146a70b35fa6091676a26ded3df2e/tumblr_nwy7ieS7RK1tfsn81o1_400.gif",
    "https://66.media.tumblr.com/f95bf826fdd491aa57c8d5b248b1b4b3/tumblr_ntto3ambS71tfsn81o1_500.gif"
  ]
  
}
