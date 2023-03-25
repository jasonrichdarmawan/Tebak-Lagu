//
//  CoreMotionPreview.swift
//  Tebak Lagu
//
//  Created by Jason Rich Darmawan Onggo Putra on 25/03/23.
//

import SwiftUI

struct CoreMotionPreview: View {
    @EnvironmentObject var routerViewModel: RouterViewModel
    
    var body: some View {
        VStack {
            Text("Core Motion View")
            Button(
                action: {
                    AltimeterListener.ToggleVerbose()
                },
                label: {
                    Text("Toggle Altimeter Verbose")
                }
            )
            .padding()
            Button(
                action: {
                    MotionManagerListener.ToggleVerbose()
                },
                label: {
                    Text("Toggle MotionManager Verbose")
                }
            )
            .padding()
            Button(
                action: {
                    CoreMotionListener.StartListening(
                        cameUp: {
                            print("cameUp", Int.random(in: 1...100))
                        },
                        cameDown: {
                            print("cameDown", Int.random(in: 1...100))
                        },
                        tiltedLeft: {
                            print("tiltedLeft", Int.random(in: 1...100))
                        },
                        tiltedRight: {
                            print("tiltedRight", Int.random(in: 1...100))
                        }
                    )
                },
                label: {
                    Text("Start Core Motion")
                }
            )
            .padding()
            Button(
                action: {
                    CoreMotionListener.StopListening()
                },
                label: {
                    Text("Stop Core Motion")
                }
            )
            .padding()
            Button(
                action: {
                    routerViewModel.currentView = .StarterView
                },
                label: {
                    Text("Go Back")
                }
            )
            .padding()
        }
    }
}

struct CoreMotionView_Previews: PreviewProvider {
    @StateObject static private var routerViewModel = RouterViewModel()
    
    static var previews: some View {
        CoreMotionPreview()
            .environmentObject(routerViewModel)
    }
}
