//
//  StagePagerView.swift
//  SEKITOBA
//
//  Created by 南京兵 on 2023/05/05.
//

import SwiftUI

struct StagePagerView: View {
  var body: some View {
    TabView {
      StagesView(store:
          .init(
            initialState: StageState(),
            reducer: StageReducer.reducer(),
            environment: StageEnvironment(
              matchType: .bankaraChallenge,
              timeZone: .schedule
            )
          )
      )
      StagesView(store:
          .init(
            initialState: StageState(),
            reducer: StageReducer.reducer(),
            environment: StageEnvironment(
              matchType: .bankaraOpen,
              timeZone: .schedule
            )
          )
      )
    }
    .ignoresSafeArea(edges: .bottom)
    .tabViewStyle(PageTabViewStyle())
    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    .onAppear {
      LocalPushNotification.shared.removeAllPendingNotificationRequests()
      LocalPushNotification.shared.showPushPermit()
    }
  }
}

struct StagePagerView_Previews: PreviewProvider {
  static var previews: some View {
    StagePagerView()
  }
}
