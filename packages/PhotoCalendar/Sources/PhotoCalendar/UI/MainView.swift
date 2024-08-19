//
//  MainView.swift
//  
//
//  Created by Aleksei Tiurnin on 03.07.2024.
//

import SwiftUI
import PhotoPicker
public struct MainView: View {
    
    @EnvironmentObject private var textParameters: TextParameters
    
    @ObservedObject private var viewModel: MainViewModel

    struct Model {
        var isShowPhotoPicker: Bool = false
        var isShowFontPicker: Bool = false
        var isShowDatePicker: Bool = false
    }
    
    @State private var model: Model = .init()
    
    private let calendarManager: CalendarManager
    
    public init(calendarManager: CalendarManager) {
        self.calendarManager = calendarManager
        viewModel = MainViewModel(date: Date(), calendarManager: calendarManager)
    }
    
    public var body: some View {
        ZStack {
            if  let data = viewModel.image,
                let uiimage = UIImage.init(data: data) {
                ImageZoomDragView(image: Image(uiImage: uiimage))
                    .onTapGesture {
                        model.isShowPhotoPicker.toggle()
                    }
            }
            VStack(alignment: .center, spacing: 4 * textParameters.scale) {
                Text(viewModel.month.name)
                    .font(
                        .custom(
                            textParameters.font,
                            size: 24 * textParameters.scale))
                    .foregroundColor(textParameters.mainTextColor)
                    .clipped()
                    .shadow(
                        color: textParameters.shadowColor,
                        radius: 2)
                    .onTapGesture {
                        model.isShowDatePicker = true
                    }
                HStack(spacing: 8) {
                    if viewModel.showWeekNumber {
                        WeekNumberView(data: " ")
                    }
                    WeekHeaderView(data: viewModel.month.weekSymbols)
                }
                VStack(spacing: 4 * textParameters.scale) {
                    ForEach(viewModel.month.values, id: \.number) { element in
                        HStack(spacing: 8) {
                            if viewModel.showWeekNumber {
                                WeekNumberView(data: "\(element.number)")
                            }
                            WeekView(
                                data: element.values)
                        }
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    model.isShowFontPicker.toggle()
                }
            }
        }
        .sheet(isPresented: $model.isShowPhotoPicker) {
            PhotoPicker(isPresented: $model.isShowPhotoPicker, imageData: $viewModel.image)
        }
        .sheet(isPresented: $model.isShowFontPicker) {
            TextParametersEditorView(
                isBlurred: $viewModel.isBlurred)
        }
        .sheet(isPresented: $model.isShowDatePicker) {
            DateEditorView(
                current: viewModel.current,
                date: $viewModel.date,
                showWeekNumber: $viewModel.showWeekNumber,
                calendarManager: calendarManager)
        }
        .onChange(of: viewModel.date) { newValue in
            viewModel.updateMonth()
        }
        .ignoresSafeArea()
        .statusBar(hidden: true)
        .task {
            await viewModel.load()
        }
    }
}

#Preview {
    MainView(calendarManager: CalendarManager(option: .en))
        .environmentObject(TextParameters())
}
