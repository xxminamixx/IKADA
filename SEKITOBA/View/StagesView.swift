//
//  StagesView.swift
//  SEKITOBA
//
//  Created by 南京兵 on 2023/05/04.
//

import SwiftUI
import ComposableArchitecture

struct StagesView: View {
  let store: Store<StageState, StageAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        Text(viewStore.matchType.description)
          .font(.title)
          .fontWeight(.heavy)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading, 16)
        List(viewStore.results) { result in
          section(startTime: result.startTime, rule: result.rule, stages: result.stages)
        }
      }
      .onAppear {
        viewStore.send(.getStage)
      }
    }
  }
  
  @ViewBuilder
  func section(
    startTime: Date?,
    rule: StageData.Rule?,
    stages: [StageData.StageElement]?
  ) -> some View {
    Section {
      stageRow(imageURL: stages?.first?.image, stageName: stages?.first?.name)
      stageRow(imageURL: stages?.last?.image, stageName: stages?.last?.name)
    } header: {
      stageHeader(startTime: startTime, rule: rule)
    }
  }
  
  @ViewBuilder
  func stageHeader(startTime: Date?, rule: StageData.Rule?) -> some View {
    VStack(alignment: .leading) {
      Text("\(startTime?.time ?? "")〜")
        .fontWeight(.heavy)
        .font(.title)
      Text(rule?.name ?? "")
        .font(.headline)
    }
  }
  
  @ViewBuilder
  func stageRow(imageURL: URL?, stageName: String?) -> some View {
    HStack {
      AsyncImage(url: imageURL) { image in
        image.resizable().scaledToFill()
      } placeholder: {
        ProgressView()
      }
      .frame(width: 64, height: 64)
      .cornerRadius(8)
      Text(stageName ?? "")
    }
  }
}

struct StagesView_Previews: PreviewProvider {
  static var previews: some View {
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
  }
}
