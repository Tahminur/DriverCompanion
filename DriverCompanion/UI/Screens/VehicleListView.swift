//
//  VehicleListView.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 1/2/26.
//
import SwiftUI

struct VehicleListView: View {
    @StateObject private var viewModel = VehicleListViewModel()
    var body: some View {
        
        NavigationStack{
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.error {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            }
            List(viewModel.vehicles) { vehicle in
                NavigationLink(value: vehicle) {
                    VehicleRowView(vehicle: vehicle)
                }
            }
            .navigationTitle("My Vehicles")
            .navigationDestination(for: Vehicle.self) { vehicle in
                VehicleDetailView(viewModel: VehicleDetailViewModel(vehicle: vehicle))
            }
            .task {
                await viewModel.loadVehicles()
            }
            .onAppear {
                //how it would be in production but currently since this is a mock service the onappear update wouldn't really do anything currently
                Task { await viewModel.loadVehicles() }
            }
        }
    }
}
